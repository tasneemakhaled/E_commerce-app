part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {}

final class FavouriteEmpty extends FavouriteState {}
