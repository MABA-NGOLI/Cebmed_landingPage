import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LegalNoticesView extends StatelessWidget {
  const LegalNoticesView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentions légales'),
        backgroundColor: AppTheme.white,
        foregroundColor: AppTheme.black,
        elevation: 0,
      ),
      backgroundColor: AppTheme.white,
      body: Center(
        child: Text(
          'Bientôt disponible',
          style: textTheme.headlineSmall?.copyWith(
            color: AppTheme.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
