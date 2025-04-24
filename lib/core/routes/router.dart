import 'package:flutter/material.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/route_not_found.dart';

import 'package:tour_guide/features/layout/view/widgets/layout_nav_bar.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';
import 'package:tour_guide/features/places/view/widgets/test.dart';
import 'package:tour_guide/features/splash/view/logo_screen.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.layoutScreen:
      return MaterialPageRoute(
        builder: (_) => const LayoutScreen(),
      );
    case AppRoutes.placeDetailsScreen:
      return MaterialPageRoute(
        builder: (_) => const PlaceDetailsScreen(),
      );
    case AppRoutes.test:
      return MaterialPageRoute(
        builder: (_) => const test(),
      );
    case AppRoutes.LogoScreen:
      return MaterialPageRoute(
        builder: (_) => const LogoScreen(),
      );
    case AppRoutes.allPlacesScreen:
      return MaterialPageRoute(
        builder: (_) => const AllPlacesScreen(),
      );
    case AppRoutes.notificationsScreen:
      return MaterialPageRoute(
        builder: (_) => const NotificationsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const RouteNotFound(),
      );
  }
}
