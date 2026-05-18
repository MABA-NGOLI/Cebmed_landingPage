import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppDownloadSection extends StatelessWidget {
  const AppDownloadSection({
    super.key,
    this.onAppStoreTap,
    this.onGooglePlayTap,
  });

  final VoidCallback? onAppStoreTap;
  final VoidCallback? onGooglePlayTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 900;
        final isTablet = w >= 900 && w < 1200;
        final cardMaxWidth = isMobile ? w * 0.92 : (isTablet ? w * 0.88 : 1120.0);

        return Container(
          width: double.infinity,
          color: const Color(0xFFF7F7F8),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 20,
            vertical: isMobile ? 34 : 28,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: cardMaxWidth),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  isMobile ? 14 : (isTablet ? 20 : 28),
                  isMobile ? 20 : (isTablet ? 24 : 28),
                  isMobile ? 14 : (isTablet ? 20 : 28),
                  0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isMobile ? 24 : 32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFE88FCF), Color(0xFFDDA6D5)],
                  ),
                ),
                child: isMobile
                    ? _mobileLayout(context, width: w)
                    : _desktopLayout(context, compact: isTablet, width: w),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _desktopLayout(
    BuildContext context, {
    required bool compact,
    required double width,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final appBadgeWidth = compact ? (width * 0.24).clamp(220.0, 290.0) : 340.0;
    final logoTwoWidth = compact ? (width * 0.17).clamp(130.0, 180.0) : 220.0;
    final phoneHeight = compact ? (width * 0.30).clamp(250.0, 350.0) : 420.0;

    return Column(
      children: [
        Text(
          'Prêts à simplifier votre quotidien ?',
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            color: AppTheme.white,
            fontSize: compact ? 40 : 54,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: compact ? 8 : 10),
        Text(
          'Faites confiance à CEBMED et reprenez le contrôle de votre santé',
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF2D2230),
            fontWeight: FontWeight.w500,
            fontSize: compact ? 15 : 17,
          ),
        ),
        SizedBox(height: compact ? 14 : 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/logo_two.png',
                  width: logoTwoWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _StoreBadge(
                    onTap: onAppStoreTap,
                    child: Image.asset(
                      'assets/images/logo_AppStore.png',
                      width: appBadgeWidth,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: compact ? 10 : 14),
                  _StoreBadge(
                    onTap: onGooglePlayTap,
                    child: Image.asset(
                      'assets/images/logo-Googleplay.png',
                      width: appBadgeWidth,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/App_Cebmed.png',
                  height: phoneHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context, {required double width}) {
    final textTheme = Theme.of(context).textTheme;
    final badgeWidth = (width * 0.56).clamp(185.0, 250.0);
    final logoWidth = (width * 0.28).clamp(92.0, 130.0);
    final phoneHeight = (width * 0.50).clamp(150.0, 230.0);

    return Column(
      children: [
        Text(
          'Prêts à simplifier votre quotidien ?',
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            color: AppTheme.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Faites confiance à CEBMED et reprenez le contrôle de votre santé',
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF2D2230),
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 22),
        _StoreBadge(
          onTap: onAppStoreTap,
          child: Image.asset(
            'assets/images/logo_AppStore.png',
            width: badgeWidth,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10),
        _StoreBadge(
          onTap: onGooglePlayTap,
          child: Image.asset(
            'assets/images/logo-Googleplay.png',
            width: badgeWidth,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/logo_two.png',
                  width: logoWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/App_Cebmed.png',
                  height: phoneHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StoreBadge extends StatelessWidget {
  const _StoreBadge({
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap ?? () {},
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}
