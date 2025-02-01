import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../config/config.dart';
import '../../../helpers/helpers.dart';

class BaseService {
  /// Create a request class instance
  late PocketBase pocketBase;
  late Database db;

  @mustCallSuper
  String? database;

  /// Instantiate Service
  BaseService() {
    pocketBase = PocketBase(Config.pocketBaseUrl);
    if (database != null) db = Database(database!);

    print("Initializing ${database} Table File");
  }
}
