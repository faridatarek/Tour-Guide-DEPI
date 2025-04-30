import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';
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
  final Box<FavouriteModel> favoritesBox =
      Hive.box<FavouriteModel>('favorites');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: CustomAppbar(title: "زياراتي"),
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildVisitsList(),
                _buildFavoritesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: ColorManager.beigeColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        tabs: [
          Tab(
            icon: Icon(Icons.bookmark_added, color: ColorManager.brownColor),
            text: 'زيارتي',
          ),
          Tab(
            icon: Icon(Icons.favorite, color: ColorManager.brownColor),
            text: 'المفضلة',
          ),
        ],
      ),
    );
  }

  Widget _buildVisitsList() {
    return ValueListenableBuilder(
      valueListenable: visitsBox.listenable(),
      builder: (context, Box<VisitModel> box, _) {
        final visits = box.values.toList();
        return ListView.builder(
          itemCount: visits.length,
          itemBuilder: (context, index) =>
              _buildVisitItem(visits[index], index),
        );
      },
    );
  }

  Widget _buildFavoritesList() {
    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<FavouriteModel> box, _) {
        final favorites = box.values.toList();
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) => _buildFavoriteItem(favorites[index]),
        );
      },
    );
  }

  Widget _buildVisitItem(VisitModel visit, int index) {
    final isPastVisit = visit.visitDate.isBefore(DateTime.now());

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: isPastVisit ? Colors.grey[300] : ColorManager.lightBeigeColor,
      child: Stack(
        children: [
          Image.network(visit.image, height: 200, fit: BoxFit.cover),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PlaceDetailsScreen(
                    name: visit.name,
                    image: visit.image,
                    governorate: visit.governorate,
                    area: visit.area,
                    address: visit.address,
                    visitingHours: visit.visitingHours,
                    ticketPrice: visit.ticketPrice,
                    description: visit.description,
                  );
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: ColorManager.lightBeigeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(visit.name, style: TextStyles.font16BrownBold),
              ),
            ),
          ),
          if (!isPastVisit)
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () => _showCancelDialog(index),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: ColorManager.darkOrangeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('إلغاء', style: TextStyles.font22whiteExtraBold),
                ),
              ),
            ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color:
                    isPastVisit ? Colors.green : ColorManager.lightBeigeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                isPastVisit
                    ? 'تمت الزيارة ✅'
                    : _getVisitDateText(visit.visitDate),
                style: TextStyles.font14BrownBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(FavouriteModel favorite) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: ColorManager.lightBeigeColor,
      child: Stack(
        children: [
          Image.network(favorite.image, height: 200, fit: BoxFit.cover),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: ColorManager.lightBeigeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(favorite.name, style: TextStyles.font16BrownBold),
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child:
                Text('تأكيد الإلغاء', style: TextStyles.font18Brown2ExtraBold)),
        content: Text('هل أنت متأكد من إلغاء هذه الزيارة؟',
            style: TextStyles.font16BrownBold),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('لا', style: TextStyles.font16BrownBold),
              ),
              TextButton(
                onPressed: () {
                  visitsBox.deleteAt(index);
                  Navigator.pop(context);
                },
                child: Text('نعم', style: TextStyles.font16BrownBold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getVisitDateText(DateTime date) {
    final now = DateTime.now();
    final difference =
        date.difference(DateTime(now.year, now.month, now.day)).inDays;

    if (difference == 1) return 'غدًا';
    if (difference == 2) return 'بعد غد';
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
