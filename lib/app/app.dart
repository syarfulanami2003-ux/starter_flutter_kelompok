
import 'package:flutter/material.dart';
import '../presentation/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Starter Flutter Kelompok',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
