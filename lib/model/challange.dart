class Challange {
  int? id;
  String? name;
  String? description;

  Challange({
    this.id,
    this.name,
    this.description,
  });
  factory Challange.fromJson(Map<String, dynamic> json) => Challange(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        description: json["description"] ?? null,
      );

  Map<String, dynamic> get toJson => {
        "name": this.name,
        "description": this.description,
      };
}
