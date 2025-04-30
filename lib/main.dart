import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/router.dart';
import 'package:tour_guide/features/saved/data/models/favourite_model.dart';
import 'package:tour_guide/features/saved/data/models/visit_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(VisitModelAdapter());
  Hive.registerAdapter(FavouriteModelAdapter());
  await Hive.openBox<VisitModel>('visits');
  await Hive.openBox<FavouriteModel>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(411, 890),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kemet Guide',
        onGenerateRoute: manageRoutes,
        initialRoute: AppRoutes.LogoScreen,
      ),
    );
  }
}
