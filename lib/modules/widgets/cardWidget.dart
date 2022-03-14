import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cab/constance/constance.dart';

class CardWidget extends StatelessWidget {
  final String fromAddress;
  final String toAddress;
  final String price;
  final String status;
  final Color statusColor;

  const CardWidget({key, required this.fromAddress, required this.toAddress, required this.price, required this.status, required this.statusColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Row(
              children: <Widget>[
                Image.asset(
                  ConstanceData.startPin,
                  height: 32,
                  width: 32,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  fromAddress,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
            ),
            child: Container(
              height: 16,
              width: 2,
              color: Theme.of(context).dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: <Widget>[
                Image.asset(
                  ConstanceData.endPin,
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  toAddress,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Theme.of(context).disabledColor,
                  child: Icon(
                    FontAwesomeIcons.dollarSign,
                    color: Theme.of(context).backgroundColor,
                    size: 16,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    status,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).disabledColor,
                  size: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
