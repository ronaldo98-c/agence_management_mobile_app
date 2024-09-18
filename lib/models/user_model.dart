class User {
  User({
    this.id,
    this.email,
    this.token,
    this.personalInfo,
  });

  final int? id;
  final String? email;
  final String? token;
  final bool? personalInfo;

  User copyWith({
    int? id,
    String? email,
    String? token,
    bool? personalInfo,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        token: token ?? this.token,
        personalInfo: personalInfo ?? this.personalInfo,
      );
}