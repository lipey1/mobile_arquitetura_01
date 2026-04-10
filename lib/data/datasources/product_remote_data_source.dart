import '../../core/network/api_client.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<ProductModel>> getProducts() async {
    final responseBody = await _apiClient.getProducts();
    return responseBody
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
