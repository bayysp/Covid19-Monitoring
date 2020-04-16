import 'package:covid19monitoring/data/model/global_model.dart';
import 'package:covid19monitoring/data/service/api_services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class GlobalProvider with ChangeNotifier {
  var api = ApiServices();
  GlobalModel globalModel;



  Future<GlobalModel> getGlobalProvider() async {
    final response = await api.client.get("${api.baseUrl}/api");
    if (response.statusCode == 200) {
      notifyListeners();
      var result = globalModelFromJson(response.body);
      globalModel = result;
      notifyListeners();
      return result;
    }else{
      return null;
    }
  }
}
