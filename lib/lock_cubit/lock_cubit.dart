import 'package:flutter_bloc/flutter_bloc.dart';

part 'lock_state.dart';

class LockCubit extends Cubit<LockState> {
  LockCubit() : super(LockInitial());
  bool isLocked = false;
  lock() {
    if (state is Locked) {
      emit(Unlocked());
      isLocked = true;
    } else {
      emit(Locked());
      isLocked = false;
    }
  }
}
