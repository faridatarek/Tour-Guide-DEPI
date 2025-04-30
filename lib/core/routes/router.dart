import 'package:flutter/material.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/route_not_found.dart';
import 'package:tour_guide/core/widgets/layout_navBar.dart';
import 'package:tour_guide/features/home/view/home_screen.dart';

import 'package:tour_guide/features/layout/view/widgets/layout_nav_bar.dart';
import 'package:tour_guide/features/notifications/view/notifications_screen.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';
import 'package:tour_guide/features/places/view/widgets/test.dart';
import 'package:tour_guide/features/splash/view/logo_screen.dart';
import 'package:tour_guide/features/splash/view/onboarding_screen.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.layoutScreen:
      return MaterialPageRoute(
        builder: (_) => const LayoutNavBar(),
      );

    case AppRoutes.LogoScreen:
      return MaterialPageRoute(
        builder: (_) => const LogoScreen(),
      );
    case AppRoutes.onboarding:
      return MaterialPageRoute(
        builder: (_) => GuidePager(),
      );

    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
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
