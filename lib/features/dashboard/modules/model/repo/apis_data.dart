import 'package:project_fcii/features/dashboard/modules/model/repo/parent_data.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';

class APIsRepo extends ParentRepo {
  @override
  Future<void> delete({required num id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, String? address}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
