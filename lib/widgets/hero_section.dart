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
      'L\'assistant intélligent qui prend soin de votre sante.';
  static const String _heroDescription2 =
      'Fini les oublis, automatisez votre suivi medical avec douceur et efficacite.';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 24, vertical: isMobile ? 18 : 28),
          child: isTablet || isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeft(context, width),
                    SizedBox(height: isMobile ? 18 : 24),
                    _buildRight(width),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 12, child: _buildLeft(context, width)),
                    const SizedBox(width: 20),
                    Expanded(flex: 10, child: _buildRight(width)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildLeft(BuildContext context, double width) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    final titleSize = isMobile ? 36.0 : (isTablet ? 44.0 : 54.0);
    final bodySize = isMobile ? 15.0 : (isTablet ? 16.0 : 18.0);

    final titleStyle = textTheme.displayLarge?.copyWith(
          color: AppTheme.black,
          height: 1.05,
          fontSize: titleSize,
        ) ??
        TextStyle(
          color: AppTheme.black,
          height: 1.05,
          fontSize: titleSize,
          fontWeight: FontWeight.w700,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? 8 : 24),
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
        SizedBox(height: isMobile ? 14 : 22),
        Text(
          _heroDescription1,
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: bodySize,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _heroDescription2,
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            height: 1.35,
            fontSize: bodySize,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 34),
        ElevatedButton.icon(
          onPressed: onPrimaryCtaPressed,
          icon: Icon(Icons.file_download_rounded, size: isMobile ? 18 : 20),
          label: Text(isMobile ? 'Télécharger' : ctaLabel),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryPink,
            foregroundColor: AppTheme.white,
            elevation: 4,
            shadowColor: AppTheme.primaryPink.withValues(alpha: 0.35),
            minimumSize: Size(0, isMobile ? 46 : 52),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 28, vertical: isMobile ? 12 : 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildRight(double width) {
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: isMobile ? 250 : (isTablet ? 340 : 460),
          maxWidth: isMobile ? 360 : (isTablet ? 500 : 620),
        ),
        child: Image.asset(
          'assets/images/Cebmed_hero.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
