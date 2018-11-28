import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sow4me/details/details.dart';
import 'package:sow4me/utils/colors.dart';
import 'package:sow4me/utils/images.dart';

class Catelog extends StatefulWidget {
  String catelogTitle;
  Catelog({this.catelogTitle});
  @override
  _CatelogState createState() => _CatelogState();
}

class _CatelogState extends State<Catelog>
    with AutomaticKeepAliveClientMixin<Catelog> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: dealList(),
    );
  }

  Widget dealList() {
    return new GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.54,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 5.0),
      padding:
          EdgeInsets.only(top: 150.0, bottom: 100.0, right: 5.0, left: 5.0),
      itemCount: 12,
      itemBuilder: (c, index) {
        return dealItem();
      },
    );
  }

  String dealText = "S4M class X senator";
  String dealUrl = "https://goo.gl/T4ShQ8";

  Widget dealItem() {
    return new GestureDetector(
      onTap: () => Navigator.push(
          context, new MaterialPageRoute(builder: (c) => Details())),
      child: new Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200)),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 150.0,
              alignment: Alignment.bottomCenter,
              child: new Container(
                  height: 62.0,
                  padding: EdgeInsets.all(5.0),
                  color: Colors.black.withAlpha(200),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dealText.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                      new SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "₦25,000",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ],
                  )),
              decoration: BoxDecoration(
                  color: blue3.withAlpha(100),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(dealUrl),
                      fit: BoxFit.cover)),
            ),
            new SizedBox(
              height: 3.0,
            ),
            new OutlineButton(
              color: Colors.white,
              padding: EdgeInsets.all(4.0),
              highlightColor: Colors.white,
              splashColor: Colors.white,
              highlightedBorderColor: Colors.white,
              borderSide: BorderSide(color: Colors.black),
              onPressed: () {},
              child: Text(
                "ADD TO CART",
                style: TextStyle(color: blue3, fontSize: 12.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
