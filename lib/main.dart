import 'package:campeonato_futebol/pages/infoCampeonatos.dart';
import 'package:campeonato_futebol/pages/times.dart';
import 'package:flutter/material.dart';
import 'package:campeonato_futebol/pages/campeonatos.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => CampeonatosScreen(),
      InfoCampeonatosScreen.routeName:(context) => InfoCampeonatosScreen(),
      TimesScreen.routeName:(context) => TimesScreen()
    },
  ));
}
