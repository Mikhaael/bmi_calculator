import 'package:flutter/material.dart';

class ReusuableContainer extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  
  const ReusuableContainer(
      {Key? key, required this.color, required this.cardChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
