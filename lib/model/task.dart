class Task {
  int? id;
  String? name;
  String? description;
  String? iconImage;

  String? image;
  Task({this.id, this.name, this.description, this.image, this.iconImage});
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        description: json["description"] ?? null,
        iconImage: json["iconImage"] ?? null,
        image: json["image"] ?? null,
      );

  Map<String, dynamic> get toJson => {
        "name": this.name,
        "description": this.description,
        "iconImage": this.iconImage,
        "image": this.image,
      };
}

List<Task> listDataTask = [
  Task(
    name: "Bin to win",
    description: "Recycling makes you feel good on the inside!",
    image: "assets/images/recycle.png",
  ),
  Task(
    name: "Bottle rocket",
    description: "Many brands of bottled water are really just tap...",
    image: "assets/images/bottle.png",
  ),
];
