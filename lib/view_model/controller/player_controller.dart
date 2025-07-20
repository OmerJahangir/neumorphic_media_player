import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController {
  RxBool isPlaying = false.obs;
  RxDouble angle = 0.0.obs;
  RxDouble progress = 0.0.obs;
  RxDouble volume = 0.7.obs;
  RxString totalLength = ''.obs;
  RxString currentLength = '0:0'.obs;
  final player = AudioPlayer();
  void setVol() {
    player.setVolume(volume.value);
  }

  void setFilePath(String filePath) {
    player.setFilePath(filePath).then((value) {
      totalLength.value =
          '${player.duration!.inMinutes.toString()}:${(player.duration!.inSeconds % 60).toString()}';
      setPlay();
    });
  }

  Future<void> playSong() async {
    isPlaying.value = true;
    player.play().then(
          (value) async {},
        );
  }

  void setPlay() {
    if (isPlaying.value) {
      pauseSong();
    } else {
      playSong();
    }
  }

  Future<void> pauseSong() async {
    player.pause();
    isPlaying.value = false;
  }

  void seekForward() {
    if (player.position.inSeconds < player.duration!.inSeconds - 10) {
      player.seek(Duration(seconds: player.position.inSeconds + 10));
    }
  }

  void seekBack() {
    if (player.position.inSeconds > 10) {
      player.seek(Duration(seconds: player.position.inSeconds - 10));
    }
  }

  int i = 0;
  void setProgress() {
    progress.value = player.position.inSeconds / player.duration!.inSeconds;
    currentLength.value =
        '${player.position.inMinutes.toString()}:${(player.position.inSeconds % 60).toString()}';
    if (currentLength == totalLength) {
      player.stop();
      isPlaying.value = false;
    }
  }
}
