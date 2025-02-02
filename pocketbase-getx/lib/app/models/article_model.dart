class ArticleModel {
  ArticleModel({
    this.id,
  });

  int? id;

  ArticleModel copyWith({
    int? id,
  }) =>
      ArticleModel(
        id: id ?? this.id,
      );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
