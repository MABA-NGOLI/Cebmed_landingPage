import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/landing_page_view.dart';

void main() {
  runApp(const CebmedApp());
}

class CebmedApp extends StatelessWidget {
  const CebmedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cebmed',
      theme: AppTheme.light(),
      home: const LandingPageView(),
    );
  }
}
