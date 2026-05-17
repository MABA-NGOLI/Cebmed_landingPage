import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/assistant_section.dart';
import '../widgets/features_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/social_section.dart';
import '../widgets/app_download_section.dart';

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
        color: AppTheme.white,
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
                  child: Column(
                    children: [
                      HeroSection(
                        ctaLabel: _ctaLabel,
                        onPrimaryCtaPressed: () => _onPrimaryCtaPressed(context),
                      ),
                      const FeaturesSection(),
                      const AssistantSection(),
                      const PricingSection(),
                      const SocialSection(),
                      const AppDownloadSection(),
                    ],
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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final horizontalPadding = isMobile ? 12.0 : 20.0;
    final logoSize = isMobile ? 24.0 : 30.0;
    final brandStyle = isMobile
        ? textTheme.headlineSmall?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700)
        : textTheme.headlineMedium?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 12),
      decoration: const BoxDecoration(color: AppTheme.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'Cebmed',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: brandStyle,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/logo.png',
                  height: logoSize,
                  width: logoSize,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: onPrimaryCtaPressed,
            icon: Icon(Icons.file_download_rounded, size: isMobile ? 14 : 16),
            label: Text(
              isMobile ? 'Telecharger' : ctaLabel,
              style: textTheme.bodyMedium?.copyWith(color: AppTheme.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryPink,
              foregroundColor: AppTheme.white,
              elevation: 0,
              minimumSize: Size(0, isMobile ? 40 : 44),
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16, vertical: isMobile ? 8 : 10),
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





