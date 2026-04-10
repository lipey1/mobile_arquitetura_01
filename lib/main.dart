import 'package:flutter/material.dart';

import 'core/network/api_client.dart';
import 'data/datasources/product_remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/get_products.dart';
import 'presentation/pages/products_page.dart';

void main() {
  final apiClient = ApiClient();
  final remoteDataSource = ProductRemoteDataSourceImpl(apiClient);
  final repository = ProductRepositoryImpl(remoteDataSource);
  final getProducts = GetProducts(repository);

  runApp(MyApp(getProducts: getProducts));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.getProducts});

  final GetProducts getProducts;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Arquitetura 01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProductsPage(getProducts: getProducts),
    );
  }
}
