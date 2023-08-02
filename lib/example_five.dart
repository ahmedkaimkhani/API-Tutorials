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
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}