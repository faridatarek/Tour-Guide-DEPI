import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/core/widgets/custom_appBar.dart';
import 'package:tour_guide/features/saved/data/models/favourite_model.dart';
import 'package:tour_guide/features/saved/data/models/visit_model.dart';

class VisitsScreen extends StatefulWidget {
  const VisitsScreen({super.key});

  @override
  State<VisitsScreen> createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final Box<VisitModel> visitsBox = Hive.box<VisitModel>('visits');
  final Box<FavouriteModel> favoritesBox = Hive.box<FavouriteModel>('favorites');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "زياراتي")),
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
                buildVisitsList(),
                buildFavoritesList(),
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
          SizedBox(width: 10.w),
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

  Widget buildVisitsList() {
    return ValueListenableBuilder(
      valueListenable: visitsBox.listenable(),
      builder: (context, Box<VisitModel> box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final item = box.getAt(index)!;
            final isPastVisit = item.visitDate.isBefore(DateTime.now());

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              color: isPastVisit ? Colors.grey[300] : ColorManager.lightBeigeColor,
              child: Stack(
                children: [
                  Image.network(
                    item.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorManager.lightBeigeColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(item.name, style: TextStyles.font16BrownBold)),
                  ),
                  Positioned(
                    top: 3,
                    left: 3,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        ImagePaths.favIconPath,
                        color: ColorManager.brown2Color,
                        height: 50.h,
                        width: 50.w,
                      ),
                    ),
                  ),
                  if (!isPastVisit)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () => showCancelDialog(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: ColorManager.darkOrangeColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
                            ],
                          ),
                          child: Text('إلغاء', style: TextStyles.font22whiteExtraBold.copyWith(fontSize: 22.sp)),
                        ),
                      ),
                    ),
                  if (isPastVisit)
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('تمت الزيارة ✅', style: TextStyles.font22whiteExtraBold.copyWith(fontSize: 22.sp)),
                      ),
                    ),
                  if (!isPastVisit)
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorManager.lightBeigeColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
                          ],
                        ),
                        child: Text(getVisitDateText(item.visitDate),
                            style: TextStyles.font14BrownBold.copyWith(fontSize: 22.sp)),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildFavoritesList() {
    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<FavouriteModel> box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final item = box.getAt(index)!;
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              color: ColorManager.lightBeigeColor,
              child: Stack(
                children: [
                  Image.network(
                    item.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorManager.lightBeigeColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(item.name, style: TextStyles.font16BrownBold)),
                  ),
                  Positioned(
                    top: 3,
                    left: 3,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        ImagePaths.favIconPath,
                        color: ColorManager.brown2Color,
                        height: 50.h,
                        width: 50.w,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showCancelDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text('تأكيد الإلغاء',
              style: TextStyles.font18Brown2ExtraBold.copyWith(
                  fontSize: 22.sp, color: ColorManager.darkOrangeColor)),
        ),
        content: Text('هل أنت متأكد أنك تريد إلغاء هذه الزيارة؟',
            style: TextStyles.font18Brown2ExtraBold.copyWith(fontSize: 22.sp)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Text('لا', style: TextStyles.font18Brown2ExtraBold.copyWith(fontSize: 22.sp)),
                    SizedBox(width: 5.w),
                    Icon(Icons.close, color: ColorManager.darkOrangeColor),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  visitsBox.deleteAt(index);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text('نعم', style: TextStyles.font18Brown2ExtraBold.copyWith(fontSize: 22.sp)),
                    SizedBox(width: 5.w),
                    Icon(Icons.check, color: Colors.green),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String getVisitDateText(DateTime visitDate) {
    final now = DateTime.now();
    final difference = visitDate.difference(DateTime(now.year, now.month, now.day)).inDays;

    if (difference == 1) {
      return 'غدًا';
    } else if (difference == 2) {
      return 'يومان';
    } else {
      return DateFormat('yyyy-MM-dd').format(visitDate);
    }
  }
}
