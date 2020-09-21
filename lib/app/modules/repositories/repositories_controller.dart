import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/modules/users/users_controller.dart';
import 'package:radix_challenge/app/shared/models/repository_model.dart';
import 'package:radix_challenge/app/shared/repositories/api/repo_api_repository.dart';
import 'package:radix_challenge/app/shared/repositories/local_storage/repo_repository_local_storage_repository.dart';
import 'package:radix_challenge/app/shared/repositories/local_storage/user_repository_local_storage_repository.dart';

part 'repositories_controller.g.dart';

@Injectable()
class RepositoriesController = _RepositoriesControllerBase
    with _$RepositoriesController;

abstract class _RepositoriesControllerBase with Store {
  @observable
  ObservableFuture repositories;

  @observable
  RepositoryModel actualRepository;

  @observable
  int iClosedIssue;

  @action
  void getRepoApiByName(String key) {
    RepoApiRepository repository = Modular.get();
    repositories = repository.get(key).asObservable().catchError((onError) {
      getRepoLocalStorageByName(key);
    });
  }

  @action
  void getRepoLocalStorageByName(String key) {
    RepoLocalStorageRepository repository = Modular.get();

    try {
      repositories = repository.get(key).asObservable();
    } catch (error) {
      throw error;
    }
  }

  @action
  Future<void> getRepoClosedIssues(String user, String repo) async {
    RepoApiRepository repository = Modular.get();
    var closedIssues = await repository.getClosedIssues(user, repo);
    iClosedIssue = closedIssues;
  }

  void gravarReposLocal() {
    UserLocalStorageRepository userRepository = Modular.get();
    UsersController userController = Modular.get();

    RepoLocalStorageRepository repository = Modular.get();
    List<RepositoryModel> list = repositories.value;

    for (var item in list) {
      repository.put(item);
    }

    userRepository.put(userController.actualUser);
  }
}
