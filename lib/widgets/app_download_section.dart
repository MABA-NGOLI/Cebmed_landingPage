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

        return Container(
          width: double.infinity,
          color: const Color(0xFFF7F7F8),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 24,
            vertical: isMobile ? 20 : 32,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
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
                    ? _mobileLayout(context)
                    : _desktopLayout(context, compact: isTablet),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _desktopLayout(BuildContext context, {required bool compact}) {
    final textTheme = Theme.of(context).textTheme;

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
                  width: compact ? 180 : 220,
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
                      width: compact ? 280 : 340,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: compact ? 10 : 14),
                  _StoreBadge(
                    onTap: onGooglePlayTap,
                    child: Image.asset(
                      'assets/images/logo-Googleplay.png',
                      width: compact ? 280 : 340,
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
                  height: compact ? 350 : 420,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          'Prêts à simplifier votre quotidien ?',
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            color: AppTheme.white,
            fontSize: 34,
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
        const SizedBox(height: 16),
        _StoreBadge(
          onTap: onAppStoreTap,
          child: Image.asset(
            'assets/images/logo_AppStore.png',
            width: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10),
        _StoreBadge(
          onTap: onGooglePlayTap,
          child: Image.asset(
            'assets/images/logo-Googleplay.png',
            width: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/logo_two.png',
                  width: 130,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/App_Cebmed.png',
                  height: 230,
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
