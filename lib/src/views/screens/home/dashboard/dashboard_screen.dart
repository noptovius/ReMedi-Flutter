import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/screens/catalogue/catalogue_screen.dart';
import 'package:garudahacks/src/views/screens/qrcode//qr_code_screen.dart';
import 'package:garudahacks/src/views/screens/remedi/remedi_screen.dart';
import 'package:garudahacks/src/views/widgets/bottomnavigation/floating_navbar.dart';
import 'package:garudahacks/src/views/widgets/bottomnavigation/floating_navbar_item.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';
import 'package:garudahacks/src/views/widgets/common/app_theme.dart';
import 'package:garudahacks/src/utils/extensions.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            DraggableScrollableSheet(
              maxChildSize: 1.0,
              initialChildSize: 1.0,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16), //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        _search(),
                        _nextAppointment(),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: _floatingBottomNavigation(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search ReMedi services...",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 0,
                    top: 5,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Icon(
            Icons.account_circle,
            size: 35,
          ),
        ],
      ),
    );
  }

  Widget _nextAppointment() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Next Appointments"),
              Spacer(),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Check-up Appointment",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_alarm,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "14 Aug 2020, 10am",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    leading: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.account_box,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    title: Text("dr. Jajang Nurjana, Sp.JP"),
                    trailing: Icon(Icons.info_outline),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assignment,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "drug out",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = AppColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _floatingBottomNavigation() {
    return FloatingNavBar(
      onTap: (int val) {
        switch (val) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReMediScreen()));
            break;
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CatalogueScreen()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReMediScreen()));
            break;
          case 3:
            break;
        }
      },
      items: [
        FloatingNavBarItem(icon: Icons.account_circle, title: 'Profile'),
        FloatingNavBarItem(icon: Icons.local_hospital, title: 'Catalogue'),
        FloatingNavBarItem(icon: Icons.event_note, title: 'ReMedi'),
        FloatingNavBarItem(icon: Icons.event, title: 'Schedule'),
      ],
    );
  }
}
