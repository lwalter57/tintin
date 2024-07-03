import 'package:flutter/material.dart';
import '../models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  const AlbumDetails({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Column(
        children: [
          Text('Album numéro : ${album.numero}'),
          Text('Résumé : ${album.resume}'),
          Text('Année : ${album.year}'),
          if (album.yearInColor != null)
            Text('Année en couleur : ${album.yearInColor}'),
          album.image.isNotEmpty
              ? Image.asset(
                  album.image,
                  width: 250,
                  height: 250,
                )
              : const Icon(Icons.album, size: 100),
        ],
      ),
    );
  }
}
