import 'package:flutter/material.dart';
import 'package:sow4me/collections/types.dart';
import 'package:sow4me/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:sow4me/utils/images.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return new Container(
        margin: EdgeInsets.only(top: 100.0),
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverList(
                delegate: SliverChildListDelegate([
              topAdsS4M(),
              new SizedBox(
                height: 10.0,
              ),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Text(
                  "DRESS TYPES",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
              ),
            ])),
            dressTypes(),
            new SliverList(
                delegate: SliverChildListDelegate([
              new SizedBox(
                height: 20.0,
              ),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Text(
                  "DRESS STYLES",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
              ),
            ])),
            dressStyles(),
            new SliverList(
                delegate: SliverChildListDelegate([
              new SizedBox(
                height: 20.0,
              ),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Text(
                  "ANKARA STYLES",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
              ),
            ])),
            ankaraTypes(),
            new SliverList(
                delegate: SliverChildListDelegate([
              new SizedBox(
                height: 100.0,
              )
            ]))
          ],
        ));
  }

  Widget dressTypes() {
    return new SliverPadding(
      padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
      sliver: new SliverGrid(
        delegate: new SliverChildBuilderDelegate((c, index) {
          return new GestureDetector(
            onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (c) => Types(
                          catelogTitle: typesList[index].title,
                        ))),
            child: new Container(
              decoration: BoxDecoration(
                  color: blue3.withAlpha(100),
                  image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(typesList[index].imageUrl),
                      fit: BoxFit.cover),
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              alignment: Alignment.bottomCenter,
              child: new Container(
                color: Colors.grey.shade100,
                height: 40.0,
                child: new Center(
                  child: Text(
                    typesList[index].title,
                    style: TextStyle(
                        color: Colors.black.withAlpha(140),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        }, childCount: typesList.length),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 5.0, crossAxisSpacing: 8.0),
      ),
    );
  }

  Widget ankaraTypes() {
    return new SliverPadding(
      padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
      sliver: new SliverGrid(
        delegate: new SliverChildBuilderDelegate((c, index) {
          return new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                    color: blue3.withAlpha(100),
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1.0]),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            ankaraStyleList[index].imageUrl),
                        fit: BoxFit.cover),
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              new Container(
                alignment: Alignment.bottomCenter,
                child: new Container(
                  color: Colors.transparent,
                  height: 40.0,
                  child: new Center(
                    child: Text(
                      ankaraStyleList[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(120),
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ],
          );
        }, childCount: ankaraStyleList.length),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.8),
      ),
    );
  }

  Widget dressStyles() {
    return new SliverPadding(
      padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
      sliver: new SliverGrid(
        delegate: new SliverChildBuilderDelegate((c, index) {
          return new Stack(
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            styleList[index].imageUrl),
                        fit: BoxFit.cover),
                    color: blue3.withAlpha(100),
                    border: Border.all(color: Colors.white, width: 0.0),
                    shape: BoxShape.circle),
              ),
              new Container(
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(120),
                    border: Border.all(color: Colors.white, width: 0.0),
                    shape: BoxShape.circle),
                alignment: Alignment.bottomCenter,
                child: new Container(
                  color: Colors.white,
                  height: 40.0,
                  child: new Center(
                    child: Text(
                      styleList[index].title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        }, childCount: styleList.length),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 5.0, crossAxisSpacing: 8.0),
      ),
    );
  }

  Widget topAdsS4M() {
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(5.0),
      //padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: new PageIndicatorContainer(
          size: 10.0,
          indicatorSpace: 5.0,
          indicatorSelectorColor: Colors.white,
          indicatorColor: Colors.white.withAlpha(125),
          pageView: new PageView.builder(
              controller: new PageController(),
              itemCount: sm4TopAds.length,
              itemBuilder: (c, index) {
                return new Container(
                  //height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      image: DecorationImage(
                          image: AssetImage(
                            sm4TopAds[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.center),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                );
              }),
          length: sm4TopAds.length),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}

class S4MBuilder {
  String imageUrl;
  String title;

  S4MBuilder({this.title, this.imageUrl});
}

List<S4MBuilder> typesList = [
  new S4MBuilder(title: "TRADITIONAL", imageUrl: "https://goo.gl/1Er4sS"),
  new S4MBuilder(title: "SENATOR", imageUrl: "https://goo.gl/rjApAk"),
  new S4MBuilder(title: "ENGLISH", imageUrl: "https://goo.gl/fycAHc"),
  new S4MBuilder(title: "SUITS", imageUrl: "https://goo.gl/9aZGpi"),
  new S4MBuilder(title: "CHINOS", imageUrl: "https://goo.gl/pHAhwZ"),
  new S4MBuilder(title: "JEANS", imageUrl: "https://goo.gl/Rdpd4N")
];

List<S4MBuilder> styleList = [
  new S4MBuilder(title: "Ankara", imageUrl: "https://goo.gl/x9mbtp"),
  new S4MBuilder(title: "Etibo", imageUrl: "https://goo.gl/GtHwNg"),
  new S4MBuilder(title: "Sleeveless", imageUrl: "https://goo.gl/UJbi3F"),
  new S4MBuilder(title: "Skirts", imageUrl: "https://goo.gl/wrx8qh"),
  new S4MBuilder(title: "IsiAgu", imageUrl: "https://goo.gl/vxU996"),
  new S4MBuilder(title: "Ghana Ankara", imageUrl: "https://goo.gl/BFBySn"),
  new S4MBuilder(title: "S.A Attire", imageUrl: "https://goo.gl/HCBhye")
];

List<S4MBuilder> ankaraStyleList = [
  new S4MBuilder(title: "Divida", imageUrl: "https://goo.gl/xppt7E"),
  new S4MBuilder(title: "High Target", imageUrl: "https://goo.gl/MQ4Uio"),
];

List<S4MBuilder> sm4TopAds = [
  new S4MBuilder(title: "Join our team", imageUrl: requestVIP),
  new S4MBuilder(title: "Join our team", imageUrl: joinourteam),
];
