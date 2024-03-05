import 'package:desafio_magazord/modules/http/http_mock.dart';
import 'package:desafio_magazord/modules/notifiers/theme_notifier.dart';
import 'package:desafio_magazord/modules/shop/pages/list_products_page.dart';
import 'package:desafio_magazord/modules/shop/repositories/shop_repository.dart';
import 'package:desafio_magazord/modules/utils/widgets/expanded_buttons.dart';
import 'package:desafio_magazord/modules/utils/widgets/scaffold_with_padding.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeNotifier _themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithPadding(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpandedElevatedButton(
              onPressed: pushShopPage,
              child: const Text("Shop"),
            ),
            ExpandedElevatedButton(
              onPressed: () => _changeTheme(Colors.blue),
              child: const Text("Alterar tema para AZUL"),
            ),
            ExpandedElevatedButton(
              onPressed: () => _changeTheme(Colors.red),
              child: const Text("Alterar tema para VERMELHO"),
            ),
            ExpandedElevatedButton(
              onPressed: () => _changeTheme(Colors.yellow),
              child: const Text("Alterar tema para AMARELO"),
            ),
          ],
        ),
      ),
    );
  }

  void pushShopPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListProductsPage(
          shopRepository: ShopRepository(
            http: HTTPMock(),
          ),
        ),
      ),
    );
  }

  void _changeTheme(Color color) {
    _themeNotifier.color = color;
  }
}
