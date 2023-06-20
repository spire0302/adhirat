import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:adhirat/utils/app_text.dart';
import '../modules/album_module/model/book_model.dart';

class GlobalController extends GetxController {
  RxString language = AppText.eng.obs;
  RxBool dark = AppColor.light.obs;

  TextEditingController answer = TextEditingController();
  List<dynamic> selectop = [].obs;
  Map sadhnadata = {}.obs;

  RxString sadhnatime = "".obs;
  RxString type = "true".obs;
  RxBool otpSend = false.obs;
  RxBool addToCollection = false.obs;
  RxBool likeBook = false.obs;
  RxBool readMoreDesc = false.obs;
  RxBool privacyPolicy = false.obs;
  RxInt bottombarIndex = 0.obs;
  RxInt currentImg = 0.obs;
  RxInt dashindex = 0.obs;

  RxInt Quant = 1.obs;
  RxString audio =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3".obs;

  RxInt selectedCategory = 0.obs;

  RxInt selectfilter = 0.obs;

  @override
  RxList likedChapterList = [].obs;
  RxList filterlist = ["All", "Monstera", "Alom", "Palm", "Yucau"].obs;
  RxInt selectedadd = 0.obs;
  RxInt selectarti = 0.obs;
  RxInt selectshipping = 0.obs;
  RxInt selectpayment = 0.obs;
  RxList address = [
    {
      "id": 0,
      "name": "Home",
      "address": "A-265 yogeshwar park nana varachha mota varachha surat",
    },
    {
      "id": 1,
      "name": "Office",
      "address": "A-265 yogeshwar park nana varachha mota varachha surat",
    },
    {
      "id": 2,
      "name": "Apartment",
      "address": "A-265 yogeshwar park nana varachha mota varachha surat",
    },
    {
      "id": 3,
      "name": "Parent's House",
      "address": "A-265 yogeshwar park nana varachha mota varachha surat",
    },
  ].obs;

  RxList paylist = [
    {"image": "assets/icons/wallet.png", "name": "My Wallet", "id": 0},
    {"image": "assets/icons/paypal.png", "name": "PayPal", "id": 1},
    {"image": "assets/icons/google.png", "name": "Google Pay", "id": 2},
    {"image": "assets/icons/apple.png", "name": "Apple Pay", "id": 3},
    {"image": "assets/icons/mastercard.png", "name": "Master Card", "id": 4},
  ].obs;
  RxList shipping = [
    {
      "id": 0,
      "name": "Economy",
      "address": "Estimeted arrival, Dec 20-23",
    },
    {
      "id": 1,
      "name": "Regular",
      "address": "Estimeted arrival, Dec 20-22",
    },
    {
      "id": 2,
      "name": "Cargo",
      "address": "Estimeted arrival, Dec 19-20",
    },
    {
      "id": 3,
      "name": "Express",
      "address": "Estimeted arrival, Dec 18-19",
    },
  ].obs;
  RxList cartlist = [
    {
      "name": "Prayer Plant",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0kBybqkFKvgBnsxB7Oc80Yxtuf7ZZYPIUU0N-Jt6VBaUOy4__",
      "prise": "\$99"
    },
    {
      "name": "Rubber Fig Plant",
      "image":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZjThpo2TBRTZHCm3Ik2iE7Fdk6TFpKd-Tu3pTMT4obheswatK",
      "prise": "\$12"
    },
    {
      "name": "ZZ plant",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0kBybqkFKvgBnsxB7Oc80Yxtuf7ZZYPIUU0N-Jt6VBaUOy4__",
      "prise": "\$22"
    },
    {
      "name": "Artical Cectus",
      "image":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZjThpo2TBRTZHCm3Ik2iE7Fdk6TFpKd-Tu3pTMT4obheswatK",
      "prise": "\$79"
    },
    {
      "name": "Rubber Fig Plant",
      "image":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZjThpo2TBRTZHCm3Ik2iE7Fdk6TFpKd-Tu3pTMT4obheswatK",
      "prise": "\$32"
    },
    {
      "name": "Artical Cectus",
      "image":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZjThpo2TBRTZHCm3Ik2iE7Fdk6TFpKd-Tu3pTMT4obheswatK",
      "prise": "\$22"
    },
  ].obs;

