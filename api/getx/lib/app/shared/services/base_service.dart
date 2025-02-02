import 'package:flutter/foundation.dart';

import '../../../helpers/helpers.dart';

class BaseService {
  /// Create a request class instance
  late Request api;
  late Database db;

  @mustCallSuper
  String? database;

  /// Instantiate Service
  BaseService() {
    api = Request();
    if (database != null) db = Database(database!);
    print("Initializing ${database} Table File");
  }

  /// Start the server [Request]
  void init(String client) => api.start(client);

  /// Stop the server [Request]
  void close(String client) => api.close(client);
}
