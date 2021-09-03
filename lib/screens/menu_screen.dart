import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_cards_animation/constants.dart';
import 'package:starbucks_cards_animation/models/drink.dart';
import 'package:blur/blur.dart';
import 'package:starbucks_cards_animation/widgets/cups.dart';
import 'package:starbucks_cards_animation/widgets/custom_rich-text.dart';
import 'package:starbucks_cards_animation/widgets/ritch_text.dart';
import 'package:starbucks_cards_animation/widgets/show_modal.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key}) : super(key: key);

  static String routeName = "menu";

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  PageController _pageController = PageController(viewportFraction: 0.8);
  double? _currentIndex = 0.0;

  AnimationController? _animController;

  Animation<Offset>? _logoTranslate;
  Animation<double>? _scaleLogo;
  Animation<Offset>? _leftBarTranslate;
  Animation<Offset>? _rightBarTranslate;
  Animation<Offset>? _pageViewTranslate;


  void _liestenable() {
    setState(() {
      _currentIndex = _pageController.page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_liestenable);
  }

  @override
  void didChangeDependencies() {
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    final Size size = MediaQuery.of(context).size;
    _logoTranslate = Tween<Offset>(
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, size.height / 2 - size.height * 0.075))
        .animate(
      CurvedAnimation(
        parent: _animController!,
        curve: Curves.easeInOut,
      ),
    );
    _scaleLogo = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _animController!,
        curve: Curves.easeInOut,
      ),
    );
    _leftBarTranslate =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-200.0, 0.0))
            .animate(
      CurvedAnimation(parent: _animController!, curve: Curves.easeInOut),
    );
    _rightBarTranslate =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(200.0, 0.0)).animate(
      CurvedAnimation(parent: _animController!, curve: Curves.easeInOut),
    );
    _pageViewTranslate =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(600.0, 0.0)).animate(
            CurvedAnimation(parent: _animController!, curve: Curves.easeInOut));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.removeListener(_liestenable);
    _animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: size.height - size.height * 0.15,
            child: AnimatedBuilder(
                animation: _animController!,
                builder: (context, child) {
                  return PageView.builder(
                    controller: _pageController,
                    physics: BouncingScrollPhysics(),
                    itemCount: Drink.drinks.length,
                    itemBuilder: (context, index) {
                      final percent = (_currentIndex! - index);
                      final value = percent.clamp(0.0, 0.3);
                      return Transform(
                        transform: Matrix4.identity()
                          ..translate(_pageViewTranslate!.value.dx, 0.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding,
                                ),
                                child: CustomRichText(
                                  text: Drink.drinks[index].name,
                                  color: Drink.drinks[index].color,
                                ),
                              ),
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right: kDefaultPadding,
                                            left: kDefaultPadding / 2,
                                            bottom: kDefaultPadding * 3),
                                        child: Blur(
                                          blur: 8,
                                          colorOpacity: 0.7,
                                          blurColor: Drink.drinks[index].color,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          alignment: Alignment.topLeft,
                                          overlay: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: kDefaultPadding,
                                              horizontal: kDefaultPadding,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Drink.drinks[index].title,
                                                  style: GoogleFonts.lato(
                                                      color: kWhiteColor,
                                                      fontSize: 32.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 20.0),
                                                Text(
                                                  Drink.drinks[index].text,
                                                  style: GoogleFonts.lato(
                                                    color: kWhiteColor,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                                Spacer(),
                                                CupsRow(),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          kDefaultPadding,
                                                      vertical:
                                                          kDefaultPadding / 2),
                                                  width: constraints.maxWidth,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            39),
                                                    color: kPrimaryColor,
                                                  ),
                                                  child:
                                                      CustomDisplayDoubleNumber(
                                                          number: Drink
                                                              .drinks[index]
                                                              .price),
                                                ),
                                              ],
                                            ),
                                          ),
                                          child: Image.asset(
                                            Drink.drinks[index]
                                                .assetBackgroundName,
                                            height: constraints.maxHeight,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: constraints.maxWidth * 0.035,
                                        height: constraints.maxHeight * 0.82,
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.identity()
                                            ..rotateZ(math.pi / 4 * value)
                                            ..scale(1 - value),
                                          child: Image.asset(Drink
                                            .drinks[index]
                                            .assetName)),
                                          ),
                                      Positioned(
                                        top: -kDefaultPadding * 1.5,
                                        left: constraints.maxWidth * 0.3,
                                        height: constraints.maxHeight * 0.14,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..translate(
                                                -value * constraints.maxWidth,
                                                0.0),
                                          child: Image.asset(
                                            Drink.drinks[index].assetsTRB[0],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: constraints.maxHeight * 0.25,
                                        right: -constraints.maxHeight * 0.02,
                                        height: constraints.maxHeight * 0.12,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..translate(
                                                -value * constraints.maxWidth,
                                                0.0),
                                          child: Image.asset(
                                              Drink.drinks[index].assetsTRB[1]),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: kDefaultPadding / 2,
                                        left: constraints.maxWidth * 0.35,
                                        height: constraints.maxHeight * 0.2,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..translate(
                                                -value * constraints.maxWidth,
                                                0.0),
                                          child: Image.asset(
                                              Drink.drinks[index].assetsTRB[2]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
          Positioned(
            top: 0,
            left: kDefaultPadding,
            right: kDefaultPadding,
            height: size.height * 0.15,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  kDefaultPadding / 2,
                  0,
                  0,
                ),
                child: AnimatedBuilder(
                  animation: _animController!,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(_leftBarTranslate!.value.dx, 0.0),
                          child: Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: kPrimaryColor,
                            size: 24,
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(_rightBarTranslate!.value.dx, 0.0),
                          child: Image.asset(
                            "assets/images/menu_icon.png",
                            height: 22,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.075 - size.height * 0.06 + kDefaultPadding / 2,
            left: size.width / 2 - size.height * 0.06,
            child: AnimatedBuilder(
              animation: _animController!,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(0.0, _logoTranslate!.value.dy)
                    ..scale(_scaleLogo!.value),
                  child: GestureDetector(
                    onTap: () {
                      if (_animController!.isDismissed) {
                        _animController!.forward();
                      }
                      if (_animController!.isCompleted) {
                        _animController!.reverse();
                      }
                    },
                    child: Image.asset(
                      "assets/images/starbucks_logo.png",
                      height: size.height * 0.12,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
