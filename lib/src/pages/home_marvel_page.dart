import 'package:flutter/material.dart';
import 'package:marvel/src/model/heroe_model.dart';
import 'package:marvel/src/providers/heroes_providers.dart';
import 'package:marvel/src/widgets/card_swiper_widget.dart';
import 'package:marvel/src/widgets/header_widget.dart';

class HomePageMarvel extends StatelessWidget {

  final heroesProviders = new HeroesProviders();

  @override
  Widget build(BuildContext context) {

    final titulo = 'Marvel Comics';

    return Stack(
          children: <Widget> [
            HeaderWavesGradient(texto: titulo),
            Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  SizedBox(height: 25.0),
                  _crearSwiper(),
                  SizedBox(height: 10.0)
                ],),
            ),
          ),
          ]
    );
  }

  Widget _crearSwiper() {

    return Container(
      padding: EdgeInsets.only(top: 190.0, left: 10.0 ),
      child: FutureBuilder(
        future: heroesProviders.getHeroesMarvel(),
        builder: (BuildContext context, AsyncSnapshot<List<HeroeModel>> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(heroes: snapshot.data);
          } else {
              return Container(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }        
        },
      ),
    );

  }
}