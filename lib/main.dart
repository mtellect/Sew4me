import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sow4me/collections/catelog.dart';
import 'package:sow4me/pages/collections.dart';
import 'package:sow4me/pages/deals.dart';
import 'package:sow4me/pages/home.dart';
import 'package:sow4me/pages/settings.dart';
import 'package:sow4me/utils/colors.dart';
import 'package:sow4me/utils/images.dart';
import 'utils/fonts.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sew4Me',
      theme: new ThemeData(
          //primarySwatch: Colors.black,
          primaryColor: blue3,
          fontFamily: Nirmala),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController = new PageController();
  TabController _tabController;
  int currentPage = 0;

  final List<Tab> tabs = <Tab>[
    new Tab(text: "English wears"),
    new Tab(text: "Senators"),
    new Tab(text: "Traditional"),
    new Tab(text: "Suits"),
    new Tab(text: "Chinos"),
    new Tab(text: "Jeans"),
  ];

  void _handleTabSelection() {
    setState(() {
      pageController.jumpToPage(_tabController.index + 1);
      currentPage = _tabController.index + 1;
      //print(currentPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return new Stack(
      children: <Widget>[tabPages(), topTabs(), bottomTabs()],
    );
  }

  Widget topTabs() {
    if (currentPage == 0) {
      return homeAppBar();
    }

    if (currentPage >= 1 && currentPage <= 6) {
      return collectionAppBar();
    }

    if (currentPage == 7) {
      return dealsAppBar();
    }

    if (currentPage == 8) {
      return settingAppBar();
    }

    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget homeAppBar() {
    return new Container(
      height: 100.0,
      color: blue3,
      padding: EdgeInsets.only(top: 25.0, right: 15, left: 15.0),
      child: Center(
        child: new Container(
          height: 40.0,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 20.0,
              ),
              new SizedBox(
                width: 10.0,
              ),
              Text(
                "Search senators, traditional, ankara etc",
                style: TextStyle(color: Colors.white.withAlpha(150)),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black.withAlpha(100),
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),
    );
  }

  Widget dealsAppBar() {
    return new Container(
      height: 80.0,
      color: blue3,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 30.0, right: 15, left: 15.0),
      child: new Text(
        "DEALS / NEWS / OFFERS",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget collectionAppBar() {
    return new Container(
      height: 140.0,
      color: blue3,
      padding: EdgeInsets.only(top: 35.0, right: 15, left: 15.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Container(
              height: 40.0,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Search our collections",
                    style: TextStyle(color: Colors.white.withAlpha(150)),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
          ),
          new SizedBox(
            height: 5.0,
          ),
          collectionTabs()
        ],
      ),
    );
  }

  Widget settingAppBar() {
    return new Container(
      height: 190.0,
      color: Colors.white,
      padding: EdgeInsets.only(top: 35.0, right: 15, left: 15.0),
      child: new Column(
        children: <Widget>[
          new ListTile(
            onTap: () {},
            leading: new CircleAvatar(
              backgroundColor: blue3,
              maxRadius: 25.0,
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
            ),
            trailing: new Icon(Icons.navigate_next),
            title: new Text(
              "Maugost",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              "Edit your profile",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          new Row(
            children: <Widget>[
              new Flexible(
                child: new OutlineButton(
                  color: Colors.white,
                  padding: EdgeInsets.all(12.0),
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  borderSide: BorderSide(color: Colors.red),
                  onPressed: () {},
                  child: Center(
                    child: Text("REGISTER"),
                  ),
                ),
              ),
              new SizedBox(
                width: 10.0,
              ),
              new Flexible(
                child: new OutlineButton(
                  color: Colors.white,
                  padding: EdgeInsets.all(12.0),
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  borderSide: BorderSide(color: blue3),
                  onPressed: () {},
                  child: Center(
                    child: Text("LOGIN"),
                  ),
                ),
              ),
            ],
          ),
          new Divider()
        ],
      ),
    );
  }

  Widget collectionTabs() {
    return new TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: new BubbleTabIndicator(
          indicatorHeight: 35.0,
          indicatorColor: Colors.black.withAlpha(150),
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: tabs);
  }

  Widget tabPages() {
    return new PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: <Widget>[
        HomePage(),
        Catelog(
          catelogTitle: "${tabs[_tabController.index].text}",
        ),
        Catelog(
          catelogTitle: "${tabs[_tabController.index].text}",
        ),
        Catelog(
          catelogTitle: "${tabs[_tabController.index].text}",
        ),
        Catelog(
          catelogTitle: "${tabs[_tabController.index].text}",
        ),
        Catelog(
          catelogTitle: "${tabs[_tabController.index].text}",
        ),
        Catelog(
          catelogTitle: "${tabs[_tabController.index].text}",
        ),
        Deals(),
        SettingsPage(),
      ],
    );
  }

  void onPageChanged(int value) {
    setState(() {
      currentPage = value;
      if (currentPage >= 1 && currentPage <= 6) {
        _tabController.animateTo(value - 1, curve: Curves.ease);
      }
    });
  }

  Widget bottomTabs() {
    return new Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100.0,
        child: new Stack(
          children: <Widget>[btmContainer(), tabContainer(), cartBottom()],
        ),
      ),
    );
  }

  Widget cartBottom() {
    return new Align(
      alignment: Alignment.bottomRight,
      child: new Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          new Container(
            //alignment: Alignment.centerRight,
            height: 90.0,
            width: 90.0,
            child: new Container(
              height: 100.0,
              width: 100.0,
              margin: EdgeInsets.all(8.0),
              child: new Center(
                child: new Image.asset(
                  cart,
                  alignment: Alignment.center,
                  height: 25.0,
                  width: 25.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(150), shape: BoxShape.circle),
            ),
            //margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(color: blue3, shape: BoxShape.circle),
          ),
          cartBadge(5)
        ],
      ),
    );
  }

  Widget btmContainer() {
    return new Align(
      alignment: Alignment.bottomCenter,
      child: new Container(
        height: 65.0,
        color: blue3,
      ),
    );
  }

  Widget tabContainer() {
    return new Align(
      alignment: Alignment.center,
      child: new Container(
        margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        padding: EdgeInsets.only(right: 100.0),
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.black.withAlpha(90),
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: new Row(
          children: <Widget>[
            tabItem(position: 0),
            tabItem(
                position:
                    currentPage >= 1 && currentPage <= 6 ? currentPage : 1),
            tabItem(position: 7),
            tabItem(position: 8),
          ],
        ),
      ),
    );
  }

  Widget cartBadge(int itemCount) {
    return new Container(
      height: 25.0,
      width: 25.0,
      margin: EdgeInsets.only(right: 15.0, top: 16.0),
      child: new Center(
        child: Text(
          "$itemCount",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
    );
  }

  Widget tabItem({int position}) {
    bool pageSelected = position == currentPage;
    Color colors =
        pageSelected ? Colors.black.withAlpha(120) : Colors.transparent;

    Widget widget;

    if (position == 0) {
      widget = Image.asset(
        sew4me,
        height: 25.0,
        width: 25.0,
        color: pageSelected ? Colors.white : Colors.white.withAlpha(100),
      );
    }

    if (position >= 1 && position <= 6) {
      widget = Icon(
        Icons.view_carousel,
        color: pageSelected ? Colors.white : Colors.white.withAlpha(100),
      );
    }

    if (position == 7) {
      widget = Icon(
        Icons.wrap_text,
        color: pageSelected ? Colors.white : Colors.white.withAlpha(100),
      );
    }

    if (position == 8) {
      widget = Icon(
        Icons.person_outline,
        color: pageSelected ? Colors.white : Colors.white.withAlpha(100),
      );
    }

    return new Flexible(
      child: new GestureDetector(
        onTap: () {
          pageController.jumpToPage(position);
        },
        child: new Container(
            height: 40.0,
            child: new Center(
              child: widget,
            ),
            decoration: BoxDecoration(
                color: colors,
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
