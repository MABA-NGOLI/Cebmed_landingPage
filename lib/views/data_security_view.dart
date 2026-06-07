import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DataSecurityView extends StatelessWidget {
  const DataSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final appBarTitleSize = width < 600 ? 16.0 : (width < 1024 ? 17.0 : 18.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sécurité des données'),
        titleTextStyle: TextStyle(
          fontFamily: 'Grandstander',
          fontSize: appBarTitleSize,
          fontWeight: FontWeight.w700,
          color: AppTheme.black,
        ),
        backgroundColor: AppTheme.white,
        foregroundColor: AppTheme.black,
        elevation: 0,
      ),
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 920),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sécurité des données',
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                _paragraph(
                  textTheme,
                  'Chez Cebmed, la sécurité et la confidentialité de vos données sont une priorité.\n\n'
                  'Nous mettons en œuvre des mesures techniques et organisationnelles raisonnables afin de protéger les informations personnelles de nos utilisateurs contre tout accès non autorisé, perte, divulgation, altération ou destruction.',
                ),
                _section(
                  textTheme,
                  title: 'Protection des données',
                  intro:
                      'Nous prenons des mesures de sécurité adaptées pour protéger les données collectées via notre application et notre site web.\n\n'
                      'Ces mesures peuvent inclure :',
                  bullets: const [
                    'La sécurisation des accès aux systèmes et services',
                    'La protection des communications entre l’application et nos serveurs',
                    'La limitation de l’accès aux données aux seules personnes autorisées',
                    'La surveillance et l’amélioration continue de nos mécanismes de sécurité',
                    'La prévention des accès non autorisés et des usages abusifs',
                  ],
                ),
                _section(
                  textTheme,
                  title: 'Confidentialité des informations',
                  intro:
                      'Les données personnelles confiées à Cebmed sont traitées avec confidentialité.\n\n'
                      'Nous ne vendons, ne louons et ne partageons pas vos informations personnelles à des tiers à des fins commerciales sans votre consentement, sauf lorsque cela est nécessaire au fonctionnement du service ou requis par la loi.',
                ),
                _section(
                  textTheme,
                  title: 'Données sensibles',
                  intro:
                      'Certaines informations utilisées dans Cebmed, notamment celles liées à l’organisation des rappels médicamenteux, peuvent être considérées comme sensibles.\n\n'
                      'Nous nous engageons à appliquer un niveau de protection approprié à ce type d’informations.',
                ),
                _section(
                  textTheme,
                  title: 'Responsabilité de l’utilisateur',
                  intro:
                      'L’utilisateur est également responsable de la sécurité de son compte.\n\n'
                      'Nous recommandons de :',
                  bullets: const [
                    'Utiliser un mot de passe sécurisé',
                    'Ne jamais partager ses identifiants de connexion',
                    'Maintenir son appareil à jour',
                    'Signaler immédiatement toute activité suspecte',
                  ],
                ),
                _section(
                  textTheme,
                  title: 'Évolution des mesures de sécurité',
                  intro:
                      'Nos pratiques de sécurité peuvent évoluer afin de s’adapter aux nouvelles exigences techniques, réglementaires et de sécurité.',
                ),
                _section(
                  textTheme,
                  title: 'Contact',
                  intro: 'Pour toute question relative à la sécurité de vos données : cebmed.contact@gmail.com',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _section(
    TextTheme textTheme, {
    required String title,
    required String intro,
    List<String> bullets = const [],
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: AppTheme.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          _paragraph(textTheme, intro),
          if (bullets.isNotEmpty) ...[
            const SizedBox(height: 10),
            _bulletList(textTheme, bullets),
          ],
        ],
      ),
    );
  }

  Widget _paragraph(TextTheme textTheme, String text) {
    return Text(
      text,
      style: textTheme.bodyLarge?.copyWith(
        color: const Color(0xFF4B4D59),
        fontWeight: FontWeight.w500,
        height: 1.55,
      ),
    );
  }

  Widget _bulletList(TextTheme textTheme, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Icon(Icons.circle, size: 6, color: AppTheme.primaryPink),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: _paragraph(textTheme, item)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
