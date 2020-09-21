import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/models/user_model.dart';
import 'package:radix_challenge/app/shared/repositories/api/user_api_repository.dart';
import 'package:radix_challenge/app/shared/repositories/local_storage/user_repository_local_storage_repository.dart';

part 'users_controller.g.dart';

@Injectable()
class UsersController = _UsersControllerBase with _$UsersController;

abstract class _UsersControllerBase with Store {
  @observable
  ObservableFuture users;

  @observable
  UserModel actualUser;

  @action
  void getUsersApiByName(String key) {
    UserApiRepository repository = Modular.get();
    users = repository.get(key).asObservable();
  }

  @action
  void getUserLocalStorageByName(String key) {
    UserLocalStorageRepository repository = Modular.get();
    users = repository.getAll().asObservable();
  }

  @action
  void getAllStored() {
    UserLocalStorageRepository repository = Modular.get();
    users = repository.getAll().asObservable();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
