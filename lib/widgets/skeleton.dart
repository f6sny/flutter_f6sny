import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
