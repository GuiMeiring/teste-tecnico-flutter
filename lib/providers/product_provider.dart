import 'package:flutter/material.dart';
import 'package:teste_tecnico/model/produto.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [
    Product(
        id: 123,
        nome: "Camisa Algodão 100% Cinza",
        preco: 123,
        material: "Algodão",
        url:
            "https://malwee.vtexassets.com/arquivos/ids/642858-1200-auto?v=638234727268470000&width=1200&height=auto&aspect=true")
  ];

  void createProduct(Product product) {
    products.add(product);
  }

  void deleteProduct(Product product) {
    products.remove(product);
    cart.remove(product);
  }

  void updateProduct(Product editProduct) {
    products[editProduct.id] = editProduct;
  }

  Product produtoById(int id) {
    return products[id];
  }

  List<Product> getAllProducts() {
    return products;
  }

  Product fromMap(
      int? id, String name, double preco, String material, String url) {
    if (id != null) {
      return Product(
        id: id, // Use o ID fornecido se não for nulo
        nome: name,
        preco: preco,
        material: material,
        url: url,
      );
    }
    return Product(
      id: products.length + 1, // Use um novo ID se o ID for nulo
      nome: name,
      preco: preco,
      material: material,
      url: url,
    );
  }

  List<Product> cart = [];

  double get cartTotalPrice {
    var preco = 0.0;
    for (int i = 0; i < cart.length; i++) {
      preco = cart[i].preco + preco;
    }
    return preco;
  }

  void addCart(Product product) {
    cart.add(product);
  }

  void deleteProductCart(Product product) {
    cart.remove(product);
  }

  void deleteAllCart() {
    cart = [];
  }
}
