import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/saved/data/models/favourite_model.dart';
import 'package:tour_guide/features/saved/data/models/visit_model.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final String name;
  final String image;
  final String governorate;
  final String area;
  final String address;
  final String visitingHours;
  final String ticketPrice;
  final String description;

  const PlaceDetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.governorate,
    required this.area,
    required this.address,
    required this.visitingHours,
    required this.ticketPrice,
    required this.description,
  });

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  late bool isFavorite;
  DateTime? selectedDate;
  final List<String> placeImages = const [
    "https://th.bing.com/th/id/OIP.NTPpHvrbMdUAlZ5YI0U9SwHaE7?rs=1&pid=ImgDetMain",
    "https://th.bing.com/th/id/OIP._QbqkOOYXuCE_stCCqCq5QHaEy?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.zxjwoAWqQh-G-WAnjqJKzQHaFh?pid=ImgDet&w=474&h=353&rs=1",
    "https://archaeologicalpaths.com/web/images/uploaded/shutterstock_556156237.jpg",
    "https://th.bing.com/th/id/OIP.jGXGgIkz9MfkaCjJymHyWgHaE8?rs=1&pid=ImgDetMain",
  ];

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
    _checkVisitStatus();
  }

  void _checkFavoriteStatus() {
    final favoritesBox = Hive.box<FavouriteModel>('favorites');
    isFavorite = favoritesBox.values.any((f) => f.name == widget.name);
  }

  void _checkVisitStatus() {
    final visitsBox = Hive.box<VisitModel>('visits');
    final visit = visitsBox.values.firstWhere(
      (v) => v.name == widget.name,
      orElse: () => VisitModel(
          name: '',
          image: '',
          visitDate: DateTime.now(),
          governorate: '',
          area: '',
          address: '',
          visitingHours: '',
          ticketPrice: '',
          description: ''),
    );
    if (visit.name.isNotEmpty) {
      selectedDate = visit.visitDate;
    }
  }

  Future<void> _toggleFavorite() async {
    final favoritesBox = Hive.box<FavouriteModel>('favorites');
    final favorite = FavouriteModel(
      name: widget.name,
      image: widget.image,
      governorate: widget.governorate,
      area: widget.area,
      address: widget.address,
      visitingHours: widget.visitingHours,
      ticketPrice: widget.ticketPrice,
      description: widget.description,
    );

    if (isFavorite) {
      final index =
          favoritesBox.values.toList().indexWhere((f) => f.name == widget.name);
      if (index != -1) await favoritesBox.deleteAt(index);
    } else {
      await favoritesBox.add(favorite);
    }
    setState(() => isFavorite = !isFavorite);
  }

  Future<void> _scheduleVisit() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      final visitsBox = Hive.box<VisitModel>('visits');
      final existingVisitIndex =
          visitsBox.values.toList().indexWhere((v) => v.name == widget.name);

      final visit = VisitModel(
        name: widget.name,
        image: widget.image,
        visitDate: pickedDate,
        governorate: widget.governorate,
        area: widget.area,
        address: widget.address,
        visitingHours: widget.visitingHours,
        ticketPrice: widget.ticketPrice,
        description: widget.description,
      );

      if (existingVisitIndex != -1) {
        await visitsBox.deleteAt(existingVisitIndex);
      }
      await visitsBox.add(visit);

      setState(() {
        selectedDate = pickedDate;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.brown2Color,
          content: Text(
            "تم تحديد زيارة المكان في تاريخ: ${DateFormat('yyyy-MM-dd').format(pickedDate)}",
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkOrangeColor,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.network(widget.image),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: ColorManager.darkOrangeColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.name,
                          style: TextStyles.font20whiteExtraBold,
                          //textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        ImagePaths.backArrow,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // ... (بقية محتوى التفاصيل كما هو)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 40,
            right: 40,
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: ColorManager.darkOrangeColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.r),
                  bottomLeft: Radius.circular(25.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // زر الزيارات
                    GestureDetector(
                      onTap: _scheduleVisit,
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedDate != null
                              ? ColorManager.darkOrangeColor
                              : ColorManager.lightBeigeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50.h,
                        width: 155.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "زياراتي",
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold,
                                  color: selectedDate != null
                                      ? ColorManager.lightBeigeColor
                                      : ColorManager.darkOrangeColor,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.bookmark,
                                color: selectedDate != null
                                    ? ColorManager.lightBeigeColor
                                    : ColorManager.brown2Color,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // زر المفضلة
                    GestureDetector(
                      onTap: _toggleFavorite,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isFavorite
                              ? ColorManager.darkOrangeColor
                              : ColorManager.lightBeigeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 55.h,
                        width: 155.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "مفضلة",
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold,
                                  color: isFavorite
                                      ? ColorManager.lightBeigeColor
                                      : ColorManager.darkOrangeColor,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.favorite,
                                color: isFavorite
                                    ? ColorManager.lightBeigeColor
                                    : ColorManager.brown2Color,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
