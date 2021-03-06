import 'package:bloc/bloc.dart';
import 'package:sample_store/module/card/bloc/quantity/quantity_event.dart';
import 'package:sample_store/module/card/bloc/quantity/quantity_state.dart';


class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  QuantityBloc({required this.max , required this.quantity, }) : super( const QuantityMin(quantity:1)) {
    on<LoadQuantity>(_onStarted);
    on<IncreaseQuantity>(_onIncreased);
    on<DecreaseQuantity>(_onItemDecrease);
  }

   final int quantity;
   final int max;

  void _onStarted(LoadQuantity event, Emitter<QuantityState> emit) async {
    emit( const QuantityMin(quantity:0));
  }

  void _onIncreased(IncreaseQuantity event, Emitter<QuantityState> emit) async {
    ///------------------disable increasing button
    if(event.quantityIndex==max-1) {
      emit( QuantityMax(quantity:event.quantityIndex));
      ///------------------normal scenario
    } else {
      emit( QuantityIncreased(quantity:event.quantityIndex+1));
    }

  }
  void _onItemDecrease(DecreaseQuantity event, Emitter<QuantityState> emit) {
    ///------------------disable decreasing button
    if(event.quantityIndex==2) {
      emit( const QuantityMin(quantity:1));
    } else {
      ///------------------normal scenario
      emit(QuantityDecrease(quantity: event.quantityIndex - 1));
    }

  }
  }
