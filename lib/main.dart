// Imports
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Number lookup',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
