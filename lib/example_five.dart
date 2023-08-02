import 'dart:convert';

import 'package:api_tutorials_flutter/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {

  Future<ProductModel> getProductsApi () async {
    final response = await http.get(Uri.parse('https://webhook.site/b47feb57-0928-4ec5-8caa-87290596886c'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
         Expanded(
          child: FutureBuilder<ProductModel>(
            builder: (context, snapshot) {
              if (snapshot.hasData){
                return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(index.toString())
                    ],
                  );
                },
                );
              } else {
                return Text('Loading...');
              }
            },
            ),
          )
        ],
      ),
    );
  }
}