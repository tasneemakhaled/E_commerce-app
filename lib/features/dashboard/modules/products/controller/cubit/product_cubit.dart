import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/firebase_data.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/local_db_data.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit instance = ProductCubit();
  ProductCubit() : super(ProductLoading()) {
    init();
  }
  List<ProductModel> products = [];
  DatabaseRepo repo = DatabaseRepo();
  Future<void> init() async {
    emit(ProductLoading());
    await DatabaseRepo.initDatabase();

    products = await repo.fetchProducts();
    if (products.isEmpty) {
      emit(ProductEmpty());
    } else {
      emit(ProductLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    emit(ProductLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(ProductLoaded());
  }
}
