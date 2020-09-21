import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';
import 'package:radix_challenge/app/shared/models/repository_model.dart';
import 'package:radix_challenge/app/shared/repositories/interfaces/repository_interface.dart';

part 'repo_api_repository.g.dart';

@Injectable()
class RepoApiRepository implements IRepository {
  final Dio client;

  RepoApiRepository(this.client);

  Future<List<RepositoryModel>> getRepoFromUser(String user) async {
    final response = await client.get('/users/$user/repos');

    List<RepositoryModel> lista = [];
    for (var json in response.data) {
      lista.add(RepositoryModel.fromJson(json));
    }

    return lista;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future fetchPost() {
    // TODO: implement fetchPost
    throw UnimplementedError();
  }

  @override
  Future delete(IModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<IModel>> get(String key) async {
    List<RepositoryModel> lista = [];

    try {
      final response = await client.get('/users/$key/repos');

      for (var json in response.data) {
        lista.add(RepositoryModel.fromJson(json));
      }

      Comparator<RepositoryModel> sortByStarts =
          (a, b) => a.stargazersCount.compareTo(b.stargazersCount);
      lista.sort(sortByStarts);
      lista = lista.reversed.toList();
    } catch (error) {
      throw Exception("Erro de Conexao");
    }

    return lista;
  }

  @override
  Future<int> getClosedIssues(String user, String repo) async {
    final response = await client.get('/repos/$user/$repo/issues?state=closed');
    int iCount = 0;

    for (var json in response.data) {
      iCount++;
    }

    return iCount;
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
