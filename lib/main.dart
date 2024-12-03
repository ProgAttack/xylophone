import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int numberSound) async {
    final player = AudioPlayer();
    await player.setSourceAsset('note$numberSound.wav');
    player.resume();
  }

  Widget buildKey(Color color, int numberSound) {
    return TextButton(
      onPressed: () {
        playSound(numberSound);
      },
      style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero) // Cor para o botão
          ),
      child: const SizedBox(height: 100), // Espaço vazio para o botão
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1),
              buildKey(Colors.black, 2),
              buildKey(Colors.white, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.blue, 5),
              buildKey(Colors.purple, 6),
              buildKey(Colors.yellow,7),
              
            ],
          ),
        ),
      ),
    );
  }
}
