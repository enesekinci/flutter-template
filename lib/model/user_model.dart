import '../_core/model/base_model.dart';

class User extends BaseModel {
  final BigInt id;
  final String username;
  final String name;

  User({this.id, this.username, this.name});

  @override
    fromJson(Map<String, Object> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toJson() {
    throw UnimplementedError();
  }

  @override
  List<Object> get props => [id, username, name];
}
