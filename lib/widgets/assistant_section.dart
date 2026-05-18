import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AssistantSection extends StatelessWidget {
  const AssistantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1100;
        final mobileVisualWidth = (width * 0.24).clamp(78.0, 108.0);
        final mobileVisualHeight = (width * 0.40).clamp(150.0, 190.0);

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 28,
            vertical: isMobile ? 38 : 40,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF4F4F4), Color(0xFFF3E6F2)],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
              child: Column(
                children: [
                  _introBlock(context, isMobile, isTablet, mobileVisualWidth),
                  SizedBox(height: isMobile ? 30 : 34),
                  _secondBlock(context, isMobile, isTablet, mobileVisualWidth, mobileVisualHeight),
                  SizedBox(height: isMobile ? 34 : 40),
                  _thirdBlock(context, isMobile, isTablet, mobileVisualWidth, mobileVisualHeight),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _introBlock(BuildContext context, bool isMobile, bool isTablet, double mobileVisualWidth) {
    final textTheme = Theme.of(context).textTheme;

    if (isMobile) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: SizedBox(
              width: mobileVisualWidth,
              child: Align(
                alignment: Alignment.topLeft,
                child: Transform.translate(
                  offset: const Offset(-6, -2),
                  child: Image.asset(
                    'assets/images/logo_two.png',
                    width: mobileVisualWidth,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(flex: 7, child: _buildContent(textTheme, true)),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(-20, 0),
              child: Image.asset(
                'assets/images/logo_two.png',
                fit: BoxFit.contain,
                height: 340,
              ),
            ),
          ),
        ),
        const SizedBox(width: 26),
        Expanded(
          flex: 6,
          child: _buildContent(textTheme, false),
        ),
      ],
    );
  }

  Widget _secondBlock(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    double mobileVisualWidth,
    double mobileVisualHeight,
  ) {
    final textTheme = Theme.of(context).textTheme;
    const description =
        'Veillez sur la santé de vos parents ou de vos enfants à distance. Recevez une notification si un traitement important a été omis par un proche.';

    if (isMobile) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _badge('02', textTheme, isMobile),
                const SizedBox(height: 12),
                Text(
                  'Mode aidant : restez connecté aux vôtres',
                  style: textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF1E1E26),
                    fontSize: 20,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 12),
                _avatars(textTheme),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            flex: 3,
            child: SizedBox(
              width: mobileVisualWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/Caregiver_Mode.png',
                  fit: BoxFit.cover,
                  height: mobileVisualHeight,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _badge('02', textTheme, false),
                const SizedBox(height: 16),
                Text(
                  'Mode aidant : restez connecté aux vôtres',
                  style: textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF1E1E26),
                    fontSize: 36,
                    height: 1.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 18),
                _avatars(textTheme),
              ],
            ),
          ),
          const SizedBox(width: 28),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/Caregiver_Mode.png',
                fit: BoxFit.cover,
                height: 360,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thirdBlock(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    double mobileVisualWidth,
    double mobileVisualHeight,
  ) {
    final textTheme = Theme.of(context).textTheme;
    const description =
        'Ajoutez facilement vos consultations, examens ou rendez-vous médicaux. Cebmed enregistre automatiquement les informations importantes et vous rappelle lorsqu\'un rendez-vous approche.';

    if (isMobile) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: SizedBox(
              width: mobileVisualWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/mockupthree.png',
                  fit: BoxFit.cover,
                  height: mobileVisualHeight,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _badge('03', textTheme, isMobile),
                const SizedBox(height: 12),
                Text(
                  'Tous vos rendez-vous médicaux au même endroit',
                  style: textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF1E1E26),
                    fontSize: 20,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 12),
                _checkLine(textTheme, 'Organisation simplifiée'),
              ],
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              'assets/images/mockupthree.png',
              fit: BoxFit.cover,
              height: 360,
            ),
          ),
        ),
        const SizedBox(width: 44),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _badge('03', textTheme, false),
              const SizedBox(height: 16),
              Text(
                'Tous vos rendez-vous médicaux au même endroit',
                style: textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF1E1E26),
                  fontSize: 36,
                  height: 1.05,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 18),
              _checkLine(textTheme, 'Organisation simplifiée'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _checkLine(TextTheme textTheme, String text) {
    return Row(
      children: [
        const Icon(Icons.done_all_rounded, color: AppTheme.primaryPink, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _badge(String number, TextTheme textTheme, bool isMobile) {
    final size = isMobile ? 42.0 : 48.0;

    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppTheme.primaryPink,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        number,
        style: textTheme.bodyMedium?.copyWith(
          color: AppTheme.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _avatars(TextTheme textTheme) {
    Widget avatar(String label, Color color) {
      return Column(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: color,
            child: const Icon(Icons.person, size: 16, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(label, style: textTheme.bodyMedium?.copyWith(fontSize: 11)),
        ],
      );
    }

    return Row(
      children: [
        avatar('Maman', const Color(0xFF7D7FD7)),
        const SizedBox(width: 16),
        avatar('Papi', const Color(0xFF5A9AD6)),
      ],
    );
  }

  Widget _buildContent(TextTheme textTheme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _badge('01', textTheme, isMobile),
        const SizedBox(height: 16),
        Text(
          'CEB, votre assistant quotidien au service de votre sérénité',
          style: textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF1E1E26),
            fontSize: isMobile ? 20 : 36,
            height: 1.05,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Rappels, ordonnances, rendez-vous et suivi : Cebmed réduit la charge mentale liée aux traitements grâce à un accompagnement simple et rassurant',
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: isMobile ? 14 : 18,
            height: isMobile ? 1.35 : 1.45,
          ),
        ),
        const SizedBox(height: 18),
        _checkLine(textTheme, 'Stockage des ordonnances'),
        const SizedBox(height: 8),
        _checkLine(textTheme, 'Suivi des prises en temps réel'),
      ],
    );
  }
}








