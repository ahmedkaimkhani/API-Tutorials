import 'dart:convert';

import 'package:api_tutorials_flutter/Models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('API Course'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ReUseAbleRow(
                                    title: 'Name',
                                    value:
                                        snapshot.data![index].name.toString()),
                                ReUseAbleRow(
                                    title: 'Username',
                                    value: snapshot.data![index].username
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Email',
                                    value:
                                        snapshot.data![index].email.toString()),
                                ReUseAbleRow(
                                    title: 'Address',
                                    value: snapshot
                                        .data![index].address!.geo!.lat
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Phone',
                                    value:
                                        snapshot.data![index].phone.toString()),
                                ReUseAbleRow(
                                    title: 'Company',
                                    value: snapshot.data![index].company!.name
                                        .toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReUseAbleRow extends StatelessWidget {
  String title, value;
  ReUseAbleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
