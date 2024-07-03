class Album {
  final String title;
  final int numero;
  final int year;
  final int? yearInColor;
  final String image;
  final String resume;

  Album({
    required this.title,
    required this.numero,
    required this.year,
    this.yearInColor,
    required this.image,
    required this.resume,
  });

  @override
  String toString() {
    return 'Album{title: $title, numero: $numero, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume}';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'numero': numero,
      'year': year,
      'yearInColor': yearInColor,
      'image': image,
      'resume': resume,
    };
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      numero: json['numero'],
      year: json['year'],
      yearInColor: json['yearInColor'],
      image: json['image'],
      resume: json['resume'],
    );
  }
}
