import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/views/screens/catalogue/catalogue_screen.dart';
import 'package:garudahacks/src/views/screens/qrcode/qr_code_screen.dart';
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
              maxChildSize: 0.98,
              initialChildSize: 0.98,
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
                        _covidBanner(),
                        _nextAppointment(),
                        _currentMedication(),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: _floatingBottomNavigation(),
              ),
            ),
            Positioned(
              bottom: 40,
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90.0),
                      child: Container(
                        color: Constant.PRIMARY_COLOR,
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.apps,
                          color: Colors.white,
                        ),
                      ),
                    ).ripple(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrCodeScreen()));
                    })
                  ],
                ),
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

  Widget _covidBanner() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/covid.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Do you have symptomps of COVID-19 ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Constant.PRIMARY_COLOR,
            ),
            child: FlatButton(
              color: Colors.transparent,
              onPressed: () {},
              child: Text(
                "Contact a doctor",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nextAppointment() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: Constant.PRIMARY_COLOR,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Next Appointments",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
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
                      color: Constant.SECONDARY_COLOR,
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
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: ListTile(
                      leading: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constant.PRIMARY_COLOR,
                          ),
                          child: Icon(
                            Icons.person,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                      title: Text("dr. Jajang Nurjana, Sp.JP"),
                      trailing: Icon(Icons.info_outline),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Constant.LIGHT_GRAY_COLOR,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _currentMedication() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                  child: Image.asset("assets/images/medication.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Current Medications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ListTile(
                      leading: Icon(Icons.local_hospital),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Allopurinol",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "1 tablets orally 1x/day after meal",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: Text(
                      "24 tablets, 24 days",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReMediScreen()));
            break;
          case 4:
            break;
        }
      },
      items: [
        FloatingNavBarItem(icon: Icons.account_circle, title: 'Profile'),
        FloatingNavBarItem(icon: Icons.local_hospital, title: 'Catalogue'),
        FloatingNavBarItem(title: 'Pairing'),
        FloatingNavBarItem(icon: Icons.event_note, title: 'ReMedi'),
        FloatingNavBarItem(icon: Icons.event, title: 'Schedule'),
      ],
    );
  }
}
