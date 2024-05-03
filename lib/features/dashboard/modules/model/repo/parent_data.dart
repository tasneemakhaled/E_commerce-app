import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';

abstract class ParentRepo {
  Future<void> insert({required String name, String? address});
  Future<List<ProductModel>> fetch();
  Future<void> delete({required int id});
}
