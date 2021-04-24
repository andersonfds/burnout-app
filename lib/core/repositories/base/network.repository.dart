import 'dart:async';
import 'dart:io';

import 'package:app/core/models/base/base.model.dart';
import 'package:app/core/models/models.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

abstract class NetworkRepository<T extends BaseModel> extends GetConnect {
  final GetStorage _box = Get.find();

  /// The API base URL, if set to `null` it will
  /// automatically pick from config folder
  ///
  /// Defaults to `null`
  String? apiUrl;

  /// Wether should inject the token on the request
  /// defaults to true
  bool enableToken = true;

  /// An empty instance of the class
  /// this shell will be used to fill with
  /// the json values
  T get model;

  /// Creates a Network Repository
  NetworkRepository({this.apiUrl}) {
    httpClient.baseUrl = apiUrl;
    httpClient.addRequestModifier<Object?>(requestModifier);
    httpClient.defaultDecoder = (value) => value;
  }

  FutureOr<Request<Object?>> requestModifier(Request<Object?> request) {
    final userData = _box.read('user');

    if (userData != null) {
      final AuthModel? auth = AuthModel().fill(_box.read('user'));

      request.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer ${auth?.token}',
      });
    }

    return request;
  }
}
