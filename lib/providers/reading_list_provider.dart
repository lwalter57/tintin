import 'package:flutter/material.dart';
import '../models/album.dart';

class ReadingListProvider with ChangeNotifier {
  final List<Album> _readingList = [];

  List<Album> get albums => _readingList;

  void addAlbum(Album album) {
    _readingList.add(album);
    notifyListeners();
  }

  void removeAlbum(Album album) {
    _readingList.remove(album);
    notifyListeners();
  }

  bool isInReadingList(Album album) {
    return _readingList.contains(album);
  }

  Album? getAlbumByNumero(int numero) {
    return _readingList.firstWhere((album) => album.numero == numero);
  }
}
