import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/widgets/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../audio_module/widgets/slider_shape.dart';
import '../controller/quiz_controller.dart';

class Question extends StatefulWidget {
  Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  final GlobalController globalController = Get.find();

  final QuizController audioController = Get.put(QuizController());

  final QuizController quize = Get.find();

  final player = AudioPlayer();

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
            bottomNavigationBar: Bottombutton(boxConstraints),
            backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: Get.height / 20,
                        ),
                        appbar(boxConstraints),
                        SizedBox(
                          height: Get.height / 40,
                        ),
                        slider(boxConstraints),
                        SizedBox(
                          height: Get.height / 40,
                        ),
                        quize.quizquestion[quize.i.value]['type'] == "aud"
                            ? audioplayer(boxConstraints)
                            : quize.quizquestion[quize.i.value]['type'] == "rec"
                                ? recorder(boxConstraints)
                                : QuesImage(boxConstraints),
                        SizedBox(
                          height: Get.height / 40,
                        ),
                        puzzelquestion(boxConstraints),
                        SizedBox(
                          height: Get.height / 40,
                        ),
                        quize.quizquestion[quize.i.value]['type'] == "true"
                            ? option(boxConstraints)
                            : quize.quizquestion[quize.i.value]['type'] ==
                                    "puzzel"
                                ? puzzeloption(boxConstraints)
                                : quize.quizquestion[quize.i.value]['type'] ==
                                        "aud"
                                    ? audioption(boxConstraints)
                                    : quize.quizquestion[quize.i.value]
                                                ['type'] ==
                                            "rec"
                                        ? recorderop(boxConstraints)
                                        : quize.quizquestion[quize.i.value]
                                                    ['type'] ==
                                                "chekbox"
                                            ? chekoption(boxConstraints)
                                            : quize.quizquestion[quize.i.value]
                                                        ['type'] ==
                                                    "write"
                                                ? typeoption(boxConstraints)
                                                : option(boxConstraints),
                      ],
                    ),
                  ),
                )),
          ));
    });
  }

  Widget appbar(BoxConstraints boxConstraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${quize.i.value + 1}/${quize.quizquestion.length}",
          style: TextStyle(
              fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
              fontWeight: FontWeight.w600,
              color: AppColor.blackcolor[globalController.dark.value]!),
        ),
        Obx(
          () => Text(
            quize.quizquestion[quize.i.value]['title'],
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
                fontWeight: FontWeight.w600,
                color: AppColor.blackcolor[globalController.dark.value]!),
          ),
        ),
        Icon(Icons.more_vert_outlined,
            color: AppColor.blackcolor[globalController.dark.value]!)
      ],
    );
  }

  Widget slider(BoxConstraints boxConstraints) {
    return LinearPercentIndicator(
      lineHeight: boxConstraints.maxWidth >= AppText.tab ? 30 : 18,
      percent: quize.progress,
      center: Text(
        (quize.progress * 100).toStringAsFixed(0) + "%",
        style: TextStyle(
          color: AppColor.blackcolor[globalController.dark.value]!,
          fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 18,
        ),
      ),
      backgroundColor: Colors.grey.withOpacity(0.2),
      barRadius: Radius.circular(50),
      progressColor: AppColor.primaryColor,
    );
  }

  Widget QuesImage(BoxConstraints boxConstraints) {
    return Container(
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.primaryColor,
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTV9sZfWoFzysxY5HG_m9JEPIIFgpu5ltIR3sIVM9iVwCfOTQKq"))),
    );
  }

  Widget question(BoxConstraints boxConstraints) {
    return Text(
      quize.quizquestion[quize.i.value]['que'],
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColor.blackcolor[globalController.dark.value]!),
    );
  }

  Widget Bottombutton(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width / 8, vertical: Get.height / 80),
      child: InkWell(
        onTap: () {
          quize.questionroue();
        },
        child: Container(
          height: Get.height / 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                    color: AppColor.grey.withOpacity(0.8),
                    offset: const Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 0)
              ],
              color: AppColor.primaryColor),
          child: Center(
            child: Text(
              AppText.Submit[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.whitecolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 26 : 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

//  true false ==============
  Widget option(BoxConstraints boxConstraints) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: Get.height / 6,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              quize.quizquestion[quize.i.value]['A'],
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.whitecolor[globalController.dark.value]!,
                  letterSpacing: 1,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 32 : 20),
            ),
          ),
        )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          height: Get.height / 6,
          decoration: BoxDecoration(
              color: Colors.purpleAccent.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              quize.quizquestion[quize.i.value]['B'],
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.whitecolor[globalController.dark.value]!,
                  letterSpacing: 1,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 32 : 20),
            ),
          ),
        )),
      ],
    );
  }

