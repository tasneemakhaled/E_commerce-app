class ReceipeModel {
  final String? description;
  final String? imageUrl;
  final String? name;

  ReceipeModel({
    this.description,
    this.imageUrl,
    this.name,
  });

  factory ReceipeModel.fromJson(Map<String, dynamic> json) => ReceipeModel(
        description: json["description"],
        imageUrl: json["image_url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "image_url": imageUrl,
        "name": name,
      };
}
