import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:marvel/src/model/heroe_model.dart';


class CardSwiper extends StatelessWidget {

  final List<HeroeModel> heroes;

  CardSwiper({ @required this.heroes});

  @override
  Widget build(BuildContext context) {

    // configuración para distintos celulares
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index){

            heroes[index].uniqueId = '${heroes[index].id}-tarjeta';
            return Hero(
              tag: heroes[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detalle', arguments: heroes[index]),
                  child: FadeInImage(
                    image: NetworkImage(heroes[index].imgUrl),
                    placeholder: AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
        },
        itemCount: heroes.length,
        itemWidth: _screenSize.width * 0.65,
        itemHeight: _screenSize.height * 0.5,

      ),
    
    );
  }
}