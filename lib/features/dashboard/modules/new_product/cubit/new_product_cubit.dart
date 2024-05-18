import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_product_state.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit() : super(NewProductInitial());
}
