import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/features/dashboard/modules/cart/controller/cubit/cart_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/cart/view%20cart/components/cart_widget.dart';
import 'package:project_fcii/features/dashboard/modules/favourites/controller/cubit/favourite_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit.instance,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final CartCubit controller = context.read<CartCubit>();
          return Scaffold(
            body: state is CartLoading
                ? const CircularProgressIndicator()
                : state is CartEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => CartItemWidget(
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
