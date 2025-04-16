import 'package:flutter/material.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/route_not_found.dart';
import 'package:tour_guide/features/AllPLaces/view/places_screen.dart';
import 'package:tour_guide/features/layout/view/navbar_view.dart';

import '../../features/placeDetails/view/placeDetails_screen.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.placeDetailsScreen:
      return MaterialPageRoute(
        builder: (context) => const PlaceDetailsScreen(),
      );
    case AppRoutes.allPlacesScreen:
      return MaterialPageRoute(
        builder: (context) => AllPlacesScreen(),
      );
    case AppRoutes.layoutScreen:
      return MaterialPageRoute(
        builder: (context) => const NavbarView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
