// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  String parentId;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  // empty helper function
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  // convert model to json so that you can store data in firebase

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Image': image,
        'isFeatured': isFeatured,
        'ParentId': parentId,
      };

  //Map json oriented document snapshot from friebase to user model
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        parentId: data['ParentId'] ?? '', 
      );
    }else{
      return CategoryModel.empty();
    }
  }
}