  List<BookModel> get bookList => _bookList;

  void addquent() {
    Quant.value++;
  }

  void removeque() {
    if (Quant.value > 1) {
      Quant.value--;
    }
  }

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

  void showMoreTextFunc() {
    readMoreDesc.value = !readMoreDesc.value;
    update();
  }

  void likeBookFun() {
    likeBook.value = !likeBook.value;
    update();
  }

  void addTCollectionFun() {
    addToCollection.value = !addToCollection.value;
    update();
  }

  void likeChapterFun(int index) {
    if (likedChapterList.contains(index)) {
      likedChapterList.remove(index);
    } else {
      likedChapterList.add(index);
    }
    update();
  }

  final List<BookModel> _bookList = [
    BookModel(
        id: 1,
        bookName: 'Adhyatma Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image: "assets/images/demobook.png"),
    BookModel(
        id: 2,
        bookName: 'Vasistha Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki. ',
        image:
            "https://i0.wp.com/www.grs.com.sg/wp-content/uploads/2016/02/Ramayana.png?fit=300%2C470"),
    BookModel(
        id: 3,
        bookName: 'Ananda Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image: "https://m.media-amazon.com/images/I/91GuzI72mjL.jpg"),
    BookModel(
        id: 4,
        bookName: 'Agastya Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image: "https://m.media-amazon.com/images/I/618gwNcGedL.jpg"),
    BookModel(
        id: 5,
        bookName: 'Adbhuta Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6-XCxMW5egdOIHt38WlILvJCLhRb8zLwOREwaz-vn9gLY85Us_U2LaQwofsvdX8LtaR9UaOFWDxg&usqp=CAU&ec=48600113"),
    BookModel(
        id: 6,
        bookName: 'Mahabharata',
        authorName: "Vyasa",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2_Qw1OPTtMOWhNtXV3fNqjvzPB9Ux6YGkXyBxz4_tMDry0VPS02SOwqwP862SUHFqwYc9YXw408&usqp=CAU&ec=48600113"),
    BookModel(
        id: 7,
        bookName: 'Mahabharata',
        authorName: "Vyasa",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2_Qw1OPTtMOWhNtXV3fNqjvzPB9Ux6YGkXyBxz4_tMDry0VPS02SOwqwP862SUHFqwYc9YXw408&usqp=CAU&ec=48600113"),
    BookModel(
        id: 8,
        bookName: 'Mahabharata',
        authorName: "Vyasa",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2_Qw1OPTtMOWhNtXV3fNqjvzPB9Ux6YGkXyBxz4_tMDry0VPS02SOwqwP862SUHFqwYc9YXw408&usqp=CAU&ec=48600113"),
    BookModel(
        id: 9,
        bookName: 'Mahabharata',
        authorName: "Vyasa",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2_Qw1OPTtMOWhNtXV3fNqjvzPB9Ux6YGkXyBxz4_tMDry0VPS02SOwqwP862SUHFqwYc9YXw408&usqp=CAU&ec=48600113"),
    BookModel(
        id: 10,
        bookName: 'Mahabharata',
        authorName: "Vyasa",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2_Qw1OPTtMOWhNtXV3fNqjvzPB9Ux6YGkXyBxz4_tMDry0VPS02SOwqwP862SUHFqwYc9YXw408&usqp=CAU&ec=48600113"),
    BookModel(
        id: 11,
        bookName: 'Mahabharata',
        authorName: "Vyasa",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE. A Times of India report dated 18 December 2015 informs about the discovery of a 6th-century manuscript of the Ramayana at the Asiatic Society library, Kolkata.\n\n There has been discussion as to whether the first and the last volumes (Bala Kanda and Uttara Kanda) of Valmiki\'s Ramayana were composed by the original author. The uttarākāṇḍa, the bālakāṇḍa, although frequently counted among the main ones, is not a part of the original epic. Though Balakanda is sometimes considered in the main epic, according to many Uttarakanda is certainly a later interpolation and thus is not attributed to the work of Maharshi Valmiki.',
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR2_Qw1OPTtMOWhNtXV3fNqjvzPB9Ux6YGkXyBxz4_tMDry0VPS02SOwqwP862SUHFqwYc9YXw408&usqp=CAU&ec=48600113"),
  ];
}
