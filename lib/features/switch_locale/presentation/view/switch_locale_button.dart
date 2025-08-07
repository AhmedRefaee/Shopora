import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/features/switch_locale/presentation/view_model/cubit/switch_locale_cubit.dart';

class SwitchLocaleButton extends StatelessWidget {
  const SwitchLocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        onPressed: () {
          context.read<SwitchlocaleCubit>().switchLanguage();
        },
        child: const Icon(Icons.language),
      ),
    );
  }
}