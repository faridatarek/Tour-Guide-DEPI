import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';

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
      "image": "https://img.youm7.com/ArticleImgs/2023/3/22/122146-%D8%AA%D8%B7%D9%88%D9%8A%D8%B1-%D9%85%D8%B3%D8%AC%D8%AF-%D8%B9%D9%85%D8%B1%D9%88-%D8%A8%D9%86-%D8%A7%D9%84%D8%B9%D8%A7%D8%B5--(11).jpeg",
      "visitDate": DateTime.now().add(const Duration(days: 1)),
    },
    {
      "name": "قلعة صلاح الدين",
      "image": "https://trojantravel.usc.edu/wp-content/uploads/2022/05/SHS_1190228119_MosqueofMuhammad_Cairo.jpg",
      "visitDate": DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      "name": "مسجد أحمد بن طولون",
      "image": "https://www.shutterstock.com/image-photo/ablution-fountain-ibn-tulun-mosque-600nw-2407467479.jpg",
      "visitDate": DateTime.now().add(const Duration(days: 2)),
    },
    {
      "name": "معبد الكرنك ",
      "image": "https://th.bing.com/th/id/OIP.NTPpHvrbMdUAlZ5YI0U9SwHaE7?rs=1&pid=ImgDetMain",
      "visitDate": DateTime.now().add(const Duration(days: 10)),
    },
    {
      "name": "خان الخليلى",
      "image":'https://yallabook.com/blog/admincp/userfiles/%D8%AE%D8%A7%D9%86-%D8%A7%D9%84%D8%AE%D9%84%D9%8A%D9%84%D9%8A.jpg',

      "visitDate": DateTime.now().add(const Duration(days: 15)),
    },
  ];

  List<Map<String, dynamic>> favorites = [
    {
      "name": "برج القاهرة",
      "image": "https://www.urtrips.com/wp-content/uploads/2023/03/cairo-tower44.jpg",
    },
    {
      "name": "أهرامات الجيزة",
      "image": "https://media.istockphoto.com/id/1443840209/photo/the-great-sphinx-panorama-by-the-pyramids-of-egypt-sunset-view-giza.webp?b=1&s=170667a&w=0&k=20&c=G2K9lWRy0YQlH3liyrNQ0bQQKfUAaD08Zf935yyJQUY=",
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "زياراتي",)),
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
                buildList(favorites, isVisitTab: false)

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
          SizedBox(width: 10.w,),
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
              Text(title, style: TextStyles.font14BrownBold.copyWith(fontSize: 20.sp)),
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
              Image.network(
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
              Positioned(
                top: 3,
                left: 3,
                child: IconButton(
                  onPressed: () {

                  },
                  icon: SvgPicture.asset(
                    ImagePaths.favIconPath,
                    color:
                        ColorManager.brown2Color,

                    height: 50.h,
                    width: 50.w,
                  ),
                ),
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
                  child:    Container(
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
        title: Center(
          child: Text('تأكيد الإلغاء',
              style: TextStyles.font18Brown2ExtraBold.copyWith(
                fontSize: 22.sp,
                color: ColorManager.darkOrangeColor
              )),
        ),
        content: Text('هل أنت متأكد أنك تريد إلغاء هذه الزيارة؟',
            style: TextStyles.font18Brown2ExtraBold.copyWith(
              fontSize: 22.sp,
            )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Text(
                    'لا',
                    style: TextStyles.font18Brown2ExtraBold.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Icon(Icons.close,color: ColorManager.darkOrangeColor,),

                ],
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  visits.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text('نعم',
                      style: TextStyles.font18Brown2ExtraBold.copyWith(
                        fontSize: 22.sp,
                      )),
                  SizedBox(width: 5.w,),
                  Icon(Icons.check,color: Colors.green,),

                ],
              ),
            ),
          ],)

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