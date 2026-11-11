
import 'package:flutter/material.dart';
import '../presentation/views/home_view.dart';
import '../theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Hunian',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeView(),
    );
  }
}
