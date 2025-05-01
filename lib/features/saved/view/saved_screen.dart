import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/saved/data/models/favourite_model.dart';
import 'package:tour_guide/features/saved/data/models/visit_model.dart';

class VisitsScreen extends StatefulWidget {
  const VisitsScreen({super.key});

  @override
  State<VisitsScreen> createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Box<VisitModel> visitsBox = Hive.box<VisitModel>('visits');
  final Box<FavouriteModel> favoritesBox =
      Hive.box<FavouriteModel>('favorites');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
        labelColor: Colors.white,
        unselectedLabelColor: ColorManager.brownColor,
        tabs: const [
          Tab(icon: Icon(Icons.bookmark_added), text: 'زيارتي'),
          Tab(icon: Icon(Icons.favorite), text: 'المفضلة'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("زياراتي", style: TextStyles.font18Brown2ExtraBold),
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

  Widget _buildVisitsList() {
    return ValueListenableBuilder(
      valueListenable: visitsBox.listenable(),
      builder: (context, Box<VisitModel> box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) => _buildVisitItem(box.getAt(index)!),
        );
      },
    );
  }

  Widget _buildFavoritesList() {
    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<FavouriteModel> box, _) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) =>
              _buildFavoriteItem(box.getAt(index)!),
        );
      },
    );
  }

  Widget _buildVisitItem(VisitModel visit) {
    return Card(
      child: Column(
        children: [
          Image.network(visit.image),
          ListTile(
            title: Text(visit.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('المحافظة: ${visit.governorate}'),
                Text('المواعيد: ${visit.visitingHours}'),
                Text('السعر: ${visit.ticketPrice}'),
                Text(DateFormat('yyyy-MM-dd').format(visit.visitDate)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(FavouriteModel favorite) {
    return Card(
      child: Column(
        children: [
          Image.network(favorite.image),
          ListTile(
            title: Text(favorite.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('المنطقة: ${favorite.area}'),
                Text('العنوان: ${favorite.address}'),
                Text('المواعيد: ${favorite.visitingHours}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
