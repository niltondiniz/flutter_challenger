import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:radix_challenge/app/shared/models/user_model.dart';

import 'package:radix_challenge/app/shared/repositories/api/user_api_repository.dart';
import 'package:radix_challenge/app/shared/util/constants.dart';

void main() {
  UserApiRepository repository;
  Dio client;

  setUp(() {
    client = Dio(BaseOptions(baseUrl: URL_BASE));
    repository = UserApiRepository(client);
  });

  group('UserRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<UserApiRepository>());
    });

    test('Lista usuarios que contenham nilton no login', () async {
      var data = await repository.get('nilton');
      expect(data.isEmpty, false);
    });

    test('verifica se retornou niltondiniz', () async {
      List<UserModel> data = await repository.get('niltondiniz');
      expect(data[0].login, "niltondiniz");
    });
  });
}
