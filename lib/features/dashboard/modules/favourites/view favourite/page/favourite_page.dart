import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/features/dashboard/modules/favourites/controller/cubit/favourite_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/favourites/view%20favourite/components/favourite_widget.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit.instance,
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          final FavouriteCubit controller = context.read<FavouriteCubit>();
          return Scaffold(
            body: state is ProductLoading
                ? const CircularProgressIndicator()
                : state is ProductEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => FavouriteItemWidget(
                          productModel: controller.products[index],
                          controller: controller,
                        ),
                        itemCount: controller.products.length,
                      ),
          );
        },
      ),
    );
  }
}
