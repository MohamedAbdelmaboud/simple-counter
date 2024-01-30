import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/common/extensions/context_colors_extension.dart';
import 'package:practice/counter_cubit/counter_cubit.dart';
import 'package:practice/counter_cubit/counter_state.dart';
import 'package:practice/lock_cubit/lock_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<LockCubit, LockState>(
            builder: (context, state) {
              return Row(
                children: [
                  CustomButton(
                    iconData: BlocProvider.of<LockCubit>(context).isLocked
                        ? Icons.lock
                        : Icons.lock_open_rounded,
                    onPressed: () {
                      BlocProvider.of<LockCubit>(context).lock();
                    },
                  ),
                  Visibility(
                    visible: state is Unlocked || state is LockInitial,
                    child: CustomButton(
                      iconData: Icons.refresh,
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).refresh();
                      },
                    ),
                  )
                ],
              );
            },
          ),
          Row(
            children: [
              CustomButton(
                iconData: Icons.remove,
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).remove();
                },
              ),
              CustomButton(
                iconData: Icons.add,
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).add();
                },
              ),
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Container(
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      color: context.theme.counterBgColor, shape: BoxShape.circle),
                  height: 50,
                  width: 50,
                  child: Text(
                    '${BlocProvider.of<CounterCubit>(context).num}',
                    style: const TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.iconData,
    this.onPressed,
  });
  final void Function()? onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(iconData),
      ),
    );
  }
}
