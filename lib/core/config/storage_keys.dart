/// This class will be used to maintain consistence
/// when storing user data in non-volatile and non
/// relational database
enum StorageKeys {
  /// This key is used to store user
  /// authentication token data
  UserData,
}

extension StorageName on StorageKeys {
  /// Gets the unique key of the storage
  /// prefer this instead of usingn `toString`
  /// directly because this could change in
  /// a future without warning
  String get key => this.toString();
}
