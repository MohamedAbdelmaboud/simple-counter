import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int num = 0;
  void add() {
    emit(CounterSucess());
    ++num;
  }

  void remove() {
    emit(CounterSucess());
    --num;
  }

  void refresh() {
    emit(CounterSucess());
    num = 0;
  }

}
