import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
  home: MusicPlayer(),
  debugShowCheckedModeBanner: false,
  
  ));

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final audioName = 'audio.mp3';
  final musicName = 'club-hyper-techno-2';
  final imageURL =
      'https://cdn.pixabay.com/audio/2025/03/28/03-12-54-148_200x200.jpg';

  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
  }

  Future<void> reproducir() async {
    await audioPlayer.play(AssetSource(audioName));
  }

  Future<void> pausar() async {
    await audioPlayer.pause();
  }

  Future<void> continuar() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reproductor MP3'),
      centerTitle: true,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageURL),
            Text(musicName),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Colors.green,
                  iconSize: 40,
                  onPressed: reproducir
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  color: Colors.yellow,
                  iconSize: 40,
                  onPressed: pausar
                  
                ),
                IconButton(
                  icon: Icon(Icons.pause_circle_filled),
                  color: Colors.blue,
                  iconSize: 40,
                  onPressed: continuar
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
