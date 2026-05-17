import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/hero_section.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  static const String _ctaLabel = 'Telecharger l\'App';

  void _onPrimaryCtaPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('CTA cliquee: Telecharger l\'App')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.white, AppTheme.softPink],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _TopNavigation(
                ctaLabel: _ctaLabel,
                onPrimaryCtaPressed: () => _onPrimaryCtaPressed(context),
                textTheme: textTheme,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: HeroSection(
                    ctaLabel: _ctaLabel,
                    onPrimaryCtaPressed: () => _onPrimaryCtaPressed(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopNavigation extends StatelessWidget {
  const _TopNavigation({
    required this.ctaLabel,
    required this.onPrimaryCtaPressed,
    required this.textTheme,
  });

  final String ctaLabel;
  final VoidCallback onPrimaryCtaPressed;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(color: AppTheme.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Cebmed',
                style: textTheme.headlineMedium?.copyWith(
                  color: AppTheme.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/logo.png',
                height: 22,
                width: 22,
                fit: BoxFit.contain,
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: onPrimaryCtaPressed,
            icon: const Icon(Icons.file_download_rounded, size: 16),
            label: Text(ctaLabel, style: textTheme.bodyMedium?.copyWith(color: AppTheme.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryPink,
              foregroundColor: AppTheme.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

