class User {
  String name;
  String phoneNumber;
  String neighborhood;
  String city;
  String bio;

  User({
    required this.name,
    required this.phoneNumber,
    required this.neighborhood,
    required this.city,
    required this.bio,
  });

  User.defaultConstructor()
      : name = '',
        phoneNumber = '',
        neighborhood = '',
        city = '',
        bio = '';
}

class RegularUser extends User {
  int? age;
  String? gender;
  List<User> friends = [];

  RegularUser({
    this.age,
    this.gender,
    required List<User> friends,
    required String name,
    required String phoneNumber,
    required String neighborhood,
    required String city,
    required String bio,
  }) : super(
    name: name,
    phoneNumber: phoneNumber,
    neighborhood: neighborhood,
    city: city,
    bio: bio,
  );
}

class Veterinarian extends User {
  String? speciality;
  List<String> appointments = [];

  Veterinarian({
    this.speciality,
    List<String> appointments = const [],
    required String name,
    required String phoneNumber,
    required String neighborhood,
    required String city,
    required String bio,
  }) : super(
    name: name,
    phoneNumber: phoneNumber,
    neighborhood: neighborhood,
    city: city,
    bio: bio,
  ) {
    this.appointments = appointments;
  }
}

class CorporateUser extends User {
  int? rating;
  String? mapLink;
  String? websiteLink;

  CorporateUser({
    this.rating,
    this.mapLink,
    this.websiteLink,
    required String name,
    required String phoneNumber,
    required String neighborhood,
    required String city,
    required String bio,
  }) : super(
    name: name,
    phoneNumber: phoneNumber,
    neighborhood: neighborhood,
    city: city,
    bio: bio,
  );
}

class PetShop extends CorporateUser {
  List<String> items = [];

  PetShop({
    List<String> items = const [],
    int? rating,
    String? mapLink,
    String? websiteLink,
    required String name,
    required String phoneNumber,
    required String neighborhood,
    required String city,
    required String bio,
  }) : super(
    rating: rating,
    mapLink: mapLink,
    websiteLink: websiteLink,
    name: name,
    phoneNumber: phoneNumber,
    neighborhood: neighborhood,
    city: city,
    bio: bio,
  ) {
    this.items = items;
  }
}

class VetShop extends CorporateUser {
  List<Veterinarian> veterinarians = [];

  VetShop({
    List<Veterinarian> veterinarians = const [],
    int? rating,
    String? mapLink,
    String? websiteLink,
    required String name,
    required String phoneNumber,
    required String neighborhood,
    required String city,
    required String bio,
  }) : super(
    rating: rating,
    mapLink: mapLink,
    websiteLink: websiteLink,
    name: name,
    phoneNumber: phoneNumber,
    neighborhood: neighborhood,
    city: city,
    bio: bio,
  ) {
    this.veterinarians = veterinarians;
  }
}
