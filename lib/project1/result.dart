import 'package:flutter/material.dart';

class Resultscreen extends StatelessWidget {
  final double height;
  final double weight;

  const Resultscreen({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('결과'),
        ),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "정상",
              style: TextStyle(fontSize: 36),
            ),
            Icon(Icons.sentiment_satisfied, color: Colors.green, size: 100),
          ],
        )));
  }
}
