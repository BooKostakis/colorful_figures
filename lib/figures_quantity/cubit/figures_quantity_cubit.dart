import 'package:bloc/bloc.dart';
import 'package:colorful_figures/figures_quantity/cubit/figures_quantity_state.dart';

class FiguresQuantityCubit extends Cubit<FiguresQuantityState> {
  FiguresQuantityCubit() : super(FiguresQuantityState(figuresQuantity: 1));

  void setFiguresQuantity(int quantity) {
    emit(FiguresQuantityState(figuresQuantity: quantity));
  }
}
