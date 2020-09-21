import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';
import 'package:radix_challenge/app/shared/models/user_model.dart';
import 'package:radix_challenge/app/shared/repositories/interfaces/repository_interface.dart';

part 'user_repository_local_storage_repository.g.dart';

@Injectable()
class UserLocalStorageRepository implements IRepository {
  Completer _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(UserModelAdapter());
    var box = await Hive.openBox<UserModel>('users');
    _instance.complete(box);
  }

  UserLocalStorageRepository() {
    _init();
  }

  @override
  Future delete(IModel model) async {
    var box = await _instance.future;
    box.get(model as UserModel);
    model.delete();
  }

  @override
  Future<List<IModel>> getAll() async {
    var box = await _instance.future;

    List<UserModel> list = [];

    for (int i = 0; i < box.length; i++) {
      UserModel userModel = box.getAt(i);
      list.add(userModel);
    }

    return list;
  }

  @override
  Future put(IModel model) async {
    var box = await _instance.future;
    UserModel userModel = model;
    box.add(userModel);
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<IModel>> get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }
}
