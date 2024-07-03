import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/album.dart';

class AlbumService {
  static Future<List<Album>> genareRandAlbums() async {
    final String response = await rootBundle.loadString('data/albums.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Album.fromJson(json)).toList();
  }
}
