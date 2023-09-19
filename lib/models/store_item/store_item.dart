import 'package:uni_store/common_libs.dart';

class StoreItem {
  final String logo;
  final String name;
  final double discount;
  final String description;
  final String specifications;
  final double price;
  final String id;

  final List<StoreVariety> varieties;

  StoreItem(
      {required this.logo,
      required this.id,
      required this.name,
      required this.discount,
      required this.description,
      required this.specifications,
      required this.price,
      required this.varieties});
}

class StoreVariety {
  final String image;
  final Color backgroundColor;
  final Color textColor;
  final Color discountColor;
  final List<Color> gradientColors;

  StoreVariety({
    required this.image,
    required this.backgroundColor,
    required this.discountColor,
    required this.textColor,
    required this.gradientColors,
  });
}

List<StoreItem> storeModel = [
  StoreItem(
    logo: ppspLogo,
    id: 'ppsp',
    name: 'Sony \nPlaystation 4',
    discount: 10,
    description:
        "The Sony PlayStation 4 is a gaming powerhouse that takes you on epic adventures and virtual quests, making you forget about the real world (and responsibilities) in the most thrilling way possible. It's your ticket to a realm of excitement, where you can battle mythical creatures, score mind-blowing goals, and unleash your inner gaming hero.",
    specifications: '1TB',
    price: 899,
    varieties: [
      StoreVariety(
        image: ppspBlack,
        backgroundColor: const Color(0xFF56565E),
        textColor: kLightColor,
        discountColor: const Color(0xFFFFC58D),
        gradientColors: [
          const Color(0xFF676771),
          const Color(0xFF78787E),
          const Color(0xFF89898F),
          const Color(0xFF9A9A9D),
        ],
      ),
      StoreVariety(
          image: ppspWhite,
          backgroundColor: const Color(0xFFEDEEEE),
          textColor: kDarkColor,
          discountColor: const Color(0xFFAA336A),
          gradientColors: [
            const Color(0xFFD2D3D4),
            const Color(0xFFB5B6B7),
            const Color(0xFF98999A),
            const Color(0xFF7B7C7D),
          ]),
    ],
  ),
  StoreItem(
    logo: appleLogo,
    id: 'apple',
    name: 'Apple \niPhone XR',
    discount: 10,
    description:
        "The iPhone XR is the life of the party, with its bold colors and energetic personality. It's like having a pocket-sized disco ball that can also make calls and take amazing photos.",
    specifications: '128GB',
    price: 799,
    varieties: [
      StoreVariety(
          image: iphoneXrRed,
          backgroundColor: const Color(0xFFEB4D58),
          textColor: kLightColor,
          discountColor: const Color(0xFFFFDF00),
          gradientColors: [
            const Color(0xFFE56C6F),
            const Color(0xFFEC8A8E),
            const Color(0xFFF3A8AB),
            const Color(0xFFFAAFC9),
          ]),
      StoreVariety(
          image: iphoneXrWhite,
          backgroundColor: const Color(0xFFF7F7F7),
          discountColor: const Color(0xFF9400d3),
          textColor: kDarkColor,
          gradientColors: [
            const Color(0xFFE9E9E9),
            const Color(0xFFDADADA),
            const Color(0xFFCBCBCB),
            const Color(0xFFBCBCBC),
          ]),
    ],
  ),
  StoreItem(
    logo: ppspLogo,
    id: 'pads',
    name: 'PlayStation \nDualShock 4',
    discount: 10,
    description:
        "The PlayStation pad: your gaming wand! Buttons, joysticks, and epic adventures await. Get ready for fun!",
    specifications: '162mm x 52mm x 98mm',
    price: 719,
    varieties: [
      StoreVariety(
          image: gamepadWhite,
          backgroundColor: const Color(0xFFE4E2E1),
          textColor: kDarkColor,
          discountColor: const Color(0xFF9400d3),
          gradientColors: [
            const Color(0xFFD6D4D3),
            const Color(0xFFC8C6C5),
            const Color(0xFFBAB8B7),
            const Color(0xFFACAAA9),
          ]),
      StoreVariety(
          image: gamepadGrey,
          backgroundColor: const Color(0xFF282828),
          textColor: kLightColor,
          discountColor: const Color(0xFFFFC58D),
          gradientColors: [
            const Color(0xFF383838),
            const Color(0xFF494949),
            const Color(0xFF595959),
            const Color(0xFF6A6A6A),
          ]),
      StoreVariety(
          image: gamepadRed,
          backgroundColor: const Color(0xFFAF2F29),
          discountColor: const Color(0xFFFFDF00),
          textColor: kLightColor,
          gradientColors: [
            const Color(0xFFC63C37),
            const Color(0xFFDD523E),
            const Color(0xFFE96A4C),
            const Color(0xFFF2815A),
          ]),
      StoreVariety(
          image: gamepadBlack,
          backgroundColor: const Color(0xFF3F4147),
          discountColor: const Color(0xFFFFDF00),
          textColor: kLightColor,
          gradientColors: [
            const Color(0xFF4D4F58),
            const Color(0xFF5C5E68),
            const Color(0xFF6B6D78),
            const Color(0xFF7A7C88),
          ]),
    ],
  ),
  StoreItem(
    logo: boomboxLogo,
    id: 'boombox',
    name: 'Beats \nElectronics LLC',
    discount: 20,
    description:
        "Beat by Dr. Dre: Your personal concert, anytime, anywhere! These headsets deliver killer sound with noise-canceling tech and all-day comfort. Get ready to rock your world! ",
    specifications: 'Studio3 Wireless',
    price: 899,
    varieties: [
      StoreVariety(
          image: boomboxBlue,
          backgroundColor: const Color(0xFF2670C4),
          textColor: kLightColor,
          discountColor: const Color(0xFFFF5E0E),
          gradientColors: [
            const Color(0xFF3680D1),
            const Color(0xFF4690DD),
            const Color(0xFF56A0E9),
            const Color(0xFF66B0F5),
          ]),
      StoreVariety(
          image: boomboxGreen,
          backgroundColor: const Color(0xFFA39E95),
          textColor: kDarkColor,
          discountColor: const Color(0xFFFFDF00),
          gradientColors: [
            const Color(0xFFB2ADA4),
            const Color(0xFFC1BCB3),
            const Color(0xFFD0CAC2),
            const Color(0xFFDFD9D1),
          ]),
      StoreVariety(
          image: boomboxRed,
          backgroundColor: const Color(0xFFD23938),
          textColor: kLightColor,
          discountColor: const Color(0xFFFFDF00),
          gradientColors: [
            const Color(0xFFE04A49),
            const Color(0xFFEA5B58),
            const Color(0xFFF36C67),
            const Color(0xFFFD7D76),
          ]),
      StoreVariety(
          image: boomboxWhite,
          backgroundColor: const Color(0xFFE6E6E6),
          textColor: kDarkColor,
          discountColor: const Color(0xFF9400d3),
          gradientColors: [
            const Color(0xFFF0F0F0),
            const Color(0xFFFAFAFA),
            const Color(0xFFFFFFFF),
            const Color(0xFFE9E9E9),
          ]),
    ],
  ),
  StoreItem(
    logo: appleLogo,
    id: 'airpod',
    name: 'Apple \nAirPods Max',
    discount: 10,
    description:
        "The Apple AirPods Pro are like tiny wizards for your ears, casting a spell of immersive sound and noise cancellation. With their sleek design and customizable fit, they transport you to a world where music sounds better, calls are crystal clear, and you can even control your tunes with a magical tap.",
    specifications: 'Bluetooth 5.0',
    price: 799,
    varieties: [
      StoreVariety(
          image: airpodBlack,
          backgroundColor: const Color(0xFF565656),
          discountColor: const Color(0xFFFFDF00),
          textColor: kLightColor,
          gradientColors: [
            const Color(0xFF6D6D6D),
            const Color(0xFF848484),
            const Color(0xFF9B9B9B),
            const Color(0xFFB2B2B2),
          ]),
      StoreVariety(
          image: airpodBlue,
          backgroundColor: const Color(0xFF0F53AF),
          discountColor: const Color(0xFFFFDF00),
          textColor: kLightColor,
          gradientColors: [
            const Color(0xFF1F66C3),
            const Color(0xFF3080D8),
            const Color(0xFF409AE3),
            const Color(0xFF50B4EE),
          ]),
      StoreVariety(
          image: airpodWhite,
          backgroundColor: const Color(0xFFF9FAFD),
          textColor: kDarkColor,
          discountColor: const Color(0xFF9400d3),
          gradientColors: [
            const Color(0xFFE2E4EB),
            const Color(0xFFCBE0F9),
            const Color(0xFFB4D7F7),
            const Color(0xFF9DCEF6),
          ]),
    ],
  ),
];
