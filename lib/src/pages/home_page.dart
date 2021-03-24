import 'package:flutter/material.dart';
import 'package:marvel/src/pages/home_dc_page.dart';
import 'package:marvel/src/pages/home_marvel_page.dart';
import 'package:marvel/src/providers/ui_providers.dart';
import 'package:marvel/src/widgets/botton_navbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _HomeBodyPage(),
        bottomNavigationBar :BottonNavBar()
        );
        
  }

}

class _HomeBodyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex) {

      case 0:
        return HomePageMarvel();

      case 1:
        return HomePageDC();

      default:
        return HomePageMarvel();
    }
  }
}



