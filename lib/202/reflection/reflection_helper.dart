import 'package:first_project/202/base_entity.dart';
import 'package:reflectable/reflectable.dart';

class Reflector extends Reflectable {
  const Reflector()
      : super(invokingCapability, typeCapability, declarationsCapability, typeRelationsCapability,
            reflectedTypeCapability); // Request the capability to invoke methods.
}

const reflector = Reflector();

class ReflectionHelper {
  T? fromJson<T extends BaseEntity>(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) return null;

    try {
      TypeMirror typeMirror = reflector.reflectType(T);

      if (typeMirror is! ClassMirror) return null;

      var instance = typeMirror.newInstance('', []) as T;
      InstanceMirror instanceMirror = reflector.reflect(instance);

      List<String> jsonKeys = json.keys.map((e) => e.toLowerCase()).toList();

      for (var declaration in typeMirror.declarations.entries) {
        String declarationKey = declaration.key.toLowerCase();
        DeclarationMirror declarationMirror = declaration.value;

        if (declarationMirror is VariableMirror && jsonKeys.contains(declarationKey.toLowerCase())) {
          instanceMirror.invokeSetter(declarationKey, json[declarationKey]);
        }
      }

      return instance;
    } on Exception catch (e) {
      var x = e;
      return null;
    }
  }

  Map<String, dynamic>? toJson<T extends BaseEntity>(T? item) {
    if (item == null) return null;

    try {
      InstanceMirror instanceMirror = reflector.reflect(item);
      ClassMirror classMirror = instanceMirror.type;

      Map<String, dynamic> json = {};

      for (var declaration in classMirror.declarations.entries) {
        String declarationKey = declaration.key;
        DeclarationMirror declarationMirror = declaration.value;

        if (!declarationMirror.isPrivate && declarationMirror is VariableMirror) {
          json[declarationKey] = instanceMirror.invokeGetter(declarationKey);
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