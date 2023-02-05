// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class MyCollectionsDemo extends StatefulWidget {
  const MyCollectionsDemo({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemo> createState() => _MyCollectionsDemoState();
}

class _MyCollectionsDemoState extends State<MyCollectionsDemo> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    _items = CollectionItems().items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          padding: PaddingUtility.paddingHorizontal,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return _CategoryCard(item: item);
          },
        ));
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CollectionModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ShapeUtility.cardShapeBorder,
      margin: PaddingUtility.paddingBottom,
      child: Padding(
        padding: PaddingUtility.paddingGeneral,
        child: Column(
          children: [
            Image.asset(item.imagePath, fit: BoxFit.fitWidth),
            _textsRow(),
          ],
        ),
      ),
    );
  }

  Padding _textsRow() {
    return Padding(
      padding: PaddingUtility.paddingTop,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.title),
          Text(item.price.toString()),
        ],
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });

  CollectionModel copyWith({
    String? imagePath,
    String? title,
    double? price,
  }) {
    return CollectionModel(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'title': title,
      'price': price,
    };
  }

  factory CollectionModel.fromMap(Map<String, dynamic> map) {
    return CollectionModel(
      imagePath: map['imagePath'] as String,
      title: map['title'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionModel.fromJson(String source) =>
      CollectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '{imagePath: $imagePath, title: $title, price: $price}';

  @override
  bool operator ==(covariant CollectionModel other) {
    if (identical(this, other)) return true;

    return other.imagePath == imagePath && other.title == title && other.price == price;
  }

  @override
  int get hashCode => imagePath.hashCode ^ title.hashCode ^ price.hashCode;
}

class CollectionItems {
  late final List<CollectionModel> _items;

  List<CollectionModel> get items => _items;

  CollectionItems() {
    _items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art', price: 3.4)
    ];
  }
}

class PaddingUtility {
  static const EdgeInsets paddingTop = EdgeInsets.only(top: 10);
  static const EdgeInsets paddingBottom = EdgeInsets.only(bottom: 20);
  static const EdgeInsets paddingGeneral = EdgeInsets.all(20);
  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
}

class ShapeUtility {
  static const ShapeBorder cardShapeBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));
}

class ProjectImages {
  static const imageCollection = 'assets/images/image_collection.png';
}
