import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel/src/pages/home_marvel_page.dart';
import 'package:provider/provider.dart';

import 'package:marvel/src/pages/hereo_detalle_page.dart';
import 'package:marvel/src/pages/home_dc_page.dart';
import 'package:marvel/src/pages/home_page.dart';

import 'package:marvel/src/providers/ui_providers.dart'; 

void main() async {
  
    
  // para que bloquee la opcion horizontal (giro aut)
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      
       runApp(new MyApp());
    });

} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:( _ ) => new UiProvider()),
      ],
      child:MaterialApp(
        title: 'Marvel App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'homeMarvel': (BuildContext context) => HomePageMarvel(),
          'homeDc': (BuildContext context) => HomePageDC(),
          'detalle': (BuildContext context) => HeroeDetalle()
        } 
      ) 
    );
  }
}