import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LegalNoticesView extends StatelessWidget {
  const LegalNoticesView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final appBarTitleSize = width < 600 ? 16.0 : (width < 1024 ? 17.0 : 18.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentions légales'),
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
                  'Mentions légales',
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                _paragraph(textTheme, 'Dernière mise à jour : 07 juin 2026'),
                _section(
                  textTheme,
                  title: 'Éditeur du site',
                  content:
                      'Le présent site est édité par Cebmed, application dédiée à la gestion et au suivi des rappels médicamenteux.\n\n'
                      'Responsable de publication : Cebmed\n'
                      'Email de contact : cebmed.app@gmail.com',
                ),
                _section(
                  textTheme,
                  title: 'Hébergement',
                  content:
                      'Le site web de Cebmed est hébergé par :\n\n'
                      'Vercel Inc.\n'
                      '440 N Barranca Ave #4133\n'
                      'Covina, CA 91723\n'
                      'États-Unis',
                ),
                _section(
                  textTheme,
                  title: 'Propriété intellectuelle',
                  content:
                      'L’ensemble du contenu présent sur ce site, incluant notamment les textes, éléments graphiques, logos, icônes, images, interfaces et contenus numériques, est protégé par les lois applicables en matière de propriété intellectuelle.\n\n'
                      'Toute reproduction, représentation, modification, diffusion ou exploitation, totale ou partielle, sans autorisation préalable, est interdite.',
                ),
                _section(
                  textTheme,
                  title: 'Responsabilité',
                  content:
                      'Les informations fournies sur ce site sont communiquées à titre informatif uniquement.\n\n'
                      'Cebmed s’efforce de fournir des informations aussi exactes que possible, mais ne garantit pas l’exactitude, l’exhaustivité ou l’actualité des contenus publiés.\n\n'
                      'L’utilisation du site se fait sous la seule responsabilité de l’utilisateur.',
                ),
                _section(
                  textTheme,
                  title: 'Données personnelles',
                  content:
                      'Les informations personnelles collectées via le site ou l’application sont traitées conformément à notre politique de confidentialité.\n\n'
                      'Pour toute question relative à vos données personnelles : cebmed.contact@gmail.com',
                ),
                _section(
                  textTheme,
                  title: 'Utilisation du service',
                  content:
                      'Le site et l’application Cebmed ont pour objectif d’aider à l’organisation et au suivi des rappels médicamenteux.\n\n'
                      'Ils ne remplacent en aucun cas un avis, un diagnostic ou une consultation auprès d’un professionnel de santé.',
                ),
                _section(
                  textTheme,
                  title: 'Contact',
                  content: 'Pour toute demande d’information : cebmed.contact@gmail.com',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _section(TextTheme textTheme, {required String title, required String content}) {
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
          _paragraph(textTheme, content),
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
}
