import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoControlsCubit extends Cubit<VideoPlayerController?> {
  final ValueNotifier<bool> isPlayingNotifier = ValueNotifier<bool>(false);
  bool isFullScreen = false;
  VideoControlsCubit() : super(null);
  late ChewieController chewieController;

  void initializeController(String videoUrl) {
    final controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.youtube.com/watch?v=fdBBaou5Gkw&ab_channel=HDRetroTrailers'));
    emit(controller);
  }

  void play() {
    state?.play();
    isPlayingNotifier.value = true;
  }

  void pause() {
    state?.pause();
    isPlayingNotifier.value = false;
  }

  void onRewind() {
    final position = state?.value.position ?? Duration.zero;
    final newPosition = position - const Duration(seconds: 10);
    state?.seekTo(newPosition);
  }

  void onSkip() {
    final position = state?.value.position ?? Duration.zero;
    final newPosition = position + const Duration(seconds: 10);
    state?.seekTo(newPosition);
  }

  void onToggleFullScreen() {
    chewieController.toggleFullScreen();
    isFullScreen = !isFullScreen;
    emit(state);
  }

  @override
  Future<void> close() {
    state?.dispose();
    chewieController.dispose();
    isPlayingNotifier.dispose();
    return super.close();
  }
}
