import 'reflection/reflection_helper.dart';

abstract class BaseEntity {}

extension BaseEntityExtension<T extends BaseEntity> on T? {
  T? fromJson(Map<String, dynamic> json) {
    return json.toObject<T>();
  }

  Map<String, dynamic>? toJson() {
    return ReflectionHelper().toJson(this);
  }
}

extension JsonExtension on Map<String, dynamic>? {
  T? toObject<T extends BaseEntity>() {
    return ReflectionHelper().fromJson<T>(this);
  }
}
