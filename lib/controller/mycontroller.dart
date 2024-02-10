import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_api/model/mymodel.dart';
import 'package:http/http.dart' as http;

class MyController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  MyNewsApiModel? apiResModel;
  bool isLoading = false;
  Future fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-12-10&to=2023-12-10&sortBy=popularity&apiKey=78031ddda50f42efa8c72f7f64ea3f59");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      apiResModel = MyNewsApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }
}
