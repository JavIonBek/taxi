import 'package:flutter/material.dart';
import 'package:my_cab/Language/appLocalizations.dart';
import 'package:my_cab/constance/constance.dart';
import 'package:my_cab/modules/home/locationButton.dart';

class MapPinSelectionView extends StatelessWidget {
  final String barText;
  final VoidCallback callback, gpsClick, onBackClick;

  const MapPinSelectionView({ key, required this.callback, required this.gpsClick, required this.barText, required this.onBackClick}) : super(key: key);
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(ConstanceData.endPin),
              ),
              SizedBox(
                width: 80,
                height: 80,
              )
            ],
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          onBackClick();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            barText,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Column(
              children: <Widget>[
                LocationButtonView(
                  gpsClick: () {
                    gpsClick();
                  },
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          callback();
                        },
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            AppLocalizations.of('Apply'),
                            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                          ),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
