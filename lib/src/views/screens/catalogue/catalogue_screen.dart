import 'package:flutter/material.dart';
import 'package:garudahacks/src/models/doctor.dart';
import 'package:garudahacks/src/models/doctor_response.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/screens/doctor/doctor_detail_screen.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogueScreen extends StatefulWidget {
  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {

  List<Doctor> doctors = new List();

  Future<List<dynamic>> fetchDoctors() async {
    var result = await http.get(Constant.BASE_URL + "doctors");
//    print(json.decode(result.body));
    doctors = DoctorResponse.fromJson(json.decode(result.body)).data;
    return doctors;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splash-screen.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: FutureBuilder<List<dynamic>>(
                future: fetchDoctors(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                      return Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _categorySection(),
                                _topDoctorSection(context, doctors)
                              ],
                            ),
                          ).onlyPaddingTop150,
                        ],
                      );
                  } else {
                      print(snapshot.error);
                      return Container();
                  }
                },
              )
    ),
          _appBar(),
          _searchSection().onlyPaddingTop100
        ]));
  }

  Widget _appBar() {
    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TitleText(text: "Catalogue", fontSize: 14, fontWeight: FontWeight.w200, color: Colors.white,)
        ],
      ),
    );
  }

  Widget _searchSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search any doctors...',
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget _categorySection() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
//              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) =>
                  ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        "dummy"
//                        items[index],
//                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _topDoctorSection(BuildContext buildContext, List<Doctor> doctors) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Doctors",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctors.length,
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.black,
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: doctors[index].name == null ? "" : doctors[index].name, fontSize: 12,),
                      TitleText(text: doctors[index].specialization == null ? "" : doctors[index].specialization, fontSize: 10,),
                      TitleText(text: doctors[index].address == null ? "" : doctors[index].address, fontSize: 10,),
                    ],
                  ).ripple(() {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(builder: (context) => DoctorDetailScreen(id: doctors[index].id.toString(),))
                    );
                  }
                  ),
                  trailing: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }

  Widget _icon(
      IconData icon, {
        Color color = Colors.white,
        double size = 20,
        double padding = 10,
        bool isOutLine = false,
        Function onPressed,
      }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      color: Colors.transparent,
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();

      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }
}
