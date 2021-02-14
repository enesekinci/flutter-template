import '../provider/base_provider.dart';

abstract class BaseRepository {
  final BaseProvider provider;

  BaseRepository(this.provider);

  Future<List<dynamic>> getList();

  Future<List<dynamic>> getFilteredList({Map filter});

  Future<dynamic> store({Map data});

  Future<dynamic> findById({BigInt id});

  Future<dynamic> update({dynamic data});

  Future<bool> destroy({dynamic data});
}
