import 'package:flutter/cupertino.dart';

class CardModel with ChangeNotifier {
  final int id;
  final String nameEn;
  final String nameAr;
  final int sequence;
  final int parentId;
  final String imageUrl;

  CardModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.sequence,
    required this.parentId,
    required this.imageUrl,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      sequence: json['sequance'],
      parentId: json['parent_id'],
      imageUrl: json['image_url'],
    );
  }
}
