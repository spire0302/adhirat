import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/utils/route_string.dart';

class ImgList {
  final Map title;
  final String customImg;
  final String route;

  ImgList({
    required this.title,
    required this.customImg,
    required this.route,
  });
}

List<ImgList> conList = [
  ImgList(
    title: AppText.eBook,
    customImg: AppImages.ebookIcon,
    route: RouteString.EBOOK_SCREEN,
  ),
  ImgList(
      title: AppText.audio,
      customImg: AppImages.musicIcon,
      route: RouteString.AUDIO_SCREEN),
  ImgList(
      title: AppText.video,
      customImg: AppImages.videoIcon,
      route: RouteString.CHOOSE_VIDEO_CATEGORY),
  ImgList(
      title: AppText.image,
      customImg: AppImages.imageIcon,
      route: RouteString.IMAGE_SCREEN),
  ImgList(
      title: AppText.quizzes,
      customImg: AppImages.quizzesIcon,
      route: RouteString.QUIZ_SCREEN),
  ImgList(
      title: AppText.sadhanaCard,
      customImg: AppImages.sadhnaIcon,
      route: "recevipayment"),
  ImgList(
      title: AppText.eventCalendar,
      customImg: AppImages.eventCalenderIcon,
      route: "new_bill_payment_page"),
  ImgList(
      title: AppText.eStore,
      customImg: AppImages.eStoreIcon,
      route: "history_page"),
];
