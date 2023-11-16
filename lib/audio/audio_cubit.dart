import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _player = AudioPlayer();

  AudioCubit() : super(AudioInitial());

  Future<void> playAudio(String streamUrl) async {
    emit(AudioPlaying());
    await _player.setUrl(streamUrl);
    await _player.play();
    listenAudio();
  }

  Future<void> listenAudio() async {
    await _player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        emit(AudioStopped());
      }
    });
  }

  Future<void> pauseAudio() async {
    await _player.pause();
    emit(AudioPaused());
  }

  Future<void> stopAudio() async {
    await _player.stop();
    emit(AudioStopped());
  }

  Future<void> resumeAudio() async {
    emit(AudioPlaying());
    await _player.play();
    listenAudio();
  }

  Future<void> resetAudio() async {
    emit(AudioInitial());
  }
}
