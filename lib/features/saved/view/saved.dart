import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class VisitsScreen extends StatefulWidget {
  const VisitsScreen({super.key});

  @override
  State<VisitsScreen> createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 3;

  List<Map<String, dynamic>> visits = [
    {
      "name": "مسجد عمرو بن العاص",
      "image": "assets/images/img.png",
      "visitDate": DateTime.now().add(const Duration(days: 1)),
    },
    {
      "name": "قلعة صلاح الدين",
      "image": "assets/images/img.png",
      "visitDate": DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      "name": "مسجد أحمد بن طولون",
      "image": "assets/images/img.png",
      "visitDate": DateTime.now().add(const Duration(days: 2)),
    },
    {
      "name": "قلعة صلاح الدين",
      "image": "assets/images/img.png",
      "visitDate": DateTime.now().add(const Duration(days: 10)),
    },
    {
      "name": "قلعة صلاح الدين",
      "image": "assets/images/img.png",
      "visitDate": DateTime.now().add(const Duration(days: 15)),
    },
  ];

  List<Map<String, dynamic>> favorites = [
    {
      "name": "برج القاهرة",
      "image": "assets/images/img.png",
    },
    {
      "name": "الأهرامات",
      "image": "assets/images/img.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 8),
          buildTabBar(),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildList(visits, isVisitTab: true),
                buildList(favorites, isVisitTab: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorManager.beigeColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          buildTabButton('المفضلة', 1, Icons.favorite),
          buildTabButton('زيارتي', 0, Icons.bookmark_added),
        ],
      ),
    );
  }

  Widget buildTabButton(String title, int index, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _tabController.animateTo(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: _tabController.index == index
                ? ColorManager.primaryColor
                : ColorManager.lightBeigeColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: ColorManager.brownColor),
              const SizedBox(width: 6),
              Text(title, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(List<Map<String, dynamic>> items,
      {required bool isVisitTab}) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        bool isPastVisit = false;
        if (isVisitTab && item["visitDate"] != null) {
          isPastVisit = item["visitDate"].isBefore(DateTime.now());
        }

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
          color: isPastVisit ? Colors.grey[300] : ColorManager.lightBeigeColor,
          child: Stack(
            children: [
              Image.asset(
                item['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: ColorManager.lightBeigeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item["name"],
                      style: TextStyles.font16BrownBold,
                      textAlign: TextAlign.center,
                    )),
              ),
              if (isVisitTab && !isPastVisit)
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => showCancelDialog(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: ColorManager.darkOrangeColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text('إلغاء',
                          style: TextStyles.font22whiteExtraBold.copyWith(
                            fontSize: 22.sp,
                          )),
                    ),
                  ),
                ),
              if (isVisitTab && isPastVisit)
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'تمت الزيارة ✅',
                      style: TextStyles.font22whiteExtraBold.copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ),
              if (isVisitTab && !isPastVisit)
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorManager.lightBeigeColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      getVisitDateText(item["visitDate"]),
                      style: TextStyles.font14BrownBold.copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void pickDateAndAddVisit() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        visits.add({
          "name": "مكان جديد",
          "image": "assets/images/logo.png",
          "visitDate": picked,
        });
      });
    }
  }

  void showCancelDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('تأكيد الإلغاء',
            style: TextStyles.font22whiteExtraBold.copyWith(
              fontSize: 22.sp,
            )),
        content: Text('هل أنت متأكد أنك تريد إلغاء هذه الزيارة؟',
            style: TextStyles.font22whiteExtraBold.copyWith(
              fontSize: 22.sp,
            )),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'لا',
              style: TextStyles.font22whiteExtraBold.copyWith(
                fontSize: 22.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                visits.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text('نعم',
                style: TextStyles.font22whiteExtraBold.copyWith(
                  fontSize: 22.sp,
                )),
          ),
        ],
      ),
    );
  }

  String getVisitDateText(DateTime visitDate) {
    final now = DateTime.now();
    final difference =
        visitDate.difference(DateTime(now.year, now.month, now.day)).inDays;

    if (difference == 1) {
      return 'غدًا';
    } else if (difference == 2) {
      return 'يومان';
    } else {
      return DateFormat('yyyy-MM-dd').format(visitDate);
    }
  }
}
