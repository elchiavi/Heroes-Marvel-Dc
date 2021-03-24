import 'package:flutter/material.dart';

class HeaderWavesGradient extends StatelessWidget {

  final String texto;

  const HeaderWavesGradient({
    @required this.texto,
  });

  @override
  Widget build(BuildContext context) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderWavesGradientPainter(),
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

class _HeaderWavesGradientPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      colors: <Color> [
        Colors.grey[300],
        Colors.grey[400],
        Colors.grey,
        Colors.grey[700]
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
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25); // las ultimas dos es el lugar final donde termina la linea
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

      return true;
  }

}