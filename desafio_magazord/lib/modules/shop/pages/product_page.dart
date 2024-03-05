import 'package:desafio_magazord/modules/shop/models/product.dart';
import 'package:desafio_magazord/modules/utils/widgets/scaffold_with_padding.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithPadding(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.image),
            Text(
              product.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "R\$ ${product.price}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Divider(),
            Text(
              product.description,
            ),
          ],
        ),
      ),
    );
  }
}
