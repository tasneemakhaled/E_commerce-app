import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:project_fcii/features/dashboard/modules/products/controller/cubit/product_cubit.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(
      {super.key, required this.productModel, required this.controller});
  final ProductModel productModel;
  final ProductCubit controller;
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name ?? 'product'),
                  Text(productModel.desc ?? 'description'),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  InkWell(
                    child: (productModel.favorite == 1)
                        ? Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                          )
                        : Icon(CupertinoIcons.heart),
                    onTap: () {
                      log('Added to favourites');
                      // controller.addItemToFavourite(productModel.id??0);
                    },
                  ),
                  Text((productModel.availableQuantity ?? 0).toString()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
