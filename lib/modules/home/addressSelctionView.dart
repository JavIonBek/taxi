import 'package:flutter/material.dart';
import 'package:my_cab/Language/appLocalizations.dart';
import 'package:my_cab/constance/constance.dart';
import 'package:my_cab/modules/home/locationButton.dart';

List<String> notes = [
  AppLocalizations.of('New Market'),
  AppLocalizations.of('9-Market'),
  AppLocalizations.of('Sunrise'),
  AppLocalizations.of('Flower Market'),
  AppLocalizations.of('Old City'),
];

class AddressSelctionView extends StatelessWidget {
  final AnimationController animationController;
  final bool isUp, isSerchMode;
  final Function(bool) onUp, onSerchMode;
  final TextEditingController serachController;
  final VoidCallback mapCallBack, gpsClick;

  const AddressSelctionView(
      { key,
      required this.animationController,
      required this.isUp,
      required this.onUp,
      required this.isSerchMode,
      required this.onSerchMode,
      required this.serachController,
      required this.mapCallBack,
      required this.gpsClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(),
            ),
            LocationButtonView(
              gpsClick: () {
                gpsClick();
              },
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: new Matrix4.translationValues(
                  0.0,
                  100 +
                      (((MediaQuery.of(context).size.height - 220) )) *
                          ((AlwaysStoppedAnimation(
                                      Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn)))
                                  .value)
                              .value),
                  0.0),
              child: Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onVerticalDragUpdate: (DragUpdateDetails gragEndDetails) {
                        if (gragEndDetails.delta.dy > 0) {
                          onUp(false);
                        } else if (gragEndDetails.delta.dy < 0) {
                          onUp(true);
                        }
                        final position = gragEndDetails.globalPosition.dy
                                .clamp(0, (MediaQuery.of(context).size.height - 220) + MediaQuery.of(context).padding.bottom) +
                            36 +
                            gragEndDetails.delta.dy;
                        final animatedPostion =
                            (position - 100) / ((MediaQuery.of(context).size.height - 220) + MediaQuery.of(context).padding.bottom);
                        animationController.animateTo(animatedPostion, duration: Duration(milliseconds: 0));
                      },
                      onVerticalDragEnd: (DragEndDetails gragEndDetails) {
                        if (isUp) {
                          onSerchMode(true);
                          animationController.animateTo(0, duration: Duration(milliseconds: 240));
                        } else {
                          onSerchMode(false);
                          animationController.animateTo(1, duration: Duration(milliseconds: 240));
                        }
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Theme.of(context).cardColor,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).disabledColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 4,
                                    width: 48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).cardColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 24, height: 24, child: Image.asset(ConstanceData.startPin)),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8, left: 4, right: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(AppLocalizations.of('Pickup'), style: Theme.of(context).textTheme.caption),
                                          Text(
                                            AppLocalizations.of('My current location'),
                                            maxLines: 1,
                                            style: Theme.of(context).textTheme.subtitle2,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            endIndent: 8,
                            indent: 8,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 24, height: 24, child: Image.asset(ConstanceData.endPin)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4, top: 8, bottom: 8, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(AppLocalizations.of('Drop-off'), style: Theme.of(context).textTheme.caption),
                                  SizedBox(
                                    height: 24,
                                    child: TextField(
                                      maxLines: 1,
                                      style: Theme.of(context).textTheme.subtitle2,
                                      onChanged: (String txt) {},
                                      controller: serachController,
                                      enabled: isSerchMode,
                                      cursorColor: Theme.of(context).primaryColor,
                                      decoration: new InputDecoration(
                                        errorText: null,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Theme.of(context).disabledColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    if (isSerchMode) {
                                      onSerchMode(false);
                                      animationController.animateTo(1, duration: Duration(milliseconds: 240));
                                    } else {
                                      onSerchMode(true);
                                      animationController.animateTo(0, duration: Duration(milliseconds: 240));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      isSerchMode ? Icons.close : Icons.search,
                                      color: Theme.of(context).textTheme.headline6!.color,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 24,
                                  width: 1,
                                  color: Theme.of(context).dividerColor,
                                ),
                                InkWell(
                                  onTap: () {
                                    mapCallBack();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.map,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 1 - animationController.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            color: Theme.of(context).dividerColor.withOpacity(0.05),
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                            child: Text(AppLocalizations.of('POPULAR LOCATONS'), style: Theme.of(context).textTheme.caption),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 230,
                            child: ListView.builder(
                              padding: EdgeInsets.all(0.0),
                              itemCount: notes.length,
                              itemBuilder: (context, idx) {
                                return Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(width: 22, height: 22, child: Image.asset(ConstanceData.endPin)),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                notes[idx],
                                                style: Theme.of(context).textTheme.bodyText1,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            color: Theme.of(context).disabledColor,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
