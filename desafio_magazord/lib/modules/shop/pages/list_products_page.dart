import 'package:desafio_magazord/modules/shop/models/product.dart';
import 'package:desafio_magazord/modules/shop/repositories/shop_repository.dart';
import 'package:desafio_magazord/modules/shop/widgets/product_widget.dart';
import 'package:desafio_magazord/modules/utils/widgets/scaffold_with_padding.dart';
import 'package:flutter/material.dart';

class ListProductsPage extends StatefulWidget {
  final ShopRepository shopRepository;

  const ListProductsPage({
    super.key,
    required this.shopRepository,
  });

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  ShopRepository get _shopRepository => widget.shopRepository;
  List<Product> _products = [];
  String? _errorMessage;
  String? _loadingMessage;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithPadding(
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      body: Builder(
        builder: (context) {
          if (_loadingMessage != null) {
            return Center(
              child: Text(_loadingMessage!),
            );
          }

          if (_errorMessage != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_errorMessage!),
                  ElevatedButton(
                    onPressed: getProducts,
                    child: const Text("Tentar novamente"),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: _products.length,
            itemBuilder: (context, index) {
              return ProductWidget(product: _products[index]);
            },
          );
        },
      ),
    );
  }

  Future<void> getProducts() async {
    try {
      setState(() {
        _loadingMessage = "Obtendo dados...";
      });

      List<Product> products = await _shopRepository.getProducts();

      setState(() {
        _loadingMessage = null;
        _errorMessage = null;
        _products = products;
      });
    } catch (e) {
      setState(() {
        _loadingMessage = null;
        _errorMessage = e.toString();
      });
    }
  }
}
