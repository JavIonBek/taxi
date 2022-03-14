import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_cab/Language/appLocalizations.dart';
import 'package:my_cab/constance/themes.dart';
import 'package:my_cab/modules/rating/rating_screen.dart';
import 'package:my_cab/modules/widgets/cardWidget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            color: Theme.of(context).primaryColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top + 16,
              ),
              Padding(
                padding: EdgeInsets.only(right: 14, left: 14),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(right: 14, left: 14, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of('History'),
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    ClipRect(
                      child: BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(
                                    AppLocalizations.of('Oct 15,2020'),
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 0, right: 14, left: 14),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          gotorating();
                        },
                        child: CardWidget(
                          fromAddress: AppLocalizations.of('465 Swift Village'),
                          toAddress: AppLocalizations.of('Sunrise st'),
                          price: "15 000 so`m",
                          status: AppLocalizations.of('Confirm'),
                          statusColor: HexColor("#3638FE"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          gotorating();
                        },
                        child: CardWidget(
                          fromAddress: AppLocalizations.of('026 Mitchell Burg Apt. 567'),
                          toAddress: AppLocalizations.of('342 Lottie Views 435'),
                          price: "8 000 so`m",
                          status: AppLocalizations.of('Completed'),
                          statusColor: HexColor("#55E274"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          gotorating();
                        },
                        child: CardWidget(
                          fromAddress: AppLocalizations.of('25 Stacy Falls Suite 453'),
                          toAddress: AppLocalizations.of('090 Joaquian isle Suite 76'),
                          price: "11 000 so`m",
                          status: AppLocalizations.of('Cancelled'),
                          statusColor: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          gotorating();
                        },
                        child: CardWidget(
                          fromAddress: AppLocalizations.of('465 Swift Village'),
                          toAddress: AppLocalizations.of('Sunrise st'),
                          price: "15 000 so`m",
                          status: AppLocalizations.of('Confirm'),
                          statusColor: HexColor("#3638FE"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  gotorating() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RatingScreen(),
      ),
    );
  }
}
