import 'package:flutter/material.dart';
// class LeafContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final Color color;

//   LeafContainer({required this.width, required this.height, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(width, height),
//       painter: LeafPainter(color),
//     );
//   }
// }

class LeafPainter extends CustomPainter {
  final Color color;

  LeafPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.6, size.width * 0.6, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.1, size.width * 0.3, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.1, size.height * 0.3, size.width * 0.4, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.6, size.width / 2, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}