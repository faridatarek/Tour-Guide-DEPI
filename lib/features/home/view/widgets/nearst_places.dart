
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/home/data/models/place_model.dart';
import 'dart:math'as math;
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';

class NearestPlaces extends StatefulWidget {
  const NearestPlaces({super.key});

  @override
  State<NearestPlaces> createState() => _NearestPlacesState();
}

class _NearestPlacesState extends State<NearestPlaces> {
  List<Place> nearestPlaces = [];

  @override
  void initState() {
    super.initState();
    getNearestPlaces();
  }

  Future<void> getNearestPlaces() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    LocationData locationData = await location.getLocation();

    final response = await Supabase.instance.client
        .from('places')
        .select('name, images, lat, long, gov, region, address, ticket_price, visit_times, description');

    List<Map<String, dynamic>> allPlaces =
    List<Map<String, dynamic>>.from(response);

    List<Place> placesWithDistance = allPlaces.map((place) {
      double lat = double.tryParse(place['lat'].toString()) ?? 0.0;
      double lon = double.tryParse(place['long'].toString()) ?? 0.0;

      double distance = calculateDistance(
        locationData.latitude!,
        locationData.longitude!,
        lat,
        lon,
      );

      return Place.fromJson({
        ...place,
        'distance': distance,
      });
    }).toList();

    placesWithDistance.sort((a, b) => a.distance.compareTo(b.distance));

    setState(() {
      nearestPlaces = placesWithDistance.take(5).toList();
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        math.cos((lat2 - lat1) * p) / 2 +
        math.cos(lat1 * p) *
            math.cos(lat2 * p) *
            (1 - math.cos((lon2 - lon1) * p)) / 2;
    return 12742 * math.asin(math.sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return nearestPlaces.isEmpty
        ? const Center(child: CircularProgressIndicator(color: ColorManager.darkOrangeColor,))
        : SizedBox(
      height: 220.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: nearestPlaces.length,
        itemBuilder: (context, index) {
          final place = nearestPlaces[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PlaceDetailsScreen(place: place),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    place.images.isNotEmpty
                        ? place.images[0]
                        : 'https://via.placeholder.com/125x220',
                    height: 220.h,
                    width: 125.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.brown.withAlpha(180),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        place.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}







