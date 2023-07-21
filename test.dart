import 'package:http/http.dart' as http;

void main(){
  fetch();
}

Future fetch() async {
  String url = "https://api.api-futebol.com.br/v1/campeonatos";
  String apiKey = "live_f57834a09e177596e3fb6364854b0b";
  print("Get: $url");
  http.Response response;
  response = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer $apiKey"});
  print(response.statusCode.toString());
  print(response.body);
}