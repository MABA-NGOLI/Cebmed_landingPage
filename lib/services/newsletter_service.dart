import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/newsletter_model.dart';
import '../models/newsletter_request.dart';

class NewsletterService {
  static final Uri _newsletterUri = Uri.parse(
    'https://cebmed.duckdns.org/cebmed/api/newsletter/subscribe',
  );

  Future<(int, NewsletterModel?)> subscribe(NewsletterRequest request) async {
    final response = await http.post(
      _newsletterUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as Map<String, dynamic>;
      return (response.statusCode, NewsletterModel.fromJson(data));
    }
    return (response.statusCode, null);
  }
}
