import '../../../shared/shared.dart';
import 'article_service.dart';

class RemoteArticleService extends BaseService implements ArticleService {
  @override
  Future<ApiResponse> index() {
    // TODO: implement index
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> show({required int id}) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> store({required Map<String, dynamic> data}) {
    // TODO: implement store
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> patch(
      {required int id, required Map<String, dynamic> data}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> destroy({required int id}) {
    // TODO: implement destroy
    throw UnimplementedError();
  }
}
