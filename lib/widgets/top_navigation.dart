import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    super.key,
    required this.ctaLabel,
    required this.onPrimaryCtaPressed,
    required this.textTheme,
    required this.onFeaturesTap,
    required this.onPricingTap,
    required this.onContactTap,
  });

  final String ctaLabel;
  final VoidCallback onPrimaryCtaPressed;
  final TextTheme textTheme;
  final VoidCallback onFeaturesTap;
  final VoidCallback onPricingTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final showCenterMenu = width >= 900;
    final horizontalPadding = isMobile ? 12.0 : 20.0;
    final logoSize = isMobile ? 24.0 : 30.0;
    final brandStyle = isMobile
        ? textTheme.headlineSmall?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700)
        : textTheme.headlineMedium?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 12),
      decoration: const BoxDecoration(
        color: AppTheme.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFEDEDF2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Cebmed',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: brandStyle,
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
          if (showCenterMenu)
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _menuItem(context, 'Fonctionnalités', onFeaturesTap),
                    const SizedBox(width: 26),
                    _menuItem(context, 'Abonnement', onPricingTap),
                    const SizedBox(width: 26),
                    _menuItem(context, 'Contactez-nous', onContactTap),
                  ],
                ),
              ),
            )
          else
            const Spacer(),
          const SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: onPrimaryCtaPressed,
                icon: Icon(Icons.apple, size: isMobile ? 14 : 16),
                label: Text(
                  isMobile ? 'Télécharger' : ctaLabel,
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
              if (!showCenterMenu) ...[
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  tooltip: 'Menu',
                  onSelected: (value) {
                    if (value == 'features') onFeaturesTap();
                    if (value == 'pricing') onPricingTap();
                    if (value == 'contact') onContactTap();
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'features', child: Text('Fonctionnalités')),
                    const PopupMenuItem(value: 'pricing', child: Text('Abonnement')),
                    const PopupMenuItem(value: 'contact', child: Text('Contactez-nous')),
                  ],
                  icon: const Icon(Icons.menu_rounded, color: Color(0xFF20222B)),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String label, VoidCallback onTap) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Row(
          children: [
            Text(
              label,
              style: textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF20222B),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: Color(0xFF20222B)),
          ],
        ),
      ),
    );
  }
}
