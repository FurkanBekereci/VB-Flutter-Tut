import 'dart:convert';

import 'package:first_project/202/cache/i_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCacheLearn extends StatefulWidget {
  const SharedCacheLearn({Key? key}) : super(key: key);

  @override
  State<SharedCacheLearn> createState() => _SharedCacheLearnState();
}

class _SharedCacheLearnState extends State<SharedCacheLearn> {
  int _currentValue = 0;
  int? _value;
  SharedCacheManager? pref;

  @override
  void initState() {
    super.initState();
    getInitialValue();
  }

  void onValueChanged(String value) {
    setState(() {
      _currentValue = int.tryParse(value) ?? _currentValue;
    });
  }

  void getInitialValue() async {
    _value = await SharedCacheManager.instance.getValue<int>(CacheKeys.value) ?? -1;
    setState(() {});
  }

  void saveValue() async {
    await SharedCacheManager.instance.setValue(CacheKeys.value, _currentValue);
    _value = _currentValue;
    setState(() {});
  }

  void removeValue() async {
    bool result = await SharedCacheManager.instance.removeValue(CacheKeys.value);

    print(result ? 'Value removed' : 'Value could not be removed');
    if (result) _value = -1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_value == -1 ? '' : _value.toString()),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: onValueChanged,
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: removeValue,
      child: const Icon(Icons.cancel),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: saveValue,
      child: const Icon(Icons.save),
    );
  }
}

class SharedCacheManager extends ICacheService {
  static SharedCacheManager? _instance;

  static SharedCacheManager get instance {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = SharedCacheManager._init();
    }
    return _instance!;
  }

  SharedCacheManager._init();

  Future<SharedPreferences> _getPreference() async {
    return (await SharedPreferences.getInstance());
  }

  @override
  Future<T?> getValue<T>(CacheKeys key) async {
    switch (T) {
      case int:
        return (await _getPreference()).getInt(key.name) as T?;
      case double:
        return (await _getPreference()).getDouble(key.name) as T?;
      case String:
        return (await _getPreference()).getString(key.name) as T?;
      case bool:
        return (await _getPreference()).getBool(key.name) as T?;
      default:
        String? jsonStr = (await _getPreference()).getString(key.name);
        return ((jsonStr?.isEmpty ?? false) ? jsonDecode(jsonStr ?? '') : null) as T?;
    }
  }

  @override
  Future<bool> setValue<T>(CacheKeys key, T value) async {
    switch (T) {
      case int:
        return (await _getPreference()).setInt(key.name, value as int);
      case double:
        return (await _getPreference()).setDouble(key.name, value as double);
      case String:
        return (await _getPreference()).setString(key.name, value as String);
      case bool:
        return (await _getPreference()).setBool(key.name, value as bool);
      default:
        assert(
          value is Map<String, dynamic>,
          'value must be int, double, String, bool or Map<String, dynamic>',
        );
        final stringObject = jsonEncode(value);
        return (await _getPreference()).setString(key.name, stringObject);
    }
  }

  @override
  Future<bool> removeValue(CacheKeys key) async {
    return (await _getPreference()).remove(key.name);
  }

  @override
  Future<Map<String, dynamic>> readAllValues() async {
    Map<String, dynamic> resultMap = {};

    (await _getPreference()).getKeys().forEach((key) async {
      for (var cacheKey in CacheKeys.values) {
        if (cacheKey.name == key) {
          resultMap[key] = await getValue(cacheKey);
        }
      }
    });

    return resultMap;
  }

  @override
  Future<bool> removeAllValues() async {
    try {
      (await _getPreference()).getKeys().forEach((key) async {
        for (var cacheKey in CacheKeys.values) {
          if (cacheKey.name == key) {
            await removeValue(cacheKey);
          }
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
