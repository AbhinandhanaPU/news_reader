import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_api/model/mymodel.dart';
import 'package:http/http.dart' as http;

class MySearchController with ChangeNotifier {
  Map<String, dynamic> decodedSearchData = {};
  MyNewsApiModel? searchResModel;
  bool isLoading = false;

  Future fetchSearchData({required String searchItem}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchItem&from=2024-02-09&to=2024-02-09&sortBy=popularity&apiKey=78031ddda50f42efa8c72f7f64ea3f59");

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      decodedSearchData = jsonDecode(response.body);
      searchResModel = MyNewsApiModel.fromJson(decodedSearchData);
    } else {
      print("error");
    }

    isLoading = false;
    notifyListeners();
  }
}
