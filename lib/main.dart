import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navo_app/routes/app_pages.dart';
import 'package:navo_app/routes/app_routes.dart';
import 'package:navo_app/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navo App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}
