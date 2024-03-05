import 'dart:convert';

import 'package:desafio_magazord/modules/http/http_interface.dart';
import 'package:desafio_magazord/modules/http/response_http.dart';
import 'package:desafio_magazord/modules/shop/models/product.dart';

class ShopRepository {
  final IHTTP http;

  ShopRepository({required this.http});

  Future<List<Product>> getProducts() async {
    http.injectTest(
      ResponseHTTP(
        statusCode: 200,
        body: jsonEncode(
          [
            {
              "title": "Produto 1",
              "description": "Descrição do produto 1",
              "price": 34.50,
              "image":
                  "https://http2.mlstatic.com/D_NQ_NP_648694-MLB70062055225_062023-O.webp",
            },
            {
              "title": "Produto 2",
              "description": "Descrição do produto 2",
              "price": 100.01,
              "image":
                  "https://http2.mlstatic.com/D_NQ_NP_783622-MLB71029548557_082023-O.webp",
            },
            {
              "title": "Produto 3",
              "description": "Descrição do produto 3",
              "price": 20.00,
              "image":
                  "https://http2.mlstatic.com/D_NQ_NP_999092-MLB71029599011_082023-O.webp",
            },
            {
              "title": "Produto 4",
              "description": "Descrição do produto 4",
              "price": 40.50,
              "image":
                  "https://http2.mlstatic.com/D_NQ_NP_734668-MLB40760147416_022020-O.webp",
            },
            {
              "title": "Produto 5",
              "description": "Descrição do produto 5",
              "price": 12.38,
              "image":
                  "https://http2.mlstatic.com/D_NQ_NP_957230-MLB70062055227_062023-O.webp",
            },
          ],
        ),
      ),
    );

    final ResponseHTTP response = await http.get("https://google.com");

    if (response.statusCode != 200) {
      throw Exception("Não foi possível obter uma resposta valida");
    }

    List<dynamic> products = jsonDecode(response.body);

    return products.map((e) => Product.fromJson(e)).toList();
  }
}
