import 'package:flutter/foundation.dart';
import '../models/newsletter_request.dart';
import '../services/newsletter_service.dart';

class NewsletterViewModel extends ChangeNotifier {
  NewsletterViewModel({NewsletterService? service})
      : _service = service ?? NewsletterService();

  final NewsletterService _service;

  bool _submitting = false;
  bool get submitting => _submitting;

  String? validateEmail(String email) {
    final value = email.trim();
    if (value.isEmpty || !value.contains('@')) {
      return 'Veuillez entrer un email valide.';
    }
    return null;
  }

  Future<String> submit(String email) async {
    final validationError = validateEmail(email);
    if (validationError != null) return validationError;

    _submitting = true;
    notifyListeners();

    try {
      final (statusCode, _) = await _service.subscribe(
        NewsletterRequest(email: email.trim()),
      );

      if (statusCode == 201) return 'Inscription newsletter réussie.';
      if (statusCode == 409) return 'Cet email est déjà inscrit.';
      return 'Impossible de vous inscrire pour le moment.';
    } catch (_) {
      return 'Erreur réseau. Réessayez plus tard.';
    } finally {
      _submitting = false;
      notifyListeners();
    }
  }
}
