import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.ctaLabel,
    required this.onPrimaryCtaPressed,
  });

  final String ctaLabel;
  final VoidCallback onPrimaryCtaPressed;

  static const String _heroTitlePart1 = 'Transformez vos traitements';
  static const String _heroTitlePart2 = 'en routine';
  static const String _heroAccent = 'simple';
  static const String _heroTitlePart3 = 'et motivante';
  static const String _heroDescription1 =
      'L\'assistant intelligent qui prend soin de votre sante.';
  static const String _heroDescription2 =
      'Fini les oublis, automatisez votre suivi medical avec douceur et efficacite.';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 980;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeft(context),
                    const SizedBox(height: 28),
                    _buildRight(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 12, child: _buildLeft(context)),
                    const SizedBox(width: 20),
                    Expanded(flex: 10, child: _buildRight()),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          _heroTitlePart1,
          style: textTheme.displayLarge?.copyWith(
            color: AppTheme.black,
            height: 1.05,
          ),
        ),
        RichText(
          text: TextSpan(
            style: textTheme.displayLarge?.copyWith(
              color: AppTheme.black,
              height: 1.05,
            ),
            children: const [
              TextSpan(text: '$_heroTitlePart2 '),
              TextSpan(
                text: '$_heroAccent ',
                style: TextStyle(color: AppTheme.primaryPink),
              ),
              TextSpan(text: _heroTitlePart3),
            ],
          ),
        ),
        const SizedBox(height: 26),
        Text(
          _heroDescription1,
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _heroDescription2,
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 44),
        ElevatedButton.icon(
          onPressed: onPrimaryCtaPressed,
          icon: const Icon(Icons.file_download_rounded),
          label: Text(ctaLabel),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryPink,
            foregroundColor: AppTheme.white,
            elevation: 6,
            shadowColor: AppTheme.primaryPink.withValues(alpha: 0.45),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildRight() {
    return Image.asset(
      'assets/images/Cebmed_hero.png',
      fit: BoxFit.contain,
    );
  }
}

