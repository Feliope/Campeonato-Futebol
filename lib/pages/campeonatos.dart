import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../controller/listcampeonatos.dart';

class CampeonatosScreen extends StatefulWidget {
  const CampeonatosScreen({super.key});

  @override
  State<CampeonatosScreen> createState() => _CampeonatosScreenState();
}

class _CampeonatosScreenState extends State<CampeonatosScreen> {

  late Future<List<listCampeonatos>> campeonatos;

  @override

  void initState(){
    super.initState();
    campeonatos = pegarCampeonato();
  }

  Future <List<listCampeonatos>> pegarCampeonato() async {

    var url = Uri.parse("https://api.api-futebol.com.br/v1/campeonatos");
    const apiKey = "test_dca4fd95cdf1e539302bb79d87fd20";
    var response = await http.get(url, headers: {"Authorization": "Bearer $apiKey"});

    if (response.statusCode == 200){
      List listaCampeonatos = json.decode(response.body);
      return listaCampeonatos.map((json) => listCampeonatos.fromJson(json)).toList();
    } else{
      throw Exception("Erro ao carregar os campeonatos");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Campeonatos",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.indigo[700],
        shadowColor: Colors.black87,
      ),

      body: Center(
        child: FutureBuilder(
          future: campeonatos,
          builder: (context, snapshot) {
            
            if (snapshot.hasData){
              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  listCampeonatos campeonato = snapshot.data![index];
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: Row(
                        children:[
                          Image.network(
                            campeonato.logo!,
                            width: 100,
                            height: 100,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              campeonato.nome!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]
                              ),
                            ),
                          )
                        ]
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/infoCampeonatos', arguments: campeonato);
                    },
                  );
                })
              );
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}