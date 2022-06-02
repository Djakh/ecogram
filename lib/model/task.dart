class Task {
  int? id;
  String? name;
  String? description;
  int? point;
  int? water;
  int? waste;
  int? air;
  int? taskId;
  String? iconImage;
  String? image;
  Task({
    this.id,
    this.name,
    this.description,
    this.point,
    this.water,
    this.waste,
    this.air,
    this.taskId,
    this.iconImage,
    this.image,
  });
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        description: json["description"] ?? null,
        point: json["point"] ?? null,
        water: json["water"] ?? null,
        waste: json["waste"] ?? null,
        air: json["air"] ?? null,
        taskId: json["taskId"] ?? null,
        iconImage: json["iconImage"] ?? null,
        image: json["image"] ?? null,
      );

  Map<String, dynamic> get toJson => {
        "name": this.name,
        "description": this.description,
        "point": this.point,
        "water": this.water,
        "waste": this.waste,
        "air": this.air,
        "taskId": this.taskId,
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
