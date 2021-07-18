class Category {
  String name;
  Category({required this.name});
}

class NewsCategies {
  final List<Category> categories = <Category>[
    Category(name: 'new'),
    Category(name: 'past'),
    Category(name: 'comments'),
    Category(name: 'ask'),
    Category(name: 'show'),
    Category(name: 'jobs'),
    Category(name: 'submit'),
  ];
}
