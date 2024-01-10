import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitialState());

  bool isLastScreen = false;

  void nextPage(controller) {
    controller.nextPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceInOut,
    );
    emit(OnboardingNextState());
  }
}
