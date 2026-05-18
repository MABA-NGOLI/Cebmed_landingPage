import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  static final Uri _instagramUri = Uri.parse(
    'https://www.instagram.com/cebmed.app/',
  );

  Future<void> _openInstagram(BuildContext context) async {
    final opened = await launchUrl(_instagramUri, mode: LaunchMode.platformDefault);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir Instagram.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 700;
        final isTablet = w >= 700 && w < 1100;

        return Container(
          width: double.infinity,
          color: const Color(0xFFF7F7F8),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : (isTablet ? 24 : 32),
            vertical: isMobile ? 20 : (isTablet ? 30 : 40),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _leftContent(context, textTheme, isMobile: true, isTablet: false),
                        const SizedBox(height: 20),
                        Center(child: _instagramLogoAsset(110)),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: isTablet ? 6 : 6,
                          child: _leftContent(context, textTheme, isMobile: false, isTablet: isTablet),
                        ),
                        SizedBox(width: isTablet ? 20 : 30),
                        Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: _instagramLogoAsset(isTablet ? 150 : 190),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _leftContent(BuildContext context, TextTheme textTheme, {required bool isMobile, required bool isTablet}) {
    final titleSize = isMobile ? 28.0 : (isTablet ? 34.0 : 44.0);
    final bodySize = isMobile ? 15.0 : (isTablet ? 16.0 : 18.0);
    final lineSize = isMobile ? 14.0 : (isTablet ? 15.0 : 16.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rejoignez-nous sur Instagram',
          style: textTheme.headlineMedium?.copyWith(
            color: AppTheme.primaryPink,
            fontSize: titleSize,
            fontWeight: FontWeight.w700,
            height: 1.12,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Découvrez des conseils quotidiens, les histoires de notre communauté et toute la motivation nécessaire pour votre santé.',
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF4B4D59),
            fontSize: bodySize,
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: isMobile ? 16 : 20),
        _line(Icons.favorite, 'Conseils santé quotidiens', textTheme, lineSize),
        const SizedBox(height: 8),
        _line(Icons.visibility, 'Coulisses de l\'application & Nouveautés', textTheme, lineSize),
        const SizedBox(height: 8),
        _line(Icons.chat_bubble, 'Témoignages & Partages de la communauté', textTheme, lineSize),
        SizedBox(height: isMobile ? 18 : 24),
        ElevatedButton.icon(
          onPressed: () => _openInstagram(context),
          icon: const Icon(Icons.camera_alt_rounded, size: 18),
          label: const Text('Suivez-nous'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryPink,
            foregroundColor: Colors.white,
            minimumSize: Size(0, isMobile ? 44 : 50),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 24, vertical: isMobile ? 12 : 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            elevation: 6,
            shadowColor: AppTheme.primaryPink.withValues(alpha: 0.35),
          ),
        ),
      ],
    );
  }

  Widget _line(IconData icon, String text, TextTheme textTheme, double fontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, color: AppTheme.primaryPink, size: 16),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF4B4D59),
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }

  Widget _instagramLogoAsset(double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.22),
      child: Image.asset(
        'assets/images/Instagram_Cebmed.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}



