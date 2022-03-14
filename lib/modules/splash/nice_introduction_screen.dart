import 'package:flutter/material.dart';
import 'package:my_cab/Language/appLocalizations.dart';
import 'package:my_cab/constance/constance.dart';
import 'package:my_cab/constance/global.dart' as globals;
import 'package:my_cab/constance/themes.dart';
import 'package:my_cab/modules/auth/login_screen.dart';

class NiceIntroductionScreen extends StatefulWidget {
  @override
  _NiceIntroductionScreenState createState() => _NiceIntroductionScreenState();
}

class _NiceIntroductionScreenState extends State<NiceIntroductionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController..forward();
  }

  @override
  Widget build(BuildContext context) {
    globals.locale = Localizations.localeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ClipRect(
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Transform(
                            transform: new Matrix4.translationValues(
                                0.0,
                                160 *
                                        (1.0 -
                                            (AlwaysStoppedAnimation(Tween(
                                                            begin: 0.4,
                                                            end: 1.0)
                                                        .animate(CurvedAnimation(
                                                            parent:
                                                                animationController,
                                                            curve: Curves
                                                                .fastOutSlowIn)))
                                                    .value)
                                                .value) -
                                    16,
                                0.0),
                            child: Image.asset(
                              ConstanceData.buildingImageBack,
                              color: HexColor("#FFB8B8"),
                            ),
                          ),
                          Transform(
                            transform: new Matrix4.translationValues(
                                0.0,
                                160 *
                                    (1.0 -
                                        (AlwaysStoppedAnimation(Tween(
                                                        begin: 0.8, end: 1.0)
                                                    .animate(CurvedAnimation(
                                                        parent:
                                                            animationController,
                                                        curve: Curves
                                                            .fastOutSlowIn)))
                                                .value)
                                            .value),
                                0.0),
                            child: Image.asset(
                              ConstanceData.buildingImage,
                              color: HexColor("#FF8B8B"),
                            ),
                          ),
                          SizedBox(
                            width: 240,
                            child: Image.asset(
                              ConstanceData.carImage,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of('Hi, nice to meet you!'),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(
                              'Choose your location to start to find\nrestaurants around you.'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 8, top: 8),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Theme.of(context).dividerColor,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24.0)),
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.near_me,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      AppLocalizations.of(
                                          'Use current location'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
