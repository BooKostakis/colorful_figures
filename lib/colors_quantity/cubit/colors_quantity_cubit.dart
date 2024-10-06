import 'package:bloc/bloc.dart';
import 'package:colorful_figures/colors_quantity/cubit/colors_quantity_state.dart';

class ColorsQuantityCubit extends Cubit<ColorsQuantityState> {
  ColorsQuantityCubit() : super(ColorsQuantityState(colorsQuantity: 1));

  void setColorsQuantity(int quantity) {
    emit(ColorsQuantityState(colorsQuantity: quantity));
  }
}
