import 'package:app/core/models/base/base.model.dart';

extension BaseModelUtil on BaseModel {
  List<T> listOf<T extends BaseModel>(dynamic data) =>
      (data as List).map((e) => this.fill(e) as T).toList();
}
