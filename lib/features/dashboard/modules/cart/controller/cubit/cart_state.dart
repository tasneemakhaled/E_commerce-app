part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {}

final class CartEmpty extends CartState {}
