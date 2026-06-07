import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final appBarTitleSize = width < 600 ? 16.0 : (width < 1024 ? 17.0 : 18.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
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
                  'Support',
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                _paragraph(
                  textTheme,
                  'Bienvenue sur le support Cebmed.\n\n'
                  'Nous sommes là pour vous aider à utiliser Cebmed dans les meilleures conditions.\n\n'
                  'Si vous rencontrez un problème technique, une difficulté d’utilisation ou si vous avez une question concernant votre compte, notre équipe est disponible pour vous accompagner.',
                ),
                _section(
                  textTheme,
                  title: 'Comment pouvons-nous vous aider ?',
                  intro: 'Vous pouvez nous contacter pour :',
                  bullets: const [
                    'Problèmes de connexion à votre compte',
                    'Difficultés avec les rappels de médicaments',
                    'Questions sur le fonctionnement de l’application',
                    'Signalement d’un bug ou dysfonctionnement',
                    'Assistance liée aux notifications',
                    'Questions concernant vos données personnelles',
                    'Suggestions d’amélioration',
                  ],
                ),
                _section(
                  textTheme,
                  title: 'Contact support',
                  intro:
                      'Pour toute demande d’assistance, contactez-nous à : cebmed.app@gmail.com\n\n'
                      'Nous ferons notre maximum pour vous répondre dans les meilleurs délais.',
                ),
                _section(
                  textTheme,
                  title: 'Informations utiles',
                  intro: 'Lorsque vous contactez le support, merci d’inclure si possible :',
                  bullets: const [
                    'Le modèle de votre appareil',
                    'Le système d’exploitation utilisé',
                    'Une description du problème rencontré',
                    'Une capture d’écran si nécessaire',
                  ],
                  outro: 'Cela nous aidera à résoudre votre problème plus rapidement.',
                ),
                _section(
                  textTheme,
                  title: 'Temps de réponse',
                  intro: 'Notre équipe s’efforce de répondre aux demandes de support dans un délai raisonnable, généralement sous 24 à 72 heures ouvrées.',
                ),
                _section(
                  textTheme,
                  title: 'Avertissement',
                  intro:
                      'Le support Cebmed fournit une assistance technique et fonctionnelle concernant l’application.\n\n'
                      'Le support ne fournit pas de conseils médicaux.\n\n'
                      'Pour toute question liée à votre santé ou à un traitement médical, veuillez consulter un professionnel de santé.',
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
