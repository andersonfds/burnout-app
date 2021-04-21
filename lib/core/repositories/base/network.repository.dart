import 'package:app/core/models/base/base.model.dart';
import 'package:get/get.dart';

abstract class NetworkRepository<T extends BaseModel> extends GetConnect {
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
    // httpClient.defaultDecoder = decoder;
  }

  /// This will decode the response into a model
  dynamic decoder(dynamic data) {
    if (data is List)
      // if its a list decoding as list
      return data.map((json) => model.fill(json)).toList();

    // otherwise decoding as item
    return model.fill(data);
  }
}
