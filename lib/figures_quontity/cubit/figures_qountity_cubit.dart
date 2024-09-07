import 'package:bloc/bloc.dart';
part 'figures_quontity_state.dart';

class FiguresQuantityCubit extends Cubit<FiguresQuantityState> {
  FiguresQuantityCubit() : super(FiguresQuantityState(colorsQuantity: 0));

  void setColorsQuantity(int quantity) {
    emit(FiguresQuantityState(colorsQuantity: quantity));
  }
}
