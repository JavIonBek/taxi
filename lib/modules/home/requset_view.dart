import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cab/Language/appLocalizations.dart';
import 'package:my_cab/constance/constance.dart';
import 'package:my_cab/constance/themes.dart';
import 'package:my_cab/modules/chat/chat_Screen.dart';
import 'package:my_cab/modules/home/promoCodeView.dart';
import 'package:my_cab/constance/global.dart' as globals;

class RequsetView extends StatefulWidget {
  final VoidCallback onBack;

  const RequsetView({ key, required this.onBack}) : super(key: key);

  @override
  _RequsetViewState createState() => _RequsetViewState();
}

class _RequsetViewState extends State<RequsetView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 8, right: 8),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: AppBar().preferredSize.height,
                          width: AppBar().preferredSize.height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              margin: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: InkWell(
                                  onTap: () {
                                    widget.onBack();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Theme.of(context).textTheme.headline6!.color,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              !isConfrimDriver
                  ? Card(
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Theme.of(context).dividerColor.withOpacity(0.03),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.car),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          AppLocalizations.of('Just go'),
                                          style: Theme.of(context).textTheme.subtitle2,
                                        ),
                                        Text(AppLocalizations.of('Nearby you'), style: Theme.of(context).textTheme.caption),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "10 000 so'm",
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(AppLocalizations.of('2 min'), style: Theme.of(context).textTheme.caption),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Theme.of(context).disabledColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.account_balance_wallet,
                                          color: Theme.of(context).disabledColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            AppLocalizations.of('Payment'),
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                  color: Theme.of(context).disabledColor,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Theme.of(context).dividerColor,
                                  width: 1,
                                  height: 48,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            contentPadding: EdgeInsets.all(0),
                                            content: PromoCodeView(),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.loyalty,
                                          color: Theme.of(context).disabledColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            AppLocalizations.of('Promo code'),
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).disabledColor,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Theme.of(context).dividerColor,
                                  width: 1,
                                  height: 48,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.more_horiz,
                                          color: Theme.of(context).disabledColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            AppLocalizations.of('Options'),
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                  color: Theme.of(context).disabledColor,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 8),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      isConfrimDriver = true;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of('Request'),
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    )
                  : confirmDriverBox(context),
            ],
          ),
        )
      ],
    );
  }

  bool isConfrimDriver = false;

  Widget confirmDriverBox(context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 16,
            child: Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    new BoxShadow(
                      color: globals.isLight ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.2),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 0,
            left: 0,
            bottom: 16,
            child: Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    new BoxShadow(
                      color: globals.isLight ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.2),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  new BoxShadow(
                    color: globals.isLight ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).dividerColor.withOpacity(0.03),
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              ConstanceData.userImage,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of('Bahodir Abdullayev'),
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.headline6!.color,
                                    ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[800],
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    AppLocalizations.of('4.9'),
                                    style: Theme.of(context).textTheme.button!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).dividerColor.withOpacity(0.4),
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatScreen(),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: HexColor("#4353FB"),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.facebookMessenger,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.phoneAlt,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0.5,
                      color: Theme.of(context).dividerColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              ConstanceData.user1,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              ConstanceData.user2,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              ConstanceData.user3,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            AppLocalizations.of('25 Recommended'),
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.headline6!.color,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0.5,
                      color: Theme.of(context).disabledColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.car,
                            size: 24,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of('DISTANCE'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).dividerColor.withOpacity(0.4),
                                    ),
                              ),
                              Text(
                                AppLocalizations.of('0.2 km'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.headline6!.color,
                                    ),
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of('TIME'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).dividerColor.withOpacity(0.4),
                                    ),
                              ),
                              Text(
                                AppLocalizations.of('0.2 km'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.headline6!.color,
                                    ),
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of('PRICE'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).dividerColor.withOpacity(0.4),
                                    ),
                              ),
                              Text(
                                AppLocalizations.of('10 000 sum'),
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.headline6!.color,
                                    ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
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
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(
                                          Icons.check_circle,
                                          size: 80,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          AppLocalizations.of('Booking Succsessful'),
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Theme.of(context).textTheme.subtitle1!.color,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                                          child: Text(
                                            AppLocalizations.of('Your booking has been confirmed. Driver will pickup you in 2 minutes.'),
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                  color: Theme.of(context).disabledColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Divider(
                                          height: 0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 16, left: 16),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  AppLocalizations.of('Cancel'),
                                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                        color: Theme.of(context).disabledColor,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                color: Theme.of(context).dividerColor,
                                                width: 0.5,
                                                height: 48,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    isConfirm = true;
                                                  });
                                                },
                                                child: Container(
                                                  child: Text(
                                                    AppLocalizations.of('Done'),
                                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                          color: Theme.of(context).primaryColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.only(top: 16),
                                  );
                                },
                              );
                            },
                            child: Center(
                              child: !isConfirm
                                  ? Text(
                                      AppLocalizations.of('Confirm'),
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      AppLocalizations.of('Cancel Request'),
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isConfirm = false;
}
