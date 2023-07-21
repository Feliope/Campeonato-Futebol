import 'package:campeonato_futebol/controller/infocampeonato.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../controller/tabela.dart';

class TimesScreen extends StatefulWidget {
  static const routeName = '/times';
  const TimesScreen({super.key});

  @override
  State<TimesScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {

  late Future<List<Tabela>> tabela;

  @override
  void initState(){
    super.initState();
    tabela = pegarTabela();
  }

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabela = pegarTabela();
  }

  Color selectColor(String indice){
    if (indice == 'v'){
      return Colors.green;
    }
    else if(indice == 'd'){
      return Colors.red;
    }
    return Colors.grey;
  }

  Future <List<Tabela>> pegarTabela() async {
    final Campeonato arguments = ModalRoute.of(context)?.settings.arguments as Campeonato;
    var url = Uri.parse("https://api.api-futebol.com.br/v1/campeonatos/${arguments.campeonatoId}/tabela");
    const apiKey = "test_dca4fd95cdf1e539302bb79d87fd20";
    var response = await http.get(url, headers: {"Authorization": "Bearer $apiKey"});

    if (response.statusCode == 200){
      List atualTabela = json.decode(response.body);
      return atualTabela.map((json) => Tabela.fromJson(json)).toList();
    }
    else{
      throw Exception("Erro ao carregar a Tabela do Campeonato");
    }
  }

  Widget build(BuildContext context) {
    final Campeonato arguments = ModalRoute.of(context)?.settings.arguments as Campeonato;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tabela do "+arguments.nome!,
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
          future: tabela,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Tabela times = snapshot.data![index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              times.posicao!.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SvgPicture.network(times.time!.escudo!, width: 50, height: 50),
                            Text(
                              times.time!.nomePopular!.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Últimos 5 Jogos",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: selectColor(times.ultimosJogos![0]),
                                          border: Border.all(color: selectColor(times.ultimosJogos![0]), width: 3),
                                          borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Text(
                                          times.ultimosJogos![0].toUpperCase(), 
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: selectColor(times.ultimosJogos![1]),
                                          border: Border.all(color: selectColor(times.ultimosJogos![1]), width: 3),
                                          borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Text(
                                          times.ultimosJogos![1].toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: selectColor(times.ultimosJogos![2]),
                                          border: Border.all(color: selectColor(times.ultimosJogos![2]), width: 3),
                                          borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Text(
                                          times.ultimosJogos![2].toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: selectColor(times.ultimosJogos![3]),
                                          border: Border.all(color: selectColor(times.ultimosJogos![3]), width: 3),
                                          borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Text(
                                          times.ultimosJogos![3].toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: selectColor(times.ultimosJogos![4]),
                                          border: Border.all(color: selectColor(times.ultimosJogos![4]), width: 3),
                                          borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Text(
                                          times.ultimosJogos![4].toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pts: " + times.pontos!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                  Text(
                                    "PJ: " + times.jogos!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                  Text(
                                    "VIT: " + times.vitorias!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                  Text(
                                    "E: " + times.empates!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                  Text(
                                    "DER: " + times.derrotas!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "GM: " + times.golsPro!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                  Text(
                                    "GC: " + times.golsContra!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                  Text(
                                    "SG: " + times.saldoGols!.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
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