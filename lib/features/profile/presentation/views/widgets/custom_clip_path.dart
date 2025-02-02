import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - (size.height * 0.19));
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - (size.height * 0.19));
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
