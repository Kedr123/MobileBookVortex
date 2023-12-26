

class Book {
  late final int id;
  final String name;
  final String author;
  final String bookmark;
  final String file_link;
  final String img_link;
  final int is_star;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.bookmark,
    required this.file_link,
    required this.img_link,
    required this.is_star,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'author':author,
      'bookmark':bookmark,
      'file_link':file_link,
      'img_link':img_link,
      'is_star':is_star,
    };
  }

  Map<String, dynamic> toMapNewId(newId) {
    return {
      'id':newId,
      'name':name,
      'author':author,
      'bookmark':bookmark,
      'file_link':file_link,
      'img_link':img_link,
      'is_star':is_star
    };
  }

  @override
  String toString() {
    return 'Book{id: $id, name: $name, author: $author, bookmark: $bookmark, file_link: $file_link, img_link: $img_link, is_star: $is_star}';
  }
}
