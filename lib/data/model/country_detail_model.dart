// To parse this JSON data, do
//
//     final countryDetailModel = countryDetailModelFromJson(jsonString);

import 'dart:convert';

CountryDetailModel countryDetailModelFromJson(String str) => CountryDetailModel.fromJson(json.decode(str));

String countryDetailModelToJson(CountryDetailModel data) => json.encode(data.toJson());

class CountryDetailModel {
  Confirmed confirmed;
  Confirmed recovered;
  Confirmed deaths;
  DateTime lastUpdate;

  CountryDetailModel({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  factory CountryDetailModel.fromJson(Map<String, dynamic> json) => CountryDetailModel(
    confirmed: Confirmed.fromJson(json["confirmed"]),
    recovered: Confirmed.fromJson(json["recovered"]),
    deaths: Confirmed.fromJson(json["deaths"]),
    lastUpdate: DateTime.parse(json["lastUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed.toJson(),
    "recovered": recovered.toJson(),
    "deaths": deaths.toJson(),
    "lastUpdate": lastUpdate.toIso8601String(),
  };
}

class Confirmed {
  int value;
  String detail;

  Confirmed({
    this.value,
    this.detail,
  });

  factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
    value: json["value"],
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "detail": detail,
  };
}
