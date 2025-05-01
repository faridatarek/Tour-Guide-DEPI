import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/home/data/models/place_model.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';

class PlaceListViewScreen extends StatelessWidget {
  final String governorate;

  const PlaceListViewScreen({super.key, required this.governorate});

  Future<List<Place>> fetchPlacesForGovernorate() async {
    final response = await Supabase.instance.client
        .from('places')
        .select('name, images, lat, long, gov, region, address, ticket_price, visit_times, description')
        .eq('gov', governorate);

    final List<Map<String, dynamic>> placesMap =
    List<Map<String, dynamic>>.from(response);

    return placesMap.map((json) => Place.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
      future: fetchPlacesForGovernorate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.darkOrangeColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('خطأ: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('لا توجد أماكن متاحة'));
        }

        final places = snapshot.data!;

        return ListView.separated(
          itemCount: places.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final place = places[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceDetailsScreen(place: place),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorManager.lightBeigeColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        place.images.isNotEmpty
                            ? place.images[0]
                            : 'https://via.placeholder.com/400x200',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        place.name,
                        style: TextStyles.font22whiteExtraBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
