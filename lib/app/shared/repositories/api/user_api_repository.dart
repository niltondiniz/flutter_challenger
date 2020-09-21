import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';
import 'package:radix_challenge/app/shared/models/user_model.dart';
import 'package:radix_challenge/app/shared/repositories/interfaces/repository_interface.dart';

part 'user_api_repository.g.dart';

@Injectable()
class UserApiRepository implements IRepository {
  final Dio client;

  UserApiRepository(this.client);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(IModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<IModel>> get(String key) async {
    List<UserModel> lista = [];

    try {
      final response = await client.get('/search/users?q=$key');
      for (var json in response.data["items"]) {
        lista.add(UserModel.fromJson(json));
      }
    } catch (error) {
      throw Exception("Problemas de Conexao");
    }

    return lista;
  }

  @override
  Future put(IModel model) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<List<IModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
