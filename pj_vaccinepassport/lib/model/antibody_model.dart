class PopularMenuModel {
  String AB_name;
  bool isHB;

  // Create consturctor method
  PopularMenuModel(
      {required this.AB_name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.isFavorited});
  // YOUR CODE GOES HERE


  static List<PopularMenuModel> getPopularMenu() {
    List<PopularMenuModel> popularDiets = [];

    popularDiets.add(PopularMenuModel(
      name: 'Blueberry Pancake',
      iconPath: 'assets/icons/blueberry-pancake.svg',
      level: 'Medium',
      duration: '30mins',
      calorie: '230kCal',
      isFavorited: true,
    ));

    popularDiets.add(PopularMenuModel(
      name: 'Salmon Nigiri',
      iconPath: 'assets/icons/salmon-nigiri.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '120kCal',
      isFavorited: false,
    ));

    return popularDiets;
  }
  
  void toggleFavorite() {
    isFavorited = !isFavorited;
  }
}
