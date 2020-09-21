import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';

abstract class IRepository implements Disposable {
  Future<List<IModel>> getAll();
  Future<List<IModel>> get(String key);
  Future put(IModel model);
  Future delete(IModel model);
}
