import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/home/data/models/gov_model.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';

import '../../../allGovernorates/view/allGovernorates_screen.dart';

Future<List<GovModel>> fetchGovernorates() async {
  final supabase = Supabase.instance.client;
  final response = await supabase.from('places').select();
  final List data = response;


  final governorates = <String, GovModel>{};
  for (var e in data) {
    final govModel = GovModel.fromJson(e);
    final standardizedName = govModel.name.trim().toLowerCase();
    if (!governorates.containsKey(standardizedName)) {
      governorates[standardizedName] = govModel;
    }
  }
  return governorates.values.toList();
}


class PromotedPlaces extends StatelessWidget {
  const PromotedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GovModel>>(
      future: fetchGovernorates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: ColorManager.primaryColor,));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: \${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('لا توجد بيانات'));
        }

        final items = snapshot.data!;

        return SizedBox(
          height: 120.h,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const allGovernorates_screen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item.image,
                        height: 110.h,
                        width: 220.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 110.h,
                      width: 220.w,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          item.name,
                          style: TextStyles.font22whiteExtraBold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}






























