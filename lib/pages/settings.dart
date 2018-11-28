import 'package:flutter/material.dart';
import 'package:sow4me/utils/colors.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {
  bool notification = false;
  bool deals = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: settingsBody(),
    );
  }

  Widget settingsBody() {
    return Container(
      margin: new EdgeInsets.only(
        top: 190.0,
      ),
      child: new Column(
        children: <Widget>[settingsItems()],
      ),
    );
  }

  Widget settingAppBar() {
    return new Container(
      height: 190.0,
      //color: blue3,
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
                  highlightedBorderColor: Colors.white,
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
                  highlightedBorderColor: Colors.white,
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

  Widget badge(int itemCount) {
    return new Container(
      height: 25.0,
      width: 25.0,
      child: new Center(
        child: Text(
          "$itemCount",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: blue3)),
    );
  }

  Widget settingsItems() {
    return new Flexible(
        child: new ListView(
      padding: EdgeInsets.only(bottom: 150.0),
      children: <Widget>[
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Row(
            children: <Widget>[
              new Text(
                "Notification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new SizedBox(
                width: 10.0,
              ),
              badge(25)
            ],
          ),
          subtitle: new Text(""),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "My Orders",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: new Text(""),
        ),
        new Divider(
          height: 0.0,
        ),
        new Padding(
          padding: const EdgeInsets.all(15.0),
          child: new Text(
            "Notifications",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14.0, color: blue3),
          ),
        ),
        new SwitchListTile(
          activeColor: blue3,
          onChanged: (value) {
            setState(() {
              notification = value;
            });
          },
          title: new Text(
            "Push Notification",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            notification == true ? "Enabled" : "Disabled",
            style: TextStyle(fontSize: 12.0),
          ),
          value: notification,
        ),
        new Divider(
          height: 0.0,
        ),
        new SwitchListTile(
          activeColor: blue3,
          onChanged: (value) {
            setState(() {
              deals = value;
            });
          },
          title: new Text(
            "Best Deals/Offers",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: deals == true
              ? Text(
                  "Notify me on best deals/ offers",
                  style: TextStyle(fontSize: 12.0),
                )
              : Text("Don't notify me on best deals/ offers",
                  style: TextStyle(fontSize: 12.0)),
          value: deals,
        ),
        new Divider(
          height: 0.0,
        ),
        new Padding(
          padding: const EdgeInsets.all(15.0),
          child: new Text(
            "About",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14.0, color: blue3),
          ),
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "About App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Read all about sew4Me",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Share App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Share app with friends",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Rate App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Rate the App on Play Store",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "App Update",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Check for update",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new Padding(
          padding: const EdgeInsets.all(15.0),
          child: new Text(
            "Other",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14.0, color: blue3),
          ),
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Privacy policy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Read our privacy policy",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Terms and Conditions",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Read our terms and conditions",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Feedback",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Provide us with feedback to help us improve the app",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Help and support",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Text(
            "Ask us anytime for help and support",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        new Divider(
          height: 0.0,
        ),
        new ListTile(
          onTap: () {},
          trailing: new Icon(Icons.navigate_next),
          title: new Text(
            "Log Out",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.red),
          ),
          subtitle: new Text(""),
        ),
      ],
    ));
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
