part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class Cartadd extends CartState {}

final class Cartremove extends CartState {}
