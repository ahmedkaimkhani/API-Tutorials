import 'dart:convert';

import 'package:api_tutorials_flutter/Models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {

  Future <ProductsModel> getProductsApi () async {
    final response = await http.get(Uri.parse('https://webhook.site/1bfec3f7-2c35-4eb3-badd-6006f4b2845f'));
    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200){
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsModel>(
              future: getProductsApi(),
              builder: (context, snapshot) {
                 if (snapshot.hasData){
                  return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                     return Column(
                      children: [
                        Text(index.toString()),
                      ],
                     );
                  },
                  );
                } else {
                  return const Text('Loading');
                }
              },
              ),
            ),
        ],
      ),
    );
  }
}