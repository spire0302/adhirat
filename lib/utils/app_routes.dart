import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/drawer_module/about_us.dart';
import 'package:adhirat/modules/drawer_module/contact_us_screen.dart';
import 'package:adhirat/modules/drawer_module/profile_screen.dart';
import 'package:adhirat/modules/drawer_module/setting_screen.dart';
import 'package:adhirat/modules/drawer_module/share_screen.dart';
import 'package:adhirat/modules/image_module/model/image_model.dart';
import 'package:adhirat/modules/image_module/page/image_detail_screen.dart';
import 'package:adhirat/modules/image_module/page/image_sceen.dart';
import 'package:adhirat/modules/quiz_module/page/quiz_screen.dart';
import 'package:adhirat/modules/video_module/model/video_model.dart';
import 'package:adhirat/modules/video_module/pages/choose_video_category.dart';
import 'package:adhirat/modules/video_module/pages/video_player.dart';
import 'package:adhirat/modules/video_module/pages/video_screen.dart';
import 'package:flutter/material.dart';

import 'package:adhirat/modules/album_module/pages/book_details_screen.dart';
import 'package:adhirat/modules/album_module/pages/book_list_screen.dart';
import 'package:adhirat/modules/album_module/pages/read_book_screen.dart';
import 'package:adhirat/modules/audio_module/pages/audio_detail.dart';
import 'package:adhirat/modules/audio_module/pages/audio_screen.dart';
import 'package:adhirat/modules/auth_module/pages/forgot_password.dart';
import 'package:adhirat/modules/auth_module/pages/login.dart';
import 'package:adhirat/modules/auth_module/pages/reset_password.dart';
import 'package:adhirat/modules/dashboard/pages/dashboard.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:get/get.dart';
import '../modules/dashboard/pages/ebook/album_screen.dart';
import '../modules/auth_module/pages/register.dart';
import '../modules/auth_module/pages/splash.dart';
import '../modules/drawer_module/privacy_policy_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final GlobalController globalController = Get.find();

    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteString.SPLASH_SCREEN:
          return const SplashScreen();
        case RouteString.LOGIN_SCREEN:
          return const LoginScreen();
        case RouteString.REGISTER_SCREEN:
          return const RegisterScreen();
        case RouteString.FOEROT_SCREEN:
          return ForgotPassword();
        case RouteString.RESET_PASSWORD:
          return ResetPasswordScreen();
        case RouteString.DASHBOARD:
          return DashBoadScreen();
        case RouteString.EBOOK_SCREEN:
          args as bool;
          return AlbumScreen(landscape: args);
        case RouteString.BOOK_DETAILS:
          return BookDetailscreen(
            globalController: globalController,
          );
        case RouteString.BOOK_LIST:
          args as GlobalController;
          return BookList(globalController: args);
        case RouteString.AUDIO_BOOK_DETAILS:
          return const AlbumDetailsScreen();
        case RouteString.AUDIO_SCREEN:
          return AudioScreen();
        case RouteString.READ_BOOK:
          return const ReadBookScereen();
        case RouteString.PROFILE_SCREEN:
          return const ProfileScreen();
        case RouteString.CONTACT_US_SCREEN:
          return const ContactUsScreen();
        case RouteString.ABOUT_US_SCREEN:
          return const AboutUsScreen();
        case RouteString.SETTING_US_SCREEN:
          return const SettingScreen();
        case RouteString.PRIVACY_POLICY_SCREEN:
          return const PrivacyPolicyScreen();
        case RouteString.SHARE_SCREEN:
          return const ShareScreen();
        case RouteString.CHOOSE_VIDEO_CATEGORY:
          return ChooseVideoCategoryScreen();
        case RouteString.VIDEO_SCREEN:
          return const VideoScreen();
        case RouteString.VIDEO_PLAYER:
          args as VideoModel;
          return VideoPlayerScreen(video: args);
        case RouteString.IMAGE_SCREEN:
          return ImageScreen();
        case RouteString.IMAGE_DETAILS:
          args as ImageModel;
          return ImageDetailScreen(imageDetails: args);
        case RouteString.QUIZ_SCREEN:
          return QuizScreen();
        default:
          return const SplashScreen();
      }
    });
  }
}
