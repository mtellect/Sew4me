import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:sow4me/pages/home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sow4me/utils/colors.dart';

class DesignDetails extends StatefulWidget {
  List<S4MBuilder> designList;
  int position;
  DesignDetails({this.designList, this.position});
  @override
  _DesignDetailsState createState() => _DesignDetailsState();
}

class _DesignDetailsState extends State<DesignDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(150),
      child: Column(
        children: <Widget>[
          new SizedBox(
            height: 80.0,
          ),
          topAdsS4M(),
          new SizedBox(
            height: 20.0,
          ),
          new CircleAvatar(
              maxRadius: 30.0,
              backgroundColor: Colors.white,
              child: new CloseButton())
        ],
      ),
    );
  }

  Widget topAdsS4M() {
    return Container(
      height: 300.0,
      margin: EdgeInsets.all(12.0),
      //padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: new PageIndicatorContainer(
          size: 10.0,
          indicatorSpace: 5.0,
          indicatorSelectorColor: blue3,
          indicatorColor: blue3.withAlpha(125),
          pageView: new PageView.builder(
              controller: new PageController(),
              itemCount: widget.designList.length,
              itemBuilder: (c, index) {
                return new Container(
                  //height: 200.0,
                  padding: EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  child: new Column(
                    children: <Widget>[
                      new Text(widget.designList[index].title),
                      new SizedBox(
                        height: 15.0,
                      ),
                      new CachedNetworkImage(
                          height: 200.0,
                          width: 200.0,
                          fit: BoxFit.contain,
                          imageUrl: widget.designList[index].imageUrl),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                );
              }),
          length: widget.designList.length),
    );
  }
}