//  puzzel =======================
  Widget puzzeloption(BoxConstraints boxConstraints) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: Get.height / 15,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quize.quizquestion[quize.i.value]['A'],
                    style: TextStyle(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                  Text(
                    "=",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: Get.height / 15,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quize.quizquestion[quize.i.value]['B'],
                    style: TextStyle(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                  Text(
                    "=",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: Get.height / 15,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quize.quizquestion[quize.i.value]['C'],
                    style: TextStyle(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                  Text(
                    "=",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: Get.height / 15,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quize.quizquestion[quize.i.value]['D'],
                    style: TextStyle(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                  Text(
                    "=",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        letterSpacing: 1,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget puzzelquestion(BoxConstraints boxConstraints) {
    return Text(
      quize.quizquestion[quize.i.value]['que'],
      style: TextStyle(
          fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 20,
          fontWeight: FontWeight.w600,
          color: AppColor.blackcolor[globalController.dark.value]!),
    );
  }

//  chekbox ===================
  Widget chekoption(BoxConstraints boxConstraints) {
    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  if (globalController.selectop.contains("1".obs)) {
                    globalController.selectop.remove("1".obs);
                  } else {
                    globalController.selectop.add("1".obs);
                  }
                },
                child: Container(
                  height: Get.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          quize.quizquestion[quize.i.value]['A'],
                          style: TextStyle(
                              color: AppColor
                                  .whitecolor[globalController.dark.value]!,
                              letterSpacing: 1,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 24
                                  : 18),
                        ),
                        globalController.selectop.contains("1")
                            ? Icon(
                                Icons.add,
                                size: boxConstraints.maxWidth >= AppText.tab
                                    ? 36
                                    : 22,
                                color: AppColor
                                    .whitecolor[globalController.dark.value]!,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  if (globalController.selectop.contains("2".obs)) {
                    globalController.selectop.remove("2".obs);
                  } else {
                    globalController.selectop.add("2".obs);
                  }
                },
                child: Container(
                  height: Get.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          quize.quizquestion[quize.i.value]['B'],
                          style: TextStyle(
                              color: AppColor
                                  .whitecolor[globalController.dark.value]!,
                              letterSpacing: 1,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 24
                                  : 18),
                        ),
                        globalController.selectop.contains("2")
                            ? Icon(
                                Icons.add,
                                size: boxConstraints.maxWidth >= AppText.tab
                                    ? 36
                                    : 22,
                                color: AppColor
                                    .whitecolor[globalController.dark.value]!,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  if (globalController.selectop.contains("3".obs)) {
                    globalController.selectop.remove("3".obs);
                  } else {
                    globalController.selectop.add("3".obs);
                  }
                },
                child: Container(
                  height: Get.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          quize.quizquestion[quize.i.value]['C'],
                          style: TextStyle(
                              color: AppColor
                                  .whitecolor[globalController.dark.value]!,
                              letterSpacing: 1,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 24
                                  : 18),
                        ),
                        globalController.selectop.contains("3")
                            ? Icon(
                                Icons.add,
                                size: boxConstraints.maxWidth >= AppText.tab
                                    ? 36
                                    : 22,
                                color: AppColor
                                    .whitecolor[globalController.dark.value]!,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  if (globalController.selectop.contains("4".obs)) {
                    globalController.selectop.remove("4".obs);
                  } else {
                    globalController.selectop.add("4".obs);
                  }
                },
                child: Container(
                  height: Get.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          quize.quizquestion[quize.i.value]['D'],
                          style: TextStyle(
                              color: AppColor
                                  .whitecolor[globalController.dark.value]!,
                              letterSpacing: 1,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 24
                                  : 18),
                        ),
                        globalController.selectop.contains("4")
                            ? Icon(
                                Icons.add,
                                size: boxConstraints.maxWidth >= AppText.tab
                                    ? 36
                                    : 22,
                                color: AppColor
                                    .whitecolor[globalController.dark.value]!,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

//  pool =========================
  Widget typeoption(BoxConstraints boxConstraints) {
    return textfeild(
        controller: globalController.answer,
        boxConstraints: boxConstraints,
        maxLines: 5,
        icon: false,
        globalController: globalController);
  }

//  audio option ===============
  Widget audioplayer(BoxConstraints boxConstraints) {
    return Container(
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whitecolor[globalController.dark.value]!,
        border: Border.all(color: AppColor.primaryColor, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            InkWell(
              onTap: () async {
                quize.playAlbum(globalController.audio.value);
              },
              child: Icon(
                quize.isPlayingAudio.isFalse
                    ? Icons.play_circle
                    : Icons.pause_circle_filled_outlined,
                color: AppColor.primaryColor,
                size: 80,
              ),
            ),
            Text(
              AppText.plauaudio[globalController.language.value]!,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 18,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
            Spacer(),
            SliderTheme(
              data: SliderThemeData(
                  trackHeight: boxConstraints.maxWidth >= AppText.tab ? 5 : 1.8,
                  thumbColor: AppColor.primaryColor,
                  activeTrackColor: AppColor.primaryColor,
                  overlayShape: SliderComponentShape.noOverlay,
                  trackShape: CustomTrackShape(),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 5),
                  inactiveTrackColor: AppColor
                      .blackcolor[globalController.dark.value]!
                      .withOpacity(0.2)),
              child: Slider(
                value: quize.position.value.inSeconds.toDouble(),
                min: 0.0,
                max: quize.duration.value.inSeconds.toDouble(),
                onChanged: (value) {
                  audioController.seekTo(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(
                      timeInSecond: quize.position.value.inSeconds,
                      boxConstraints: boxConstraints),
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 20 : 14,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  formatTime(
                      timeInSecond: quize.duration.value.inSeconds,
                      boxConstraints: boxConstraints),
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 20 : 14,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatTime(
      {required int timeInSecond, required BoxConstraints boxConstraints}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  Widget audioption(BoxConstraints boxConstraints) {
    return GridView.builder(
        padding: EdgeInsets.only(bottom: Get.height / 80),
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio:
                boxConstraints.maxWidth >= AppText.tab ? 1 / 0.3 : 1 / 0.7),
        itemBuilder: (_, int index) {
          // Color randomColor = _getRandomColor();
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 30, vertical: Get.height / 80),
                child: Center(
                  child: Text(
                    quize.quizquestion[quize.i.value]['A'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.54,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  ),
                ),
              ),
            ),
          );
        });
  }

  //  recorder ===============
  Widget recorder(BoxConstraints boxConstraints) {
    return Container(
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.grey.withOpacity(0.1),
        border: Border.all(color: AppColor.grey.withOpacity(0.5), width: 1),
      ),
      child: Center(
        child: Text(
          "A for Apple, B for Ball, C for Cat",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: boxConstraints.maxWidth >= AppText.tab ? 24 : 18,
              color: AppColor.blackcolor[globalController.dark.value]!),
        ),
      ),
    );
  }

  Widget recorderop(BoxConstraints boxConstraints) {
    return Container(
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whitecolor[globalController.dark.value]!,
        border: Border.all(color: AppColor.primaryColor, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (quize.isRecording.value) {
                  await quize.stopRecording();
                } else {
                  await quize.startRecording();
                }
              },
              child: Icon(
                quize.isRecording.value ? Icons.stop_circle : Icons.mic,
                size: 70,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              quize.isRecording.value
                  ? AppText.inprogress[globalController.language.value]!
                  : AppText.hold[globalController.language.value]!,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 24,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
          ],
        ),
      ),
    );
  }
}
