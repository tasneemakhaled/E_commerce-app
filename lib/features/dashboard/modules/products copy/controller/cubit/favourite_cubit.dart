import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/firebase_data.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/local_db_data.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  static FavouriteCubit instance = FavouriteCubit();
  FavouriteCubit() : super(FavouriteLoading()) {
    init();
  }
  List<ProductModel> products = [];
  DatabaseRepo repo = DatabaseRepo();
  Future<void> init() async {
    emit(FavouriteLoading());
    await DatabaseRepo.initDatabase();

    products = await repo.fetchFavoriteProducts();
    if (products.isEmpty) {
      emit(FavouriteEmpty());
    } else {
      emit(FavouriteLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    emit(FavouriteLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(FavouriteLoaded());
  }
}
