import 'package:flutter/material.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/route_not_found.dart';
import 'package:tour_guide/features/layout/view/layout_navBar.dart';
import 'package:tour_guide/features/layout/view/widgets/navy_bar.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';
import 'package:tour_guide/features/splash/view/logo_screen.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.layoutScreen:
      return MaterialPageRoute(
        builder: (_) => const LayoutNavBar(),
      );
    case AppRoutes.placeDetailsScreen:
      return MaterialPageRoute(
        builder: (_) => const PlaceDetailsScreen(),
      );
    case AppRoutes.layout:
      return MaterialPageRoute(
        builder: (_) => const LayoutNavBarScreen(),
      );
    case AppRoutes.LogoScreen:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
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
