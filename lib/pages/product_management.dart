import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico/pages/product_form.dart';
import 'package:teste_tecnico/pages/product_update.dart';
import 'package:teste_tecnico/providers/product_provider.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Produtos", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductForm())),
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: provider.products.isEmpty
          ? const Center(
              child: Text("Nenhum produto adicionado."),
            )
          : ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    title:
                        Text("${index + 1} - ${provider.products[index].nome}"),
                    trailing: SizedBox(
                      width: 96,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  provider.deleteProduct(
                                      provider.produtoById(index));
                                });
                              },
                              icon: const Icon(Icons.delete_rounded)),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ProductUpdate(id: index)));
                              },
                              icon: const Icon(Icons.edit_rounded)),
                        ],
                      ),
                    ),
                  )),
            ),
    );
  }
}
