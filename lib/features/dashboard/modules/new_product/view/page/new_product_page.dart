import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:project_fcii/features/dashboard/modules/new_product/cubit/new_product_cubit.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductCubit(),
      child: BlocBuilder<NewProductCubit, NewProductState>(
        builder: (context, state) {
          final NewProductCubit cubit = context.read<NewProductCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text('Add new product'),
            ),
            body: Column(
              children: [
                // name
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  controller: cubit.nameController,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  controller: cubit.descController,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  controller: cubit.qntController,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: cubit.pickProductImage,
                        icon: const Icon(CupertinoIcons.photo)),
                    IconButton(
                        onPressed: cubit.takeProductImage,
                        icon: const Icon(CupertinoIcons.camera)),
                  ],
                ),
                if (cubit.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(
                      File(cubit.image!.path),
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                Spacer(),
                TextButton(
                  onPressed: () => cubit.addProduct(context),
                  child: Text('Add product'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
