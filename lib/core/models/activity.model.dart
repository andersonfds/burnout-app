import 'package:app/core/models/base/base.model.dart';

class ActivityModel with BaseModel {
  int? id;
  int? price;
  int? unlockPrice;
  String? levelName;
  String? name;
  String? flag;
  String? description;
  String? thumbnail;
  bool locked;

  ActivityModel({
    this.id,
    this.price,
    this.unlockPrice,
    this.levelName,
    this.name,
    this.flag,
    this.description,
    this.thumbnail,
    this.locked = true,
  });
}
