import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/local_db_data.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';

part 'new_product_state.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit() : super(NewProductInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController qntController = TextEditingController();
  XFile? image;
  Future<void> pickProductImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);

    emit(NewProductInitial());
  }

  Future<void> takeProductImage() async {
    final ImagePicker picker = ImagePicker();
// take an image.
    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewProductInitial());
  }

  Future<void> addProduct(context) async {
    DatabaseRepo db = DatabaseRepo();
    DatabaseRepo.initDatabase();
    db.insertProduct(
      nameController.text,
      descController.text,
      0,
      int.parse(qntController.text),
      await image!.readAsBytes(),
    );
    await ProductCubit.instance.init();
    Navigator.pop(context);
  }
  // TextEditingController nameController = TextEditingController();
  // TextEditingController descController = TextEditingController();
  // TextEditingController qntController = TextEditingController();
  // XFile? image;

  // Future<void> pickProductImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   // Pick an image from the gallery
  //   image = await picker.pickImage(source: ImageSource.gallery);
  // }

  // Future<void> takeProductImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   // Capture an image using the camera
  //   image = await picker.pickImage(source: ImageSource.camera);
  // }

  // Future<void> addProduct(Context) async {
  //   if (image != null) {
  //     // Read the bytes from the image file
  //     Uint8List imageBytes = await image!.readAsBytes();
  //     // Insert the product into the database with the image bytes
  //     // DatabaseRepo db = DatabaseRepo();
  //     // // db.init();
  //     DatabaseRepo().insertProduct(
  //       name: nameController.text,
  //       desc: descController.text,
  //       quantity: int.parse(qntController.text),
  //       availableQuantity: 0,
  //       image: imageBytes,
  //     );
  //     ProductCubit.instance.init();
  //     Navigator.pop(Context);
  //   } else
  //     emit(NewProductInitial());
  // }
}
