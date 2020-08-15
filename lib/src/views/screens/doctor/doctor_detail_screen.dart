import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garudahacks/src/models/detail_doctor_response.dart';
import 'package:garudahacks/src/models/doctor.dart';
import 'package:garudahacks/src/models/doctor_response.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/utils/extensions.dart';
import 'package:garudahacks/src/views/widgets/common/app_color.dart';
import 'package:garudahacks/src/views/widgets/common/custom_title_text.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class DoctorDetailScreen extends StatefulWidget {
  final String id;
  DoctorDetailScreen({Key key, this.id}) : super(key: key);
  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState(id);
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  CalendarController _calendarController;
  DateTime _selectedDay;
  int _selectedTime;
  bool _isSelected;

  List<String> times = [
    "10.00",
    "11.00",
    "12.00",
    "13.00",
    "14.00",
    "15.00",
    "16.00",
    "17.00",
    "18.00",
    "19.00"
  ];

  final String id;
  _DoctorDetailScreenState(this.id);

  DetailDoctorResponse detailDoctorResponse;

  Future<DetailDoctorResponse> fetchDetailDoctor() async {
    print(id);
    var result = await http.get(Constant.BASE_URL + "doctors/$id");
    print(json.decode(result.body));
    detailDoctorResponse =
        DetailDoctorResponse.fromJson(json.decode(result.body));
    return detailDoctorResponse;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _selectedTime = 0;
    _isSelected = false;
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<DetailDoctorResponse>(
            future: fetchDetailDoctor(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot != null && snapshot.data != null) {
                print("test ${snapshot.data.doctor.name}");
                return Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/base.png"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(160),
                            ),
                          ),
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _appBar(),
                              Container(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.all(60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.doctor.name == null
                                    ? ""
                                    : snapshot.data.doctor.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  snapshot.data.doctor.specialization == null
                                      ? ""
                                      : snapshot.data.doctor.specialization,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Constant.PRIMARY_COLOR,
                                  ),
                                  Text(
                                    snapshot.data.doctor.address == null
                                        ? ""
                                        : snapshot.data.doctor.address,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                        ),
                                        Text(
                                          ' 4.6',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " (3122 reviews)",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'See all',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Constant.PRIMARY_COLOR,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Stats",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "3644",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Patients",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "15 years",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Experience",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 60, left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constant.PRIMARY_COLOR,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Constant.PRIMARY_COLOR,
                            onPressed: () =>
                                _settingCalendarBottomSheet(context),
                            child: Text(
                              "Make Appointment",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }

  Widget _appBar() {
    return Container(
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
          TitleText(
            text: "Medical Record Details",
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          )
        ],
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

  void _settingCalendarBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              children: [
                _buildTableCalendar(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Constant.PRIMARY_COLOR,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Constant.PRIMARY_COLOR,
                      onPressed: _handleConfirmDate,
                      child: Text(
                        "Confirm Date",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildTableCalendar() {
    final Map<DateTime, List> _holidays = new HashMap();

    List.generate(15, (index) => index).forEach((element) {
      _holidays[DateTime(2020, 8, element + 1)] = ['outdated'];
    });
    return TableCalendar(
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Constant.PRIMARY_COLOR,
        todayColor: Constant.PRIMARY_COLOR,
        markersColor: Constant.PRIMARY_COLOR,
        holidayStyle: TextStyle(
          color: AppColor.grey,
        ),
      ),
      holidays: _holidays,
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
    );
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
    });
  }

  void _handleConfirmDate() {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: GridView.builder(
                    itemCount: times.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 4,
                    ),
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _timeItem(index, _isSelected),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constant.PRIMARY_COLOR,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Constant.PRIMARY_COLOR,
                    onPressed: () {},
                    child: Text(
                      "Confirm Time",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void _setCurrentTime(int index) {
    setState(() {
      _selectedTime = index;
    });
  }

  Widget _timeItem(int selectedTime, bool _selected) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Constant.PRIMARY_COLOR, width: 1)),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _setCurrentTime(selectedTime);
              _isSelected = true;
              _handleConfirmDate();
            });
            print("as $selectedTime $_isSelected");
          },
          color: selectedTime == _selectedTime
              ? _isSelected ? Colors.white : Constant.PRIMARY_COLOR
              : Constant.PRIMARY_COLOR,
          child: Text(
            times[selectedTime],
            style: TextStyle(
              color: selectedTime == _selectedTime
                  ? _isSelected ? Constant.PRIMARY_COLOR : Colors.white
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
