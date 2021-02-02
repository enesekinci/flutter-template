import '../model/base_model.dart';
import '../provider/base_provider.dart';

abstract class BaseRepository {
  final BaseProvider provider;

  BaseRepository._init(this.provider);

  Future<List<BaseModel>> getList();

  Future<List<BaseModel>> getFilteredList({Map filter});

  Future<BaseModel> store({Map data});

  Future<BaseModel> findById({BigInt id});

  Future<BaseModel> update({BaseModel data});

  Future<bool> destroy({BaseModel data});
}
