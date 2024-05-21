import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/firebase_data.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/local_db_data.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  static CartCubit instance = CartCubit();
  CartCubit() : super(CartLoading()) {
    init();
  }
  List<ProductModel> products = [];
  DatabaseRepo repo = DatabaseRepo();
  Future<void> init() async {
    emit(CartLoading());
    await DatabaseRepo.initDatabase();

    products = await repo.fetchCartProducts();
    if (products.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded());
    }
  }

  // Future<void> addItemToFavorite(int id, int value) async {
  //   await repo.updateFavorite(value, id);
  //   await init();
  //   ProductCubit.instance.init();
  //   emit(CartLoaded());
  // }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(CartLoaded());
  }
}
