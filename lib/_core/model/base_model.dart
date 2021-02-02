import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  Map<String, Object> toJson();

  T fromJson(Map<String, Object> json);

  @override
  bool get stringify => true; // çalışıyor mu test etmek lazım?? equatable özelliği

}
