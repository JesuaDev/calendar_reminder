class ProfileEntity {
  final String? id;
  final String? name;
  final String? nameKeyUser;
  final String? photo;
  final bool? active;

  const ProfileEntity({
    required this.name,
    required this.photo,
    required this.active,
    required this.nameKeyUser,
    this.id,
  });
}
