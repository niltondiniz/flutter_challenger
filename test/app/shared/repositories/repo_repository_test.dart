import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:radix_challenge/app/shared/models/repository_model.dart';

import 'package:radix_challenge/app/shared/repositories/api/repo_api_repository.dart';
import 'package:radix_challenge/app/shared/util/constants.dart';

void main() {
  RepoApiRepository repository;
  Dio client;

  setUp(() {
    client = Dio(BaseOptions(baseUrl: URL_BASE));
    repository = RepoApiRepository(client);
  });

  group('RepoRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<RepoApiRepository>());
    });

    test('Lista os 9 repositorios de nilton diniz', () async {
      var data = await repository.getRepoFromUser('niltondiniz');
      expect(data.length, 9);
    });

    test('verifica se nilton é o owner do repo', () async {
      var data = await repository.getRepoFromUser('niltondiniz');
      expect(data[0].owner.login, "niltondiniz");
    });
  });
}
