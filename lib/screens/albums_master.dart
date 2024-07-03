import 'package:flutter/material.dart';
import '../services/album_service.dart';
import '../models/album.dart';
import '../widgets/album_preview.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les albums de tintin'),
      ),
      body: FutureBuilder<List<Album>>(
        future: AlbumService.genareRandAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No albums found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return AlbumPreview(album: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
2