import 'dart:convert';

class Consultant {
  String? id;
  String? name;
  String? surName;
  String? email;
  String? photoUrl;
  String? about;
  String? location;
  int? experience;
  String? title;
  double? rating;
  int? serviceCount;

  Consultant({
    this.id,
    this.name,
    this.surName,
    this.email,
    this.photoUrl,
    this.about,
    this.location,
    this.experience,
    this.title,
    this.rating,
    this.serviceCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surName': surName,
      'email': email,
      'photoUrl': photoUrl,
      'about': about,
      'location': location,
      'experience': experience,
      'title': title,
      'rating': rating,
      'serviceCount': serviceCount,
    };
  }

  factory Consultant.fromMap(Map<String, dynamic> map) {
    return Consultant(
      id: map['id'],
      name: map['name'],
      surName: map['surName'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      about: map['about'],
      location: map['location'],
      experience: map['experience']?.toInt(),
      title: map['title'],
      rating: map['rating']?.toDouble(),
      serviceCount: map['serviceCount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Consultant.fromJson(String source) =>
      Consultant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Consultant(name: $name, surName: $surName, email: $email, photoUrl: $photoUrl, about: $about, location: $location, experience: $experience, title: $title, rating: $rating, serviceCount: $serviceCount)';
  }
}
