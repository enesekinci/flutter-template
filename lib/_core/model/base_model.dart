import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  BaseModel();

  factory BaseModel.fromJson() {
    return null;
  }

  Map<String, dynamic> toJson();
}
