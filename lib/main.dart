import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_guide/core/routes/app_routes.dart';
import 'package:tour_guide/core/routes/router.dart';

import 'features/layout/view/widgets/layout_nav_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://iiuqpahryaxcadquytfc.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlpdXFwYWhyeWF4Y2FkcXV5dGZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU4Mjg3NjUsImV4cCI6MjA2MTQwNDc2NX0.jvoXAtfHioRJxBu9j9SPM0-Ehgd4aN9bVmOOmjV1m_Y",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(411, 890),

      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kemet guide app',
        onGenerateRoute: manageRoutes,
        initialRoute: AppRoutes.LogoScreen,
      ),
    );
  }
}
