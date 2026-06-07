import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final appBarTitleSize = width < 600 ? 16.0 : (width < 1024 ? 17.0 : 18.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Politique de confidentialité'),
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
                  'Politique de confidentialité',
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                _paragraph(textTheme, 'Dernière mise à jour : 07 juin 2026'),
                const SizedBox(height: 18),
                _paragraph(
                  textTheme,
                  'Chez Cebmed, la protection de vos données personnelles est une priorité. Cette politique de confidentialité explique quelles informations nous collectons, comment elles sont utilisées, stockées et protégées.',
                ),
                _section(
                  textTheme,
                  title: '1. Données collectées',
                  intro: 'Selon votre utilisation de Cebmed, nous pouvons collecter les informations suivantes :',
                  bullets: const [
                    'Nom et prénom',
                    'Adresse email',
                    'Numéro de téléphone (si applicable)',
                    'Informations de compte utilisateur',
                    'Préférences utilisateur',
                    'Données techniques (adresse IP, type d’appareil, navigateur, journaux techniques)',
                    'Données d’utilisation de l’application',
                    'Informations relatives aux rappels médicamenteux configurés par l’utilisateur',
                  ],
                ),
                _section(
                  textTheme,
                  title: '2. Finalité de la collecte',
                  intro: 'Les données collectées sont utilisées pour :',
                  bullets: const [
                    'Créer et gérer votre compte utilisateur',
                    'Envoyer des rappels de prise de médicaments',
                    'Améliorer l’expérience utilisateur et les performances de l’application',
                    'Répondre aux demandes d’assistance',
                    'Assurer la sécurité et le bon fonctionnement du service',
                    'Envoyer des communications importantes liées au service',
                  ],
                ),
                _section(
                  textTheme,
                  title: '3. Base légale du traitement',
                  intro: 'Le traitement de vos données repose sur :',
                  bullets: const [
                    'Votre consentement',
                    'L’exécution du service demandé',
                    'Nos obligations légales',
                    'Notre intérêt légitime à améliorer et sécuriser le service',
                  ],
                ),
                _section(
                  textTheme,
                  title: '4. Partage des données',
                  intro: 'Nous ne vendons jamais vos données personnelles.\n\nCertaines données peuvent être partagées uniquement avec des prestataires techniques nécessaires au fonctionnement du service, notamment :',
                  bullets: const [
                    'Services d’hébergement',
                    'Services d’authentification',
                    'Services d’envoi d’emails ou notifications',
                    'Services d’analyse technique et de performance',
                  ],
                ),
                _section(
                  textTheme,
                  title: '5. Conservation des données',
                  intro: 'Les données personnelles sont conservées uniquement pendant la durée nécessaire à la fourniture du service ou conformément aux obligations légales applicables.',
                ),
                _section(
                  textTheme,
                  title: '6. Sécurité',
                  intro: 'Nous mettons en œuvre des mesures techniques et organisationnelles raisonnables afin de protéger vos données contre tout accès non autorisé, perte, divulgation ou modification.',
                ),
                _section(
                  textTheme,
                  title: '7. Vos droits',
                  intro: 'Conformément à la réglementation applicable, vous disposez des droits suivants :',
                  bullets: const [
                    'Droit d’accès',
                    'Droit de rectification',
                    'Droit à l’effacement',
                    'Droit d’opposition',
                    'Droit à la limitation du traitement',
                    'Droit à la portabilité',
                  ],
                  outro: 'Pour exercer vos droits, contactez-nous à : cebmed.contact@gmail.com',
                ),
                _section(
                  textTheme,
                  title: '8. Données liées à la santé',
                  intro: 'Cebmed permet l’organisation et le suivi de rappels médicamenteux.\n\nCertaines informations fournies par l’utilisateur peuvent être considérées comme sensibles. Nous nous engageons à les traiter avec un niveau de protection approprié.',
                ),
                _section(
                  textTheme,
                  title: '9. Utilisation web',
                  intro: 'Lors de l’utilisation de la version web de Cebmed, certaines données techniques peuvent être automatiquement collectées afin d’assurer le bon fonctionnement du service.',
                ),
                _section(
                  textTheme,
                  title: '10. Mineurs',
                  intro: 'Le service n’est pas destiné aux enfants de moins de 13 ans sans supervision parentale ou légale.',
                ),
                _section(
                  textTheme,
                  title: '11. Modifications',
                  intro: 'Cette politique de confidentialité peut être mise à jour à tout moment.\n\nLes modifications importantes seront communiquées via l’application ou le site.',
                ),
                _section(
                  textTheme,
                  title: '12. Contact',
                  intro: 'Pour toute question concernant cette politique de confidentialité : cebmed.contact@gmail.com',
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
    String? outro,
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
          if (outro != null) ...[
            const SizedBox(height: 10),
            _paragraph(textTheme, outro),
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
