import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico/providers/product_provider.dart';

class ProductForm extends StatelessWidget {
  ProductForm({super.key});
  final TextEditingController _name = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _material = TextEditingController();
  final TextEditingController _url = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text("Criar produto",
              style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      provider.createProduct(provider.fromMap(
                          null,
                          _name.text,
                          double.parse(_preco.text),
                          _material.text,
                          _url.text));

                     Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                    controller: _name,
                    decoration:
                        const InputDecoration(labelText: 'Nome do produto'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o nome do produto.';
                      }
                      return null;
                    }),
                TextFormField(
                    controller: _preco,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Preço do produto'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o preço do produto.';
                      }
                      return null;
                    }),
                TextFormField(
                    controller: _material,
                    decoration:
                        const InputDecoration(labelText: 'Material do produto'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o material do produto.';
                      }
                      return null;
                    }),
                TextFormField(
                    controller: _url,
                    decoration:
                        const InputDecoration(labelText: 'Image do produto'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a url da imagem.';
                      }
                      return null;
                    }),
              ],
            ),
          ),
        ));
  }
}
