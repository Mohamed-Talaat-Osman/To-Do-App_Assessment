import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, 0, h * 0.76, 0, h * 0.76);
    path.cubicTo(0, h * 0.76, 0, h * 0.76, 0, h * 0.76);
    path.cubicTo(0, h * 0.84, w * 0.07, h * 0.9, w * 0.15, h * 0.9);
    path.cubicTo(w * 0.15, h * 0.9, w * 0.85, h * 0.9, w * 0.85, h * 0.9);
    path.cubicTo(w * 0.91, h * 0.9, w * 0.97, h * 0.94, w, h);
    path.cubicTo(w, h, w, h, w, h);
    path.cubicTo(w, h, w, h * 0.45, w, h * 0.45);
    path.cubicTo(w, h * 0.36, w * 0.93, h * 0.29, w * 0.85, h * 0.29);
    path.cubicTo(w * 0.85, h * 0.29, w * 0.79, h * 0.29, w * 0.79, h * 0.29);
    path.cubicTo(w * 0.74, h * 0.29, w * 0.69, h / 4, w * 0.69, h * 0.19);
    path.cubicTo(w * 0.69, h * 0.19, w * 0.69, h * 0.19, w * 0.69, h * 0.19);
    path.cubicTo(w * 0.69, h * 0.09, w * 0.61, 0, w / 2, 0);
    path.cubicTo(w / 2, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, 0, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}