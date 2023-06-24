import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';

class QuizController extends GetxController {
  late AudioPlayer audioPlayer;
  RxString currnetSong = ''.obs;
  RxDouble sliderVal = (5.0).obs;
  RxBool isPlayingAudio = false.obs;
  Rx<Duration> duration = const Duration().obs;
  Rx<Duration> position = const Duration().obs;
  RxInt i = 0.obs;
  double progress = 0.0;

  RxBool isRecording = false.obs;
  RxString recordingPath = ''.obs;

  Future<void> startRecording() async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      recordingPath.value = appDocDir.path + '/adhirat.wav';
      await Record().start(path: recordingPath.value);
      isRecording.value = true;
      print("----->> ${recordingPath.value}");
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopRecording() async {
    try {
      await Record().stop();
      isRecording.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> playRecording() async {
    try {
      final ByteData data = await rootBundle.load(recordingPath.value);
      await AudioPlayer().play(data.buffer.asUint8List() as Source);
    } catch (e) {
      print(e);
    }
  }

  void questionroue() {
    print("${quizquestion.length}   -- ${i}");
    if (i.value < quizquestion.length - 1) {
      i.value++;
      progress = ((i.value + 1) / quizquestion.length);
    }
  }

  RxList quizquestion = [
    {
      "type": "true",
      "title": "True / False",
      "que": "This is the Book ?",
      "A": "True",
      "B": "False",
    },
    {
      "type": "aud",
      "title": "Quiz + Audio",
      "que": "Order the Following simple word ?",
      "A": "Book are the window of life",
      "B": "Book is the window of life",
      "C": "Book are the window of house",
      "D": "Book are the window of hevan",
    },
    {
      "type": "write",
      "title": "Type Answer",
      "que": "What does the illustretor above the description ?",
    },
    {
      "type": "puzzel",
      "title": "Puzzel",
      "que": "Order the following simple word ?",
      "A": "This",
      "B": "is",
      "C": "my ",
      "D": "There",
    },
    {
      "type": "chekbox",
      "title": "ChekBox",
      "que": "What are the object in the picture ?",
      "A": "Book",
      "B": "Ruler",
      "C": "Pen",
      "D": "Laptop",
    },
    {
      "type": "rec",
      "title": "Say the Words.",
      "que": "Sple the short sentence above.",
      "A": "Book",
      "B": "Ruler",
      "C": "Pen",
      "D": "Laptop",
    },
  ].obs;

  @override
  void onInit() {
    audioPlayer = AudioPlayer();
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    super.onInit();
    audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
    });
    audioPlayer.onPositionChanged.listen((p) {
      position.value = p;
    });
    initrecorder();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  void playAlbum(String audioUrl) async {
    if (isPlayingAudio.isFalse && currnetSong.value != audioUrl) {
      await audioPlayer.play(UrlSource(audioUrl));
      isPlayingAudio.value = true;
    } else {
      audioPlayer.pause();
      isPlayingAudio.value = false;
    }
    update();
  }

  void seekTo(Duration duration) {
    audioPlayer.seek(duration);
  }

  void playPauseAudio() {
    if (isPlayingAudio.isTrue) {
      audioPlayer.pause();
      isPlayingAudio.value = false;
    } else {
      audioPlayer.resume();
      isPlayingAudio.value = true;
    }
    update();
  }

  Future initrecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granred';
    }
  }
}
