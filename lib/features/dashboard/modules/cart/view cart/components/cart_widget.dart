import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fcii/features/dashboard/modules/cart/controller/cubit/cart_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:project_fcii/features/dashboard/modules/favourites/controller/cubit/favourite_cubit.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {super.key, required this.productModel, required this.controller});
  final ProductModel productModel;
  final CartCubit controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.memory(
                              productModel.image ?? Uint8List(5),
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productModel.name ?? 'product',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                productModel.desc ?? 'description',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                (productModel.availableQuantity ?? 0)
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ///like
                          InkWell(
                            child: productModel.cart == 1
                                ? const Icon(
                                    CupertinoIcons.cart,
                                    color: Colors.blue,
                                  )
                                : const Icon(
                                    CupertinoIcons.cart,
                                    color: Colors.grey,
                                  ),
                            onTap: () {
                              // Add to cart or remove from cart
                              if (productModel.cart == 1) {
                                controller.addItemToCart(
                                    productModel.id ?? 0, 0);
                              } else {
                                controller.addItemToCart(
                                    productModel.id ?? 0, 1);
                              }
                            },
                          ),
                          Container(
                            height: 30,
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
