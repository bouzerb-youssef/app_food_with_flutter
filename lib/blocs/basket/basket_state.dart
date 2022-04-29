part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

class BasketLoadingState extends BasketState {}

class BasketLoadedState extends BasketState {
  final Basket basket;

  BasketLoadedState(this.basket);

  @override
  List<Object> get props => [basket];
}
