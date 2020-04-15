import 'package:http/http.dart';
class ApiServices {
  static final String urlIndonesia = "https://covid19.mathdro.id/api/countries/indonesia";
  static final String urlWorld = "https://covid19.mathdro.id/api";

  //put the country name after the last slice
  static final String baseUrlCountry = "https://covid19.mathdro.id/api/countries/";

  final String baseUrl = "https://covid19.mathdro.id";
  Client client = Client();
}