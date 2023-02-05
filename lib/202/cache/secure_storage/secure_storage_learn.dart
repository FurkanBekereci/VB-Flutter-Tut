import 'package:first_project/202/base_entity.dart';
import 'package:first_project/202/cache/i_cache_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../reflection/reflection_helper.dart';

class SecureStorageLearn extends StatefulWidget {
  const SecureStorageLearn({Key? key}) : super(key: key);

  @override
  State<SecureStorageLearn> createState() => _SecureStorageLearnState();
}

class _SecureStorageLearnState extends State<SecureStorageLearn> {
  late ICacheService _cacheService;
  Product p = Product();
  @override
  void initState() {
    super.initState();
    _cacheService = SecureStorageManager.instance;
    userItems = UserItems().users;
  }

  late final List<User> userItems;

  Future<void> saveValue() async {
    List<User>? result = await _cacheService.getValue<List<User>>(CacheKeys.user);
    setState(() {
      userItems = result ?? [];
    });
  }

  Future<void> removeValue() async {
    //await _cacheService.removeValue(CacheKeys.user);
    try {
      //Map<String, dynamic> json = {"name": 'hello', "desc": 'açıklama'};
      // var result = json.toObject<Product>();
      // var againJson = result.toJson();
      //int i = 1;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: saveValue,
            child: const Icon(Icons.save_outlined),
          ),
          FloatingActionButton(
            onPressed: removeValue,
            child: const Icon(Icons.delete_outlined),
          ),
        ],
      ),
    );
  }
}

@reflector
class Product extends BaseEntity {
  String? name;
  String? desc;
  String? _hello;

  @override
  String toString() {
    return '$name-$desc';
  }
}

class SecureStorageManager implements ICacheService {
  // static FlutterSecureStorage? _storage;
  static SecureStorageManager? _instance;

  // Create storage
  // static FlutterSecureStorage get storage {
  //   // ignore: prefer_conditional_assignment
  //   return null;

  // }

  static SecureStorageManager get instance {
    // ignore: prefer_conditional_assignment
    if (_instance == null) _instance = SecureStorageManager._init();
    return _instance!;
  }

  SecureStorageManager._init();

  @override
  Future<Map<String, dynamic>> readAllValues() async {
    return {}; //await storage.readAll();
  }

  @override
  Future<bool> removeAllValues() async {
    try {
      //await storage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> remove(String key) async {
    try {
      //await storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> setValue<T>(CacheKeys key, T value) async {
    try {
      //await storage.write(key: key.name, value: value.toString());
      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<T?> getValue<T>(CacheKeys key) async {
    try {
      return 0 as T; //await storage.read(key: key.name) as T?;
    } on Exception {
      return null;
    }
  }

  @override
  Future<bool> removeValue(CacheKeys key) async {
    try {
      //await storage.delete(key: key.name);
      return true;
    } on Exception {
      return false;
    }
  }
}

class User {
  final String name;
  final String description;
  final String url;

  User(this.name, this.description, this.url);
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('Furkan', 'Merhaba', 'furkan.test.com'),
      User('Veli', 'Selam', 'veli.test.com'),
      User('Engin', 'İyi günler', 'engin.test.com'),
    ];
  }
}
