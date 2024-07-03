import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';
import '../providers/reading_list_provider.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  const AlbumDetails({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final readingListProvider = Provider.of<ReadingListProvider>(context);
    final isInReadingList = readingListProvider.isInReadingList(album);

    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Center(
        child: Column(
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isInReadingList) {
                  readingListProvider.removeAlbum(album);
                } else {
                  readingListProvider.addAlbum(album);
                }
              },
              child: Text(
                isInReadingList
                    ? 'Retirer de la liste de lecture'
                    : 'Ajouter à la liste de lecture',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
