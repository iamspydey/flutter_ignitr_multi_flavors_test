import '../../../shared/shared.dart';
import 'article_service.dart';

class LocalArticleService extends BaseService implements ArticleService {
  @override
  String? database = 'articles';

  @override
  Future<ApiResponse> index() async {
    List<Map<String, dynamic>> data = await db.get();
    return ApiResponse.success(data: data);
  }

  @override
  Future<ApiResponse> show({required int id}) async {
    Map<String, dynamic>? data = await db.where({'id': id}).first();
    return ApiResponse.success(data: data);
  }

  @override
  Future<ApiResponse> store({required Map<String, dynamic> data}) async {
    List<Map<String, dynamic>> _data = await db.store(data);
    return ApiResponse.success(data: _data);
  }

  @override
  Future<ApiResponse> patch(
      {required int id, required Map<String, dynamic> data}) async {
    await db.where({'id': id}).update(data);
    Map<String, dynamic>? _data = await db.where({'id': id}).first();
    return ApiResponse.success(data: _data);
  }

  @override
  Future<ApiResponse> destroy({required int id}) async {
    await db.where({'id': id}).delete();
    return ApiResponse.success();
  }
}
