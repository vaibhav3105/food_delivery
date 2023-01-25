// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MealModel {
  final String category;
  final String id;
  final String name;
  final String description;
  final int time;
  int price;
  final int calories;
  final String imageUrl;
  bool isLiked;
  int rating;
  MealModel({
    required this.category,
    required this.id,
    required this.name,
    required this.description,
    required this.time,
    required this.price,
    required this.calories,
    required this.imageUrl,
    required this.isLiked,
    required this.rating,
  });

  MealModel copyWith({
    String? category,
    String? id,
    String? name,
    String? description,
    int? time,
    int? price,
    int? calories,
    String? imageUrl,
    bool? isLiked,
    int? rating,
  }) {
    return MealModel(
      category: category ?? this.category,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      time: time ?? this.time,
      price: price ?? this.price,
      calories: calories ?? this.calories,
      imageUrl: imageUrl ?? this.imageUrl,
      isLiked: isLiked ?? this.isLiked,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'id': id,
      'name': name,
      'description': description,
      'time': time,
      'price': price,
      'calories': calories,
      'imageUrl': imageUrl,
      'isLiked': isLiked,
      'rating': rating,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      category: map['category'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      time: map['time'] as int,
      price: map['price'] as int,
      calories: map['calories'] as int,
      imageUrl: map['imageUrl'] as String,
      isLiked: map['isLiked'] as bool,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MealModel(category: $category, id: $id, name: $name, description: $description, time: $time, price: $price, calories: $calories, imageUrl: $imageUrl, isLiked: $isLiked, rating: $rating)';
  }

  @override
  bool operator ==(covariant MealModel other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.time == time &&
        other.price == price &&
        other.calories == calories &&
        other.imageUrl == imageUrl &&
        other.isLiked == isLiked &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        time.hashCode ^
        price.hashCode ^
        calories.hashCode ^
        imageUrl.hashCode ^
        isLiked.hashCode ^
        rating.hashCode;
  }
}
