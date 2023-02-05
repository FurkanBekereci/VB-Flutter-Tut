import 'package:first_project/202/base_entity.dart';
import 'package:reflectable/reflectable.dart';

class _Reflector extends Reflectable {
  const _Reflector()
      : super(invokingCapability, typeCapability, declarationsCapability, typeRelationsCapability,
            reflectedTypeCapability); // Request the capability to invoke methods.
}

const reflector = _Reflector();

class ReflectionHelper {
  T? fromJson<T extends BaseEntity>(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) return null;
    try {
      TypeMirror typeMirror = reflector.reflectType(T);

      if (typeMirror is ClassMirror) {
        var instance = typeMirror.newInstance('', []) as T;
        InstanceMirror instanceMirror = reflector.reflect(instance);
        String className = typeMirror.simpleName;
        var declarationKeyList = typeMirror.declarations.keys.toList();
        var jsonKeys = json.keys.map((e) => e.toLowerCase()).toList();

        for (var declarationKey in declarationKeyList) {
          if (declarationKey != className && jsonKeys.contains(declarationKey.toLowerCase())) {
            DeclarationMirror declarationMirror =
                typeMirror.declarations.entries.firstWhere((element) => element.key == declarationKey).value;

            if (declarationMirror is VariableMirror) {
              instanceMirror.invokeSetter(declarationKey, json[declarationKey]);
            }
          }
        }

        return instance;
      }

      return null;
    } on Exception {
      return null;
    }
  }

  Map<String, dynamic>? toJson<T extends BaseEntity>(T? item) {
    if (item == null) return null;

    try {
      InstanceMirror instanceMirror = reflector.reflect(item);
      ClassMirror classMirror = instanceMirror.type;
      String className = classMirror.simpleName;
      var declarationKeyList =
          classMirror.declarations.entries.where((element) => !element.value.isPrivate).map((e) => e.key).toList();

      Map<String, dynamic> json = {};

      for (var declarationKey in declarationKeyList) {
        if (declarationKey != className) {
          DeclarationMirror declarationMirror =
              classMirror.declarations.entries.firstWhere((element) => element.key == declarationKey).value;

          if (declarationMirror is VariableMirror) {
            json[declarationKey] = instanceMirror.invokeGetter(declarationKey);
          }
        }
      }

      return json;
    } on Exception {
      return null;
    }
  }
}


/*
USAGE:
    Map<String, dynamic> json = {"name": 'hello', "desc": 'açıklama'};
    var result = json.toObject<Product>();
    var againJson = result.toJson();
*/