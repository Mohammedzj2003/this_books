class Story {
  final int storyId;
  final int price;
  final double rating;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  bool isList;
  final String decription;

  Story({required this.storyId,
    required this.price,
    required this.category,
    required this.plantName,
    required this.rating,
    required this.isList,
    required this.imageURL,
    required this.isFavorated,
    required this.decription,
  });

  //List of Plants data
  static List<Story> storyList = [
    Story(
      storyId: 0,
      price: 22,
      category: 'Romantec',
      plantName: 'jomanaa',
      rating: 4.5,
      isList: true,
      imageURL: 'images/storyOne.png',
      isFavorated: true,
      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 1,
      price: 11,
      category: 'Outdoor',
      plantName: 'Philodendron',
      rating: 4.8,
      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,
      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 2,
      price: 18,
      category: 'Indoor',
      plantName: 'Beach Daisy',
      rating: 4.7,
      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,
      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 3,
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      rating: 4.5,
      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,

      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 4,
      price: 24,
      category: 'Recommended',
      plantName: 'Big Bluestem',
      rating: 4.1,
      imageURL: 'images/storyOne.png',
      isFavorated: true,
      isList: true,

      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 5,
      price: 24,
      category: 'Outdoor',
      plantName: 'Meadow Sage',
      rating: 4.4,

      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,

      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 6,
      price: 19,
      category: 'Garden',
      plantName: 'Plumbago',
      rating: 4.2,

      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,

      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 7,
      price: 23,
      category: 'Garden',
      plantName: 'Tritonia',
      rating: 4.5,

      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,

      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
    Story(
      storyId: 8,
      price: 46,
      category: 'Recommended',
      plantName: 'Tritonia',
      rating: 4.7,
      imageURL: 'images/storyOne.png',
      isFavorated: false,
      isList: false,

      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
    ),
  ];

  //Get the favorated items
  static List<Story> getFavoritedPlants() {
    List<Story> travelList = Story.storyList;
    return travelList.where((element) => element.isFavorated == true).toList();
  }


//Get the favorated items
  static List<Story> getListPlants() {
    List<Story> travelList = Story.storyList;
    return travelList.where((element) => element.isList == true).toList();
  }
}

