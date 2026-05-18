class NewsletterRequest {
  const NewsletterRequest({
    required this.email,
    this.acceptConditions = true,
  });

  final String email;
  final bool acceptConditions;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'accept_conditions': acceptConditions,
    };
  }
}
