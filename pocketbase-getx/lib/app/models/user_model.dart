class UserModel {
  final String? avatar;
  final DateTime? created;
  final String? email;
  final bool? emailVisibility;
  final String? id;
  final String? name;
  final DateTime? updated;
  final bool? verified;

  UserModel({
    this.avatar,
    this.created,
    this.email,
    this.emailVisibility,
    this.id,
    this.name,
    this.updated,
    this.verified,
  });

  UserModel copyWith({
    String? avatar,
    DateTime? created,
    String? email,
    bool? emailVisibility,
    String? id,
    String? name,
    DateTime? updated,
    bool? verified,
  }) =>
      UserModel(
        avatar: avatar ?? this.avatar,
        created: created ?? this.created,
        email: email ?? this.email,
        emailVisibility: emailVisibility ?? this.emailVisibility,
        id: id ?? this.id,
        name: name ?? this.name,
        updated: updated ?? this.updated,
        verified: verified ?? this.verified,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        avatar: json["avatar"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        email: json["email"],
        emailVisibility: json["emailVisibility"],
        id: json["id"],
        name: json["name"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "created": created?.toIso8601String(),
        "email": email,
        "emailVisibility": emailVisibility,
        "id": id,
        "name": name,
        "updated": updated?.toIso8601String(),
        "verified": verified,
      };
}
