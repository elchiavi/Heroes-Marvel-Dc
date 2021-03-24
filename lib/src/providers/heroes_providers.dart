import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:marvel/src/model/heroe_model.dart';


class HeroesProviders {

  final String _url = 'https://marvel-fb91e-default-rtdb.firebaseio.com';


  Future<List<HeroeModel>> getHeroesMarvel() async {

    final url = '$_url/heroes.json';
    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<HeroeModel> heroes = [];
    if (decodedData == null) return [];

    decodedData.forEach((id, heroe) { 

        final heroeTemp = HeroeModel.fromJson(heroe);
        heroeTemp.id = id;
        heroes.add(heroeTemp);  
    });

    return heroes;

  }

  Future<List<HeroeModel>> getHeroesDc() async {

    final url = '$_url/heroesDc.json';
    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<HeroeModel> heroes = [];
    if (decodedData == null) return [];

    decodedData.forEach((id, heroe) { 

        final heroeTemp = HeroeModel.fromJson(heroe);
        heroeTemp.id = id;
        heroes.add(heroeTemp);  
    });

    return heroes;

  }


}