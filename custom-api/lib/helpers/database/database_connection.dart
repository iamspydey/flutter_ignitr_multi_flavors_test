import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  final String databaseFile;
  late File _file;
  late List<Map<String, dynamic>> _data;
  Map<String, dynamic>? whereClause;
  int? _limit;
  int? _offset;

  DatabaseConnection(this.databaseFile) {
    getFile();
    loadData();
  }

  // Get the JSON file path
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    _file = File('${directory.path}/${databaseFile}.json');
    if (!_file.existsSync()) {
      await saveFile([]);
      _file = File('${directory.path}/${databaseFile}.json');
    }
    return _file;
  }

  // Load data from JSON file
  Future<List<Map<String, dynamic>>> loadData() async {
    _file = await getFile();
    final contents = await _file.readAsString();
    _data = List<Map<String, dynamic>>.from(jsonDecode(contents));
    return _data;
  }

  // Save data to JSON file
  Future<void> saveFile(List<Map<String, dynamic>> updatedData) async {
    try {
      final jsonString = jsonEncode(updatedData);
      await _file.writeAsString(jsonString);
    } catch (e) {
      print("Error saving JSON file: $e");
    }
  }

  // Apply filtering based on where clause
  Future<List<Map<String, dynamic>>> filteredData() async {
    if (whereClause == null) return _data;

    return _data.where((record) {
      for (var key in whereClause!.keys) {
        if (!_matchCondition(record[key], whereClause![key])) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  // Helper to match conditions
  bool _matchCondition(dynamic fieldValue, dynamic condition) {
    if (condition is Map) {
      if (condition.containsKey('like')) {
        final regex = RegExp(condition['like'], caseSensitive: false);
        return regex.hasMatch(fieldValue.toString());
      } else if (condition.containsKey('eq')) {
        return fieldValue == condition['eq'];
      } else if (condition.containsKey('neq')) {
        return fieldValue != condition['neq'];
      }
    } else {
      return fieldValue == condition;
    }
    return false;
  }

  // Apply pagination (limit and offset)
  List<Map<String, dynamic>> applyPagination(List<Map<String, dynamic>> data) {
    data = data.skip((_offset ?? 0) * (_limit ?? 10)).toList();
    data = data.take(_limit ?? 10).toList();
    return data;
  }

  // Apply pagination (limit and offset)
  Future<List<Map<String, dynamic>>> paginate(
      [int perPage = 10, int page = 1]) async {
    _limit = perPage;
    _offset = _limit! * (page - 1);
    List<Map<String, dynamic>> data = await loadData();
    return applyPagination(data);
  }
}
