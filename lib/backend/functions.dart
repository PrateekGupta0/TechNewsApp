import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:technews_app/utils/key.dart';
import 'package:technews_app/utils/search_bar.dart';


Future<List> FetchNews() async{
  http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=3b9303bf47774d80b57302ca427581b4&q='+SearchBar.searchController.text
  ));
  Map result = jsonDecode(response.body);
  return (result['articles']);
}