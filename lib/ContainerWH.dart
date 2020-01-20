import 'package:flutter/material.dart';

//Ini Custom Widget untuk membuat halaman menjadi selebar dan setinggi device

class ContainerWH extends StatelessWidget {
  ContainerWH(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: child,
    );
  }
}