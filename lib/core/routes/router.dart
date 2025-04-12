import 'package:flutter/material.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/route_not_found.dart';

import '../../features/placeDetails/view/placeDetails_screen.dart';


Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.placeDetailsScreen:
      return MaterialPageRoute(
        builder: (context) =>  PlaceDetailsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
