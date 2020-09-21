import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';
import 'package:radix_challenge/app/shared/models/license.dart';
import 'package:radix_challenge/app/shared/models/owner.dart';
import 'package:radix_challenge/app/shared/models/repository_model.dart';
import 'package:radix_challenge/app/shared/repositories/interfaces/repository_interface.dart';

part 'repo_repository_local_storage_repository.g.dart';

@Injectable()
class RepoLocalStorageRepository implements IRepository {
  Completer _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RepositoryModelAdapter());
    Hive.registerAdapter(OwnerAdapter());
    Hive.registerAdapter(LicenseAdapter());
    var box = await Hive.openBox('repo');
    _instance.complete(box);
  }

  RepoLocalStorageRepository() {
    _init();
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(IModel model) async {
    var box = await _instance.future;
    box.get(model as RepositoryModel);
    model.delete();
  }

  @override
  Future<List<IModel>> getAll() async {
    var box = await _instance.future;

    List<RepositoryModel> list = [];

    for (int i = 0; i < box.length; i++) {
      RepositoryModel repoModel = box.getAt(i);
      list.add(repoModel);
    }

    return list;
  }

  @override
  Future put(IModel model) async {
    var box = await _instance.future;
    RepositoryModel repoModel = model;
    box.add(repoModel);
  }

  @override
  Future<List<IModel>> get(String key) async {
    var box = await _instance.future;

    List<RepositoryModel> list = [];

    for (int i = 0; i < box.length; i++) {
      RepositoryModel repoModel = box.getAt(i);
      list.add(repoModel);
    }

    var repoByUser = list.where((i) => i.owner.login == key).toList();

    return repoByUser;
  }
}
