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
      'L\'assistant intelligent qui prend soin de votre santé.';
  static const String _heroDescription2 =
      'Fini les oublis, automatisez votre suivi medical avec douceur et efficacite.';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1024;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 24,
            vertical: isMobile ? 42 : (isTablet ? 54 : 64),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeft(context, width),
                    const SizedBox(height: 28),
                    _buildRight(width),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 11, child: _buildLeft(context, width)),
                    const SizedBox(width: 16),
                    Expanded(flex: 10, child: _buildRight(width)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildLeft(BuildContext context, double width) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1024;
    final isTinyMobile = width < 390;

    final titleSize = isMobile ? (isTinyMobile ? 22.0 : 26.0) : (isTablet ? 34.0 : 48.0);
    final bodySize = isMobile ? (isTinyMobile ? 12.0 : 13.0) : 16.0;

    final titleStyle = textTheme.displayLarge?.copyWith(
          color: const Color(0xFF21222A),
          height: 1.05,
          fontSize: titleSize,
        ) ??
        TextStyle(
          color: const Color(0xFF21222A),
          height: 1.05,
          fontSize: titleSize,
          fontWeight: FontWeight.w700,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? 12 : 16),
        Text(_heroTitlePart1, style: titleStyle),
        RichText(
          text: TextSpan(
            style: titleStyle,
            children: const [
              TextSpan(text: '$_heroTitlePart2 '),
              TextSpan(text: '$_heroAccent ', style: TextStyle(color: AppTheme.primaryPink)),
              TextSpan(text: _heroTitlePart3),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 20 : 22),
        Text(
          _heroDescription1,
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF5D5F6A),
            fontWeight: FontWeight.w500,
            fontSize: bodySize,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _heroDescription2,
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF5D5F6A),
            fontWeight: FontWeight.w500,
            height: 1.35,
            fontSize: bodySize,
          ),
        ),
        SizedBox(height: isMobile ? 26 : 30),
        ElevatedButton.icon(
          onPressed: onPrimaryCtaPressed,
          icon: Icon(Icons.apple, size: isMobile ? 18 : 20),
          label: Text(isMobile ? 'Telecharger l\'App' : ctaLabel),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryPink,
            foregroundColor: AppTheme.white,
            elevation: 8,
            shadowColor: AppTheme.primaryPink.withValues(alpha: 0.35),
            minimumSize: Size(0, isMobile ? 48 : 54),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 26, vertical: isMobile ? 12 : 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            textStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildRight(double width) {
    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1024;
    final isTinyMobile = width < 390;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: isMobile ? (isTinyMobile ? 250 : 290) : (isTablet ? 380 : 470),
          maxWidth: isMobile ? (isTinyMobile ? 330 : 390) : (isTablet ? 540 : 640),
        ),
        child: Image.asset('assets/images/Cebmed_hero.png', fit: BoxFit.contain),
      ),
    );
  }
}

