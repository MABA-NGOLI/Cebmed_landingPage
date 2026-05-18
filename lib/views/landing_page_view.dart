import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/app_download_section.dart';
import '../widgets/assistant_section.dart';
import '../widgets/features_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/social_section.dart';
import '../widgets/top_navigation.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  static const String _ctaLabel = 'Telecharger l\'App';
  static final Uri _googlePlayUri = Uri.parse('https://play.google.com/store/games?hl=fr');
  static final Uri _appStoreUri = Uri.parse('https://www.apple.com/fr/app-store/');

  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Future<void> _onPrimaryCtaPressed(BuildContext context) async {
    final opened = await launchUrl(_googlePlayUri, mode: LaunchMode.platformDefault);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir Google Play.')),
      );
    }
  }

  Future<void> _onAppStoreTap(BuildContext context) async {
    final opened = await launchUrl(_appStoreUri, mode: LaunchMode.platformDefault);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir l\'App Store.')),
      );
    }
  }

  Future<void> _scrollToKey(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.02,
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
              TopNavigation(
                ctaLabel: _ctaLabel,
                onPrimaryCtaPressed: () => _onPrimaryCtaPressed(context),
                textTheme: textTheme,
                onFeaturesTap: () => _scrollToKey(_featuresKey),
                onPricingTap: () => _scrollToKey(_pricingKey),
                onContactTap: () => _scrollToKey(_contactKey),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeroSection(
                        ctaLabel: _ctaLabel,
                        onPrimaryCtaPressed: () => _onPrimaryCtaPressed(context),
                      ),
                      Container(key: _featuresKey, child: const FeaturesSection()),
                      const AssistantSection(),
                      Container(key: _pricingKey, child: const PricingSection()),
                      const SocialSection(),
                      AppDownloadSection(
                        onAppStoreTap: () => _onAppStoreTap(context),
                        onGooglePlayTap: () => _onPrimaryCtaPressed(context),
                      ),
                      Container(key: _contactKey, child: const FooterSection()),
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
