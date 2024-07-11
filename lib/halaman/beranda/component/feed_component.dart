class Feed {
  final String title;
  final String organization_name;
  final String image;
  final String link;
  // Tambahkan properti lainnya sesuai dengan respons API Anda

  Feed(
      {required this.title,
      required this.organization_name,
      required this.image,
      required this.link});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      title: json['title'],
      organization_name: json['organization_name'],
      image: json['image'],
      link: json['link'],
    );
  }
}
