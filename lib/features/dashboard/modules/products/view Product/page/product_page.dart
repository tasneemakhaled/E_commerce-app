import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/features/dashboard/modules/favourites/controller/cubit/favourite_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/favourites/view%20favourite/components/favourite_widget.dart';
import 'package:project_fcii/features/dashboard/modules/products/view%20Product/components/product_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProductCubit.instance,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final ProductCubit controller = context.read<ProductCubit>();
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
                        itemBuilder: (_, int index) => ProductItemWidget(
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
