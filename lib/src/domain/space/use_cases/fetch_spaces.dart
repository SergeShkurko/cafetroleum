import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/space/repositories/space_repository.dart';

@injectable
class FetchSpacesUsecase implements UseCase<TaskWithFailure<void>, NoParams> {
  FetchSpacesUsecase(this._repo);

  final SpaceRepository _repo;

  @override
  TaskWithFailure<void> call(NoParams params) => _repo.fetchAll(params);
}
