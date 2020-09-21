import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:radix_challenge/app/shared/repositories/api/repo_api_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final RepoApiRepository repoRepository;

  @observable
  ObservableFuture repositorios;

  _HomeControllerBase(this.repoRepository) {
    repositorios = repoRepository.getRepoFromUser('niltondiniz').asObservable();
  }
}
