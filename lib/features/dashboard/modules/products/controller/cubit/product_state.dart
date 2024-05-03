part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {}

final class ProductEmpty extends ProductState {}
