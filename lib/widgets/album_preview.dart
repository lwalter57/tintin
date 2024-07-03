import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';
import '../screens/album_details.dart';
import '../providers/reading_list_provider.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  const AlbumPreview({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final readingListProvider = Provider.of<ReadingListProvider>(context);
    final isInReadingList = readingListProvider.isInReadingList(album);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(album.title),
          leading: album.image.isNotEmpty
              ? Image.asset(album.image, width: 100, height: 100)
              : const Icon(Icons.album),
          trailing: IconButton(
            icon: Icon(
              isInReadingList ? Icons.check_box : Icons.check_box_outline_blank,
              color: isInReadingList ? Colors.green : null,
            ),
            onPressed: () {
              if (isInReadingList) {
                readingListProvider.removeAlbum(album);
              } else {
                readingListProvider.addAlbum(album);
              }
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumDetails(album: album),
              ),
            );
          },
        ),
      ),
    );
  }
}
