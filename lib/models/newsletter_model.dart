class NewsletterModel {
  const NewsletterModel({
    required this.id,
    required this.email,
    required this.acceptConditions,
    this.acceptedAt,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String email;
  final bool acceptConditions;
  final DateTime? acceptedAt;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory NewsletterModel.fromJson(Map<String, dynamic> json) {
    return NewsletterModel(
      id: json['id'] as int,
      email: json['email'] as String,
      acceptConditions: json['accept_conditions'] as bool? ?? false,
      acceptedAt: json['accepted_at'] != null
          ? DateTime.tryParse(json['accepted_at'] as String)
          : null,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'accept_conditions': acceptConditions,
      'accepted_at': acceptedAt?.toIso8601String(),
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
