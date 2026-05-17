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

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 28,
            vertical: isMobile ? 24 : 40,
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
                  _introBlock(context, isMobile, isTablet),
                  SizedBox(height: isMobile ? 22 : 34),
                  _secondBlock(context, isMobile, isTablet),
                  SizedBox(height: isMobile ? 26 : 40),
                  _thirdBlock(context, isMobile, isTablet),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _introBlock(BuildContext context, bool isMobile, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(-12, 0),
              child: Image.asset(
                'assets/images/logo_two.png',
                width: isMobile ? 210 : 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 18),
          _buildContent(textTheme, isMobile),
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

  Widget _secondBlock(BuildContext context, bool isMobile, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;
    const description =
        'Veillez sur la sante de vos parents ou de vos enfants a distance. Recevez une notification si un traitement important a ete omis par un proche.';

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _badge('02', textTheme, isMobile),
          const SizedBox(height: 16),
          Text(
            'Mode aidant : restez connecte aux votres',
            style: textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1E1E26),
              fontSize: isMobile ? 26 : 34,
              height: 1.08,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: textTheme.titleMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 14 : 16,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          _avatars(textTheme),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              'assets/images/Caregiver_Mode.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: isMobile ? 230 : 320,
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
                  'Mode aidant : restez connecte aux votres',
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

  Widget _thirdBlock(BuildContext context, bool isMobile, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;
    const description =
        'Ajoutez facilement vos consultations, examens ou rendez-vous medicaux. Cebmed enregistre automatiquement les informations importantes et vous rappelle lorsqu\'un rendez-vous approche.';

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              'assets/images/mockupthree.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: isMobile ? 230 : 320,
            ),
          ),
          const SizedBox(height: 16),
          _badge('03', textTheme, isMobile),
          const SizedBox(height: 14),
          Text(
            'Tous vos rendez-vous medicaux au meme endroit',
            style: textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1E1E26),
              fontSize: isMobile ? 26 : 34,
              height: 1.08,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: textTheme.titleMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 14 : 16,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          _checkLine(textTheme, 'Organisation simplifiee'),
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
                'Tous vos rendez-vous medicaux au meme endroit',
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
              _checkLine(textTheme, 'Organisation simplifiee'),
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
        Text(
          text,
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
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
          'CEB, votre assistant quotidien au service de votre serenite',
          style: textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF1E1E26),
            fontSize: isMobile ? 26 : 36,
            height: 1.05,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Rappels, ordonnances, rendez-vous et suivi : Cebmed reduit la charge mentale liee aux traitements grace a un accompagnement simple et rassurant',
          style: textTheme.titleMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: isMobile ? 15 : 18,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 18),
        _checkLine(textTheme, 'Stockage des ordonnances'),
        const SizedBox(height: 8),
        _checkLine(textTheme, 'Suivi des prises en temps reel'),
      ],
    );
  }
}








