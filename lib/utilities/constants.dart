import 'package:flutter/material.dart';

//COLORS
const Color kTabBarColor = Color(0xFF20242F);
const Color kCardColor = Color(0xFF242A38);
const Color kScaffoldBackgroundColor = Color(0xFF242A38);
const Color kInactiveTabBarIconColor = Color(0xFF4F5A6C);
const Color kActiveTabBarIconColor = Color(0xFFECAC46);
const Color kIntroTitleDarkModeTextColor = Color(0xFFF0F1F2);
const Color kIntroTitleTextColor = Colors.black;
const Color kSubtitleTextColor = Colors.white54;
const Color kHashTagTextColor = Color(0xFFECAC46);
const Color kUnselectedSlidingTabColor = Colors.white10;

//GRADIENT BUTTON COLORS
const Color kFairestShade = Color(0xFFFAD05C);
const Color kFairShade = Color(0xFFF7C252);
const Color kMidShade = Color(0xFFF8B349);
const Color kNormalShade = Color(0xFFF9A13E);
const Color kDeepShade = Color(0xFFF8A03F);
const Color kDeepestShade = Color(0xFFF77720);

//GRADIENT BUTTON TEXTSTYLE
const TextStyle kGradientButtonText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.white);

//FONT-STYLES
const double kIntroTitleFontSize = 35.0;
const FontWeight kIntroTitleFontWeight = FontWeight.bold;

//TEXTSTYLES
const TextStyle kDefaultBodyTextStyle = TextStyle(fontFamily: 'Quicksand');
const TextStyle kSubtitleTextStyle = TextStyle(fontFamily: 'Quicksand', color: kSubtitleTextColor);
const TextStyle kIntroTitleDarkModeTextStyle = TextStyle(fontSize: kIntroTitleFontSize, fontWeight: kIntroTitleFontWeight, color: kIntroTitleDarkModeTextColor);
const TextStyle kIntroTitleTextStyle = TextStyle(fontSize: kIntroTitleFontSize, fontWeight: kIntroTitleFontWeight, color: kIntroTitleTextColor);
const TextStyle kHashTagTextStyle = TextStyle(color: kHashTagTextColor);
const TextStyle kLandingPageTitleTextStyle = TextStyle(fontSize: 45.0, fontWeight: FontWeight.w700, color: Colors.white);
const TextStyle kCategoryTitle = TextStyle(fontSize: 35.0, fontWeight: FontWeight.w700);


//CUSTOM PADDING
const EdgeInsets kCardPadding = EdgeInsets.symmetric(horizontal: 15.0);

//CUSTOM SPACING
const SizedBox kSmallHeight = SizedBox(height: 5.0);
const SizedBox kMediumHeight = SizedBox(height: 15.0);
const SizedBox kLargeHeight = SizedBox(height: 25.0);

//BOX DECORATION
const BoxDecoration kLandingPageBackground = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/landing-bg.jpg'),
    fit: BoxFit.cover
  ),
);
const BoxDecoration kLoginPageBackground = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/login-bg.jpg'),
    fit: BoxFit.cover
  )
);


//SLIDING TABBAR STYLES
const TextStyle kSlidingTabSelectedText = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700);
const TextStyle kSlidingTabUnselectedText = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700, color: kUnselectedSlidingTabColor);