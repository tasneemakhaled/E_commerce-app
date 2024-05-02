import 'package:project_fcii/features/dashboard/model/repo/parent_data.dart';
import 'package:project_fcii/features/dashboard/model/entity/user_model.dart';

class APIsRepo extends ParentRepo {
  @override
  Future<void> delete({required num id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, String? address}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
