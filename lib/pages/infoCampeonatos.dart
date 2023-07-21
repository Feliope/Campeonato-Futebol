import 'package:campeonato_futebol/controller/listcampeonatos.dart';
import 'package:flutter/material.dart';
import '../controller/infocampeonato.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InfoCampeonatosScreen extends StatefulWidget {
  static const routeName = '/infoCampeonatos';
  const InfoCampeonatosScreen({super.key});

  @override
  State<InfoCampeonatosScreen> createState() => _InfoCampeonatosScreenState();
}

class _InfoCampeonatosScreenState extends State<InfoCampeonatosScreen> {
  
  late Future<List<Campeonato>> infoCampeonato;

  @override
  void initState(){
    super.initState();
    infoCampeonato = pegarInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    infoCampeonato = pegarInfo();
  }

  Future <List<Campeonato>> pegarInfo() async{
    final listCampeonatos arguments = ModalRoute.of(context)?.settings.arguments as listCampeonatos;
    var url = Uri.parse("https://api.api-futebol.com.br/v1/campeonatos/${arguments.campeonatoId}");
    const apiKey = "test_dca4fd95cdf1e539302bb79d87fd20";
    var response = await http.get(url, headers: {"Authorization": "Bearer $apiKey"});

    if (response.statusCode == 200){
      var atualCampeonato = json.decode(response.body) as Map<String, dynamic>;
      return [Campeonato.fromJson(atualCampeonato)];
    }
    else{
      throw Exception("Erro ao carregar o campeonato");
    }
  }

  Widget build(BuildContext context) {
    final listCampeonatos arguments = ModalRoute.of(context)?.settings.arguments as listCampeonatos;
    final String nomeCampeonato = arguments.nome!;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          nomeCampeonato,
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
          future: infoCampeonato,
          builder: (context, snapshot){
            if (snapshot.hasData){
              Campeonato infoCampeonatoAtual = snapshot.data![0];
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            infoCampeonatoAtual.logo!,
                            width: 125,
                            height: 125,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              infoCampeonatoAtual.nome!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Nome Popular: "+ infoCampeonatoAtual.nomePopular!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child:Text(
                        "Temporada: "+ infoCampeonatoAtual.edicaoAtual!.temporada!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]
                        ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child:Text(
                        "Rodada Atual: "+ infoCampeonatoAtual.rodadaAtual!.nome!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]
                        ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child:Text(
                        "Status: "+ infoCampeonatoAtual.status!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]
                        ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child:Text(
                        "Região: "+ infoCampeonatoAtual.regiao!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]
                        ),
                      )
                    ),
                    Padding(padding: EdgeInsets.only(top: 100)),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[800],
                          side: BorderSide(color: Color.fromARGB(255, 99, 194, 104), width: 4.0),
                          minimumSize: Size(400, 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/times', arguments: infoCampeonatoAtual);
                        },
                        child: Text(
                          "Tabela de Times",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 99, 194, 104),
                            fontWeight: FontWeight.bold
                    
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        
        ),
      )
    );
  }
}