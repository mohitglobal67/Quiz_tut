import 'package:flutter/material.dart';



class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score, required this.lengthq});

  final int score;
  final int lengthq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000),
          const Text(
            'Your Score: ',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / lengthq,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / lengthq * 100).round()}%',
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
