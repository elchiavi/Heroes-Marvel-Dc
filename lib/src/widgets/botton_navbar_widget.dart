import 'package:flutter/material.dart';
import 'package:marvel/src/providers/ui_providers.dart';
import 'package:provider/provider.dart';

class BottonNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;


      return Theme(
          data: Theme.of(context).copyWith(
            // color del boton navigationbar
            canvasColor: Colors.grey[200],
            // color del icono selecionado
            primaryColor: Colors.black,
            // cambio el color de los iconos
            textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.white60 ))

          ),
          child: BottomNavigationBar(
            onTap: ( int i) => uiProvider.selectedMenuOpt = i, // seteo quien se presionó
            currentIndex: currentIndex, // quien está seleccionado
            items:  [
              BottomNavigationBarItem(

                icon: Icon(Icons.calendar_today, size: 0.0),
                label: 'Marvel Comics'
              ),
              
              BottomNavigationBarItem(
                icon: Icon(Icons.bubble_chart, size: 0.0),
                label: 'DC Comics'
        
              ),
            ],
            )
         ,
      );
  }
}