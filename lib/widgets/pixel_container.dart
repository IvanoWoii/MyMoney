import 'package:flutter/material.dart';

class PixelCornersClipper extends CustomClipper<Path> {
  final double pixelSize;
  PixelCornersClipper({this.pixelSize = 4.0});

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final p = pixelSize;
    
    return Path()
      ..moveTo(0, p)
      ..lineTo(p, p)
      ..lineTo(p, 0)
      ..lineTo(w - p, 0)
      ..lineTo(w - p, p)
      ..lineTo(w, p)
      ..lineTo(w, h - p)
      ..lineTo(w - p, h - p)
      ..lineTo(w - p, h)
      ..lineTo(p, h)
      ..lineTo(p, h - p)
      ..lineTo(0, h - p)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class PixelContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double pixelSize;
  final List<BoxShadow>? boxShadow;
  final DecorationImage? image;
  final double? width;
  final double? height;
  
  const PixelContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.border,
    this.padding,
    this.margin,
    this.pixelSize = 4.0,
    this.boxShadow,
    this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
      child: ClipPath(
        clipper: PixelCornersClipper(pixelSize: pixelSize),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            image: image,
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
