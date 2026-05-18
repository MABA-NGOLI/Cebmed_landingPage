import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../viewmodels/newsletter_view_model.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  static final Uri _instagramUri = Uri.parse('https://www.instagram.com/cebmed.app/');
  static final Uri _contactEmailUri = Uri(scheme: 'mailto', path: 'cebmed.contact@gmail.com');

  final TextEditingController _newsletterController = TextEditingController();
  late final NewsletterViewModel _newsletterViewModel;

  @override
  void initState() {
    super.initState();
    _newsletterViewModel = NewsletterViewModel()..addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _newsletterController.dispose();
    _newsletterViewModel.removeListener(_onViewModelChanged);
    _newsletterViewModel.dispose();
    super.dispose();
  }

  Future<void> _openInstagram(BuildContext context) async {
    final opened = await launchUrl(_instagramUri, mode: LaunchMode.platformDefault);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir Instagram.')),
      );
    }
  }

  Future<void> _openEmail(BuildContext context) async {
    final opened = await launchUrl(_contactEmailUri, mode: LaunchMode.platformDefault);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir votre application email.')),
      );
    }
  }

  void _onFooterLinkTap(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label bientôt disponible.')),
    );
  }

  Future<void> _submitNewsletter() async {
    final message = await _newsletterViewModel.submit(_newsletterController.text);
    if (!mounted) return;
    if (message == 'Inscription newsletter réussie.') {
      _newsletterController.clear();
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 900;

        return Container(
          width: double.infinity,
          color: AppTheme.white,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 24,
            vertical: isMobile ? 34 : 28,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
              child: Column(
                children: [
                  isMobile ? _mobileTop(context, textTheme) : _desktopTopWithNewsletter(context, textTheme),
                  if (isMobile) ...[
                    const SizedBox(height: 18),
                    _mobileNewsletter(textTheme),
                  ],
                  const SizedBox(height: 18),
                  const Divider(height: 1, color: Color(0xFFEAEAF0)),
                  const SizedBox(height: 10),
                  _bottomRow(context, textTheme, isMobile: isMobile),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _desktopTopWithNewsletter(BuildContext context, TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Cebmed',
                    style: textTheme.headlineSmall?.copyWith(
                      color: AppTheme.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/images/logo.png', width: 24, height: 24, fit: BoxFit.contain),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'L assistant santé nouvelle génération, conçu\npour votre bien-être.',
                style: textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF5A5D6A),
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Contact',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppTheme.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              _FooterLink(
                label: 'cebmed.contact@gmail.com',
                onTap: () => _openEmail(context),
              ),
              const SizedBox(height: 14),
              _desktopNewsletter(textTheme),
            ],
          ),
        ),
        const SizedBox(width: 28),
        Expanded(
          flex: 7,
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 28,
            runSpacing: 10,
            children: [
              _FooterLink(label: 'Confidentialité', onTap: () => _onFooterLinkTap(context, 'Confidentialité')),
              _FooterLink(label: 'Mentions légales', onTap: () => _onFooterLinkTap(context, 'Mentions légales')),
              _FooterLink(label: 'Sécurité des données', onTap: () => _onFooterLinkTap(context, 'Sécurité des données')),
              _FooterLink(label: 'Support', onTap: () => _onFooterLinkTap(context, 'Support')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mobileTop(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Cebmed',
              style: textTheme.headlineSmall?.copyWith(
                color: AppTheme.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset('assets/images/logo.png', width: 22, height: 22, fit: BoxFit.contain),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'L assistant santé nouvelle génération, conçu pour votre bien-être.',
          style: textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF5A5D6A),
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Contact',
          style: textTheme.bodyLarge?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        _FooterLink(label: 'cebmed.contact@gmail.com', onTap: () => _openEmail(context)),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FooterLink(label: 'Confidentialité', onTap: () => _onFooterLinkTap(context, 'Confidentialité')),
            const SizedBox(height: 6),
            _FooterLink(label: 'Mentions légales', onTap: () => _onFooterLinkTap(context, 'Mentions légales')),
            const SizedBox(height: 6),
            _FooterLink(label: 'Sécurité des données', onTap: () => _onFooterLinkTap(context, 'Sécurité des données')),
            const SizedBox(height: 6),
            _FooterLink(label: 'Support', onTap: () => _onFooterLinkTap(context, 'Support')),
          ],
        ),
      ],
    );
  }

  Widget _bottomRow(BuildContext context, TextTheme textTheme, {required bool isMobile}) {
    if (isMobile) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => _openInstagram(context),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset('assets/images/instagram-logo.png', width: 18, height: 18, fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© 2025 Cebmed Health Tech. Données de santé sécurisées HDS.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF8A8E9A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        InkWell(
          onTap: () => _openInstagram(context),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset('assets/images/instagram-logo.png', width: 18, height: 18, fit: BoxFit.contain),
          ),
        ),
        const Spacer(),
        Text(
          '© 2025 Cebmed Health Tech. Données de santé sécurisées HDS.',
          style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF8A8E9A), fontWeight: FontWeight.w500),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _desktopNewsletter(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'S\'inscrire à la newsletter',
          style: textTheme.bodyLarge?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE2E4EC)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.mail_outline_rounded, size: 18, color: Color(0xFF8A8E9A)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _newsletterController,
                    decoration: const InputDecoration(
                      hintText: 'Votre adresse email',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: FilledButton(
                    onPressed: _newsletterViewModel.submitting ? null : _submitNewsletter,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(132, 38),
                      backgroundColor: AppTheme.primaryPink,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(_newsletterViewModel.submitting ? '...' : 'S\'inscrire'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileNewsletter(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'S\'inscrire à la newsletter',
          style: textTheme.bodyLarge?.copyWith(color: AppTheme.black, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE2E4EC)),
            ),
            child: Row(
              children: [
                const Icon(Icons.mail_outline_rounded, size: 18, color: Color(0xFF8A8E9A)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _newsletterController,
                    decoration: const InputDecoration(
                      hintText: 'Votre adresse email',
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _newsletterViewModel.submitting ? null : _submitNewsletter,
            style: FilledButton.styleFrom(
              backgroundColor: AppTheme.primaryPink,
              minimumSize: const Size.fromHeight(44),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            ),
            child: Text(_newsletterViewModel.submitting ? 'Inscription...' : 'S\'inscrire'),
          ),
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF363846),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
