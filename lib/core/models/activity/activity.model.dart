import 'package:app/core/models/base/base.model.dart';

class ActivityModel with BaseModel {
  String? id;
  int? price;
  int? unlockPrice;
  String? levelName;
  String? name;
  String? flag;
  String? description;
  String? thumbnail;
  bool unlocked;

  ActivityModel({
    this.id,
    this.price,
    this.unlockPrice,
    this.levelName,
    this.name,
    this.flag,
    this.description,
    this.thumbnail,
    this.unlocked = true,
  });

  @override
  ActivityModel fill(dynamic json) {
    super.fill(json);
    return ActivityModel(
      id: json['id'],
      unlocked: json['unlocked'],
      description: json['description'],
      name: json['title'],
      levelName: json['levelName'],
      flag: json['levelTag'],
      thumbnail: json['thumbnail'],
      unlockPrice: int.tryParse(json['unlockPrice']),
      price: int.tryParse(json['price']),
    );
  }
}
