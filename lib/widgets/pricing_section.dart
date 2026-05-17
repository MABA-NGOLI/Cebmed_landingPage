import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    final isCompact = width < 560;

    return Container(
      width: double.infinity,
      color: const Color(0xFFC9D5EA),
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 8 : (isMobile ? 12 : 24),
        vertical: isCompact ? 14 : (isMobile ? 22 : 34),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Choisissez votre sérénité',
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF1E1E26),
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 34 : 44,
                ),
              ),
              SizedBox(height: isMobile ? 18 : 28),
              if (isMobile)
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Column(
                      children: [
                        _FreePlanCard(isCompact: isCompact),
                        const SizedBox(height: 10),
                        _PremiumPlanCard(isCompact: isCompact),
                      ],
                    ),
                  ),
                )
              else
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 430, child: _FreePlanCard(isCompact: false)),
                      SizedBox(width: 22),
                      SizedBox(width: 430, child: _PremiumPlanCard(isCompact: false)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FreePlanCard extends StatelessWidget {
  const _FreePlanCard({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final p = isCompact ? 14.0 : 28.0;
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Container(
      padding: EdgeInsets.fromLTRB(p, isCompact ? 14 : 24, p, isCompact ? 12 : 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F8),
        borderRadius: BorderRadius.circular(isCompact ? 20 : 34),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gratuit', style: textTheme.titleLarge?.copyWith(color: const Color(0xFF1F1F25), fontSize: isCompact ? 20 : 24)),
          const SizedBox(height: 6),
          Text(
            'L\'essentiel pour un suivi quotidien.',
            style: textTheme.bodyLarge?.copyWith(color: const Color(0xFF6D6D75), fontWeight: FontWeight.w500, fontSize: isCompact ? 13 : 16),
          ),
          SizedBox(height: isCompact ? 10 : 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '0€',
                  style: textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF1F1F25),
                    fontWeight: FontWeight.w700,
                    fontSize: isCompact ? 30 : 42,
                  ),
                ),
                TextSpan(
                  text: ' / mois',
                  style: textTheme.bodyLarge?.copyWith(color: const Color(0xFF7A7A82), fontWeight: FontWeight.w500, fontSize: isCompact ? 13 : 16),
                ),
              ],
            ),
          ),
          SizedBox(height: isCompact ? 8 : 16),
          _PlanLine(text: '1 aidant/patient inclus', isCompact: isCompact),
          _PlanLine(text: 'Notifications discrètes et personnalisables', isCompact: isCompact),
          _PlanLine(text: 'Stockage sécurisé des ordonnances', isCompact: isCompact),
          _PlanLine(text: 'Suivi des prises de médicaments en temps réel', isCompact: isCompact),
          _PlanLine(text: 'Agenda médical intégré', isCompact: isCompact),
          SizedBox(height: isCompact ? 10 : 20),
          if (isDesktop) const SizedBox(height: 22),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppTheme.primaryPink, width: 1.2),
              foregroundColor: AppTheme.primaryPink,
              minimumSize: Size(double.infinity, isCompact ? 40 : 52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              padding: EdgeInsets.zero,
            ),
            child: Text('Commencer gratuitement', style: textTheme.bodyLarge?.copyWith(fontSize: isCompact ? 13 : 16, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _PremiumPlanCard extends StatelessWidget {
  const _PremiumPlanCard({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final p = isCompact ? 14.0 : 28.0;

    return Container(
      padding: EdgeInsets.fromLTRB(p, isCompact ? 14 : 24, p, isCompact ? 14 : 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isCompact ? 20 : 34),
        color: const Color(0xFFE18BCF),
        boxShadow: const [
          BoxShadow(color: Color(0x26000000), blurRadius: 14, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Premium',
                style: textTheme.titleLarge?.copyWith(color: AppTheme.white, fontSize: isCompact ? 20 : 24),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: isCompact ? 6 : 10, vertical: isCompact ? 3 : 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'RECOMMANDÉ',
                  style: textTheme.bodyMedium?.copyWith(color: AppTheme.white, fontSize: isCompact ? 9 : 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Le meilleur de Cebmed, sans limite',
            style: textTheme.bodyLarge?.copyWith(color: const Color(0xFFFFE7F7), fontWeight: FontWeight.w500, fontSize: isCompact ? 13 : 16),
          ),
          SizedBox(height: isCompact ? 6 : 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '4.99€',
                  style: textTheme.headlineMedium?.copyWith(
                    color: AppTheme.white,
                    fontWeight: FontWeight.w700,
                    fontSize: isCompact ? 30 : 42,
                  ),
                ),
                TextSpan(
                  text: ' / mois',
                  style: textTheme.bodyLarge?.copyWith(color: const Color(0xFFFFE7F7), fontWeight: FontWeight.w500, fontSize: isCompact ? 13 : 16),
                ),
              ],
            ),
          ),
          SizedBox(height: isCompact ? 4 : 16),
          _PlanLine(text: 'Scan IA d\'ordonnance', light: true, isCompact: isCompact, icon: Icons.auto_awesome_outlined),
          _PlanLine(text: 'Mode Aidant illimité', light: true, isCompact: isCompact, icon: Icons.groups_2_outlined),
          _PlanLine(text: 'Réapprovisionnement des stocks', light: true, isCompact: isCompact, icon: Icons.inventory_2_outlined),
          _PlanLine(text: 'Fonctionnalités exclusives', light: true, isCompact: isCompact, icon: Icons.psychology_alt_outlined),
          SizedBox(height: isCompact ? 6 : 34),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFF6F6F8),
              foregroundColor: AppTheme.primaryPink,
              minimumSize: Size(double.infinity, isCompact ? 40 : 54),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              padding: EdgeInsets.zero,
            ),
            child: Text('S\'abonner maintenant', style: textTheme.bodyLarge?.copyWith(fontSize: isCompact ? 13 : 16, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _PlanLine extends StatelessWidget {
  const _PlanLine({
    required this.text,
    required this.isCompact,
    this.light = false,
    this.icon,
  });

  final String text;
  final bool light;
  final bool isCompact;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(bottom: isCompact ? 2 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon ?? Icons.done_rounded,
            size: isCompact ? 12 : 18,
            color: light ? AppTheme.white : AppTheme.primaryPink,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyLarge?.copyWith(
                color: light ? const Color(0xFFFFF2FB) : const Color(0xFF4A4A50),
                fontWeight: FontWeight.w500,
                fontSize: isCompact ? 13 : 16,
                height: isCompact ? 1.15 : 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
