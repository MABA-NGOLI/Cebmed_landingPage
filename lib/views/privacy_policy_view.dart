import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Politique de confidentialité'),
        backgroundColor: AppTheme.white,
        foregroundColor: AppTheme.black,
        elevation: 0,
      ),
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Politique de confidentialité',
              style: textTheme.headlineSmall?.copyWith(
                color: AppTheme.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nous collectons uniquement les données nécessaires au service, notamment l\'adresse email pour la newsletter.\n\n'
              'Vous pouvez retirer votre consentement à tout moment en nous contactant à : cebmed.contact@gmail.com.\n\n'
              'Les données sont traitées avec des standards de sécurité élevés et conservées uniquement pour les finalités prévues.',
              style: textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF4B4D59),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
