import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_arquitetura_01/domain/entities/product.dart';
import 'package:mobile_arquitetura_01/domain/repositories/product_repository.dart';
import 'package:mobile_arquitetura_01/domain/usecases/get_products.dart';
import 'package:mobile_arquitetura_01/main.dart';

class FakeProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async => [];
}

void main() {
  testWidgets('Renderiza tela de produtos', (WidgetTester tester) async {
    final getProducts = GetProducts(FakeProductRepository());

    await tester.pumpWidget(MyApp(getProducts: getProducts));
    await tester.pump();

    expect(find.text('Produtos'), findsOneWidget);
  });
}
