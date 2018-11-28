import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sow4me/utils/colors.dart';
import 'package:sow4me/utils/images.dart';

class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals>
    with AutomaticKeepAliveClientMixin<Deals> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: dealList(),
    );
  }

  Widget dealList() {
    return new ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.only(top: 90.0, bottom: 100.0),
      itemBuilder: (c, index) {
        return dealItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return new SizedBox(
          height: 12.0,
        );
      },
    );
  }

  String dealText = "Place an order now to view the best deals";
  String dealUrl = "https://goo.gl/vCiUJv";

  Widget dealItem() {
    return new Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey.shade200)),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 150.0,
            child: Center(
              child: new CachedNetworkImage(
                imageUrl: dealUrl,
                fit: BoxFit.cover,
                height: 150.0,
                placeholder: new SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: new CircularProgressIndicator()),
                errorWidget: new Icon(Icons.error),
              ),
            ),
          ),
          new SizedBox(
            height: 10.0,
          ),
          new Row(
            children: <Widget>[
              new CircleAvatar(
                maxRadius: 20.0,
                backgroundImage: AssetImage(app_icon),
              ),
              new SizedBox(
                width: 10.0,
              ),
              new Text(
                "Sew4Me Exclusive",
                style: TextStyle(color: Colors.black.withAlpha(180)),
              )
            ],
          ),
          new Divider(),
          new Text("Amazing Deals!!!"),
          new SizedBox(
            height: 15.0,
          ),
          new Text("$dealText $dealText  $dealText"),
          new SizedBox(
            height: 10.0,
          ),
          new OutlineButton(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            highlightColor: Colors.white,
            splashColor: Colors.white,
            highlightedBorderColor: Colors.white,
            borderSide: BorderSide(color: Colors.black),
            onPressed: () {},
            child: Center(
              child: Text(
                "SHOP NOW",
                style: TextStyle(color: blue3, fontSize: 12.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
