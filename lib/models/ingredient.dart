class IngredientModel {
  int? id;
  String? title;
  String? dsc;

  IngredientModel({
    this.id,
    this.title,
    this.dsc
  });

  IngredientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'].toString();
    dsc = json['dsc'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['dsc'] = dsc;
    return data;
  }
}