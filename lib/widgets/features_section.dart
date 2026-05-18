import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return Container(
      width: double.infinity,
      color: AppTheme.primaryBlue.withValues(alpha: 0.35),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 18, vertical: isMobile ? 36 : 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Column(
            children: [
              Text(
                'Pourquoi vous aimerez Cebmed ?',
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(
                  color: AppTheme.black,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 30 : (isTablet ? 30 : 36),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Une approche centrée sur l\'humain pour vous accompagner sereinement dans votre parcours de soin.',
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: isMobile ? 13 : 16,
                ),
              ),
              SizedBox(height: isMobile ? 24 : 28),
              LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth;
                  if (w < 700) {
                    return const Column(
                      children: [
                        _FeatureCard(icon: Icons.notifications, title: 'Rappels\nintelligents', description: 'Des notifications qui s\'adaptent à votre emploi du temps pour ne jamais rien oublier.'),
                        SizedBox(height: 18),
                        _FeatureCard(icon: Icons.lock, title: 'Confidentialité\ntotale', description: 'Vos données de santé sont cryptées et stockées exclusivement sur des serveurs HDS en France.'),
                        SizedBox(height: 18),
                        _FeatureCard(icon: Icons.verified_user, title: 'Mode\naidant', description: 'Le mode aidant permet à un proche de veiller sur vous en cas d\'oubli, pour plus de sérénité au quotidien.'),
                        SizedBox(height: 18),
                        _FeatureCard(icon: Icons.description, title: 'Documents\nsécurisés', description: 'Centralisez toutes vos ordonnances dans un coffre-fort numérique.'),
                      ],
                    );
                  }

                  return GridView.count(
                    crossAxisCount: w >= 1150 ? 4 : 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: w >= 1150 ? 1.05 : 1.18,
                    children: const [
                      _FeatureCard(icon: Icons.notifications, title: 'Rappels\nintelligents', description: 'Des notifications qui s\'adaptent à votre emploi du temps pour ne jamais rien oublier.'),
                      _FeatureCard(icon: Icons.lock, title: 'Confidentialité\ntotale', description: 'Vos données de santé sont cryptées et stockées exclusivement sur des serveurs HDS en France.'),
                      _FeatureCard(icon: Icons.verified_user, title: 'Mode\naidant', description: 'Le mode aidant permet à un proche de veiller sur vous en cas d\'oubli, pour plus de sérénité au quotidien.'),
                      _FeatureCard(icon: Icons.description, title: 'Documents\nsécurisés', description: 'Centralisez toutes vos ordonnances dans un coffre-fort numérique.'),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      padding: EdgeInsets.fromLTRB(isMobile ? 16 : 22, isMobile ? 16 : 22, isMobile ? 16 : 22, isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(isMobile ? 22 : 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isMobile ? 30 : 34,
            height: isMobile ? 30 : 34,
            decoration: const BoxDecoration(
              color: AppTheme.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: isMobile ? 16 : 18, color: AppTheme.softYellow),
          ),
          SizedBox(height: isMobile ? 12 : 18),
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: const Color(0xFF222222),
              height: 1.2,
              fontSize: isMobile ? 18 : 21,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              height: 1.45,
              fontSize: isMobile ? 13 : 14,
            ),
          ),
        ],
      ),
    );
  }
}






