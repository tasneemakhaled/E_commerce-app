part of 'favourite_cubit.dart';

@immutable
sealed class CartState {}

final class FavouriteLoading extends CartState {}

final class FavouriteLoaded extends CartState {}

final class FavouriteEmpty extends CartState {}
