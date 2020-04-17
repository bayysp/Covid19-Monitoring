import 'package:covid19monitoring/data/model/global_model.dart';
import 'package:covid19monitoring/data/service/api_services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class GlobalProvider with ChangeNotifier {
  var api = ApiServices();
  GlobalModel globalModel;
  Map<String, double> dataMap;

  Future<GlobalModel> getGlobalProvider() async {
    final response = await api.client.get("${api.baseUrl}/api");
    if (response.statusCode == 200) {
      var result = globalModelFromJson(response.body);
      
      dataMap = Map();

      dataMap.putIfAbsent("Confirmed", () => result.confirmed.value.toDouble());
      dataMap.putIfAbsent("Recovered", () => result.recovered.value.toDouble());
      dataMap.putIfAbsent("Deaths", () => result.deaths.value.toDouble());
      
      globalModel = result;
      notifyListeners();
      return result;
    }else{
      return null;
    }
  }
  
  
}
