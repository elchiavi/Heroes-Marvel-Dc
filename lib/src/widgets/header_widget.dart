import 'package:flutter/material.dart';

class HeaderGradient extends StatelessWidget {

  final String texto;
  final Color colorUno;
  final Color colorDos;
  final Color colorTres;
  final Color colorCuatro;

  const HeaderGradient({
    @required this.texto, 
    @required this.colorUno, 
    @required this.colorDos, 
    @required this.colorTres, 
    @required this.colorCuatro,
  });

  @override
  Widget build(BuildContext context) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderGradientPainter(colorUno, colorDos,colorTres, colorCuatro),
          child: _titulos(this.texto)
        ),
      );
    }
  }

Widget _titulos(String titulo) {

      return SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                     Text(titulo, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
                  ],
                ),
                
                
              ],
            )
            ),
      );
  }

class _HeaderGradientPainter extends CustomPainter{

  final Color colorUno;
  final Color colorDos;
  final Color colorTres;
  final Color colorCuatro;

  _HeaderGradientPainter(
    
    this.colorUno, 
    this.colorDos, 
    this.colorTres, 
    this.colorCuatro);

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      colors: <Color> [
        this.colorUno,
        this.colorDos,
        this.colorTres,
        this.colorCuatro
      ]
    );

    final Rect rect = new Rect.fromCircle(
      center: Offset(165.0, 65.0),
      radius: 180
    );

    final pencil = new Paint()..shader = gradient.createShader(rect);

    // Props
    pencil.color = Colors.red;
    pencil.style = PaintingStyle.fill; 
    pencil.strokeWidth = 5.0;

    final path = new Path(); // por defecho en (0,0)

    // dibujar
    path.moveTo(0, size.height * 0.25); // mueve
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0); // dibuja
    path.lineTo(0, 0);

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.90);
    path.lineTo(size.width, size.height * 0.85);
    path.lineTo(size.width,  size.height); 
    path.lineTo(0, size.height);

    canvas.drawPath(path, pencil);       
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

      return true;
  }

}