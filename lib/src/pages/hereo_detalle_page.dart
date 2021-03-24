import 'package:flutter/material.dart';
import 'package:marvel/src/model/heroe_model.dart';

class HeroeDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final HeroeModel heroe = ModalRoute.of(context).settings.arguments; // argumentos enviados por el swiper
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget> [
            _crearAppBarr(heroe),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  _posterHeroe(heroe, context),
                  SizedBox(height: 20.0),
                  _barraStats(heroe, context),
                  _biografia(heroe, context)
                ]
              ),
            )
          ],
      ),
    );
  }

  Widget _biografia(HeroeModel heroe, BuildContext context) {

    return Container(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget> [
          Text('Biografía',style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize:  20.0 )),
          SizedBox(height: 10.0),
          Text(heroe.bio, style: Theme.of(context).textTheme.caption),
        ],),

    );

  }


  Widget _barraStats(HeroeModel heroe, BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          _iconoStats(heroe.durability, 'Resistencia', context, Icons.shield),
          _iconoStats(heroe.energy, 'Energía', context, Icons.battery_charging_full ),
          _iconoStats(heroe.fightingSkills, 'Hab. de Pelea', context, Icons.sports_kabaddi),
          _iconoStats(heroe.speed, 'Velocidad', context, Icons.bolt),
          _iconoStats(heroe.strength, 'Fuerza', context, Icons.fitness_center),
          _iconoStats(heroe.intelligence, 'Inteligencia', context, Icons.self_improvement),

        ],),

    );
  }

  Widget _iconoStats(int atributo, String texto, BuildContext context, IconData  icono) {
      final atrib = atributo.toString();
      return Column(
          children: <Widget> [
            Text(texto, style: Theme.of(context).textTheme.caption),
            SizedBox(height: 5.0),
            Icon( icono, size: 30.0, color: Colors.grey[700] ),
            SizedBox(height: 5.0),

            Text('$atrib/7', style: Theme.of(context).textTheme.caption)
          ],
        );
      
  }

  Widget _crearAppBarr(HeroeModel heroe) {

      return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.grey[400],
        expandedHeight: 200.0,
        floating: true,
        pinned: true , // visible al hacer scroll
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(heroe.superHero,
          style: TextStyle( color: Colors.white, fontSize:  16.0),
          ),
          background: FadeInImage(
            image: NetworkImage( heroe.publisher),
            placeholder: AssetImage('assets/loading.gif'), 
            fadeInDuration: Duration( milliseconds: 150),
            fit: BoxFit.cover,
          ), 

        ) , // 
      );

  }
  
  Widget _posterHeroe(HeroeModel heroe, BuildContext context) {

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: <Widget> [
          
          Hero(
            tag: heroe.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(heroe.imgUrl),
                height: 200.0,
                ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ordena
              children: [
                Text(heroe.alterEgo, style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize:  18.0 )),
                SizedBox(height: 5.0),
                Text('Primera aparición: ${heroe.firstAppearance}',style: TextStyle(fontSize:  14.0, fontWeight: FontWeight.bold )),
                SizedBox(height: 10.0),
                Text(heroe.heroeModelAbstract, style: Theme.of(context).textTheme.subtitle2),
                
                
              ],) ,)
          ],
        ),
      );
      
    }

  
}