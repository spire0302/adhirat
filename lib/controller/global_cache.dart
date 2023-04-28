import 'package:adhirat/utils/app_text.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxString language = AppText.eng.obs;
  RxBool otpSend = false.obs;
  RxBool privacyPolicy = false.obs;
  RxInt bottombarIndex = 0.obs;
  RxInt currentImg = 0.obs;
  RxInt selectedCategory = (-1).obs;

  void sendOtpFunction() {
    otpSend.value = true;
    update();
  }

  void acceptPrivacyPolicy(value) {
    privacyPolicy.value = value;
    update();
  }

  void setBottomIndex(int index) {
    bottombarIndex.value = index;
    update();
  }

  void selectCategoryFun(int index) {
    selectedCategory.value = index;
    update();
  }

  void onchangeImage(int index) {
    currentImg.value = index;
    update();
  }
}
