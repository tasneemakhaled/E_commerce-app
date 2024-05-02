class ServiceModel {
  String? id;
  String? name;
  String? description;
  String? color;
  ServiceModel({this.id, this.description, this.name, this.color});

  ServiceModel.fromJson(Map map) {
    id = map['id'].toString();
    description = map['description'];
    name = map['name'];
    color = map['color'];
  }
}
