import 'package:flutter/material.dart';
import 'package:smart_health/custom_widgets/appbar.dart';
import 'package:smart_health/custom_widgets/drawer.dart';
import 'package:smart_health/custom_widgets/emergency_float_button.dart';

class RecordsPage extends StatefulWidget {
  RecordsPage({Key key}) : super(key: key);

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  int _numberOfRecords = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: EmergencyFloatButton(),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Text(
                  "Medical records",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.only(right: 20.0, left: 20.0),
                  padding: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0)),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        tooltip: "Filter records",
                        onPressed: () {},
                      ),
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            hintText: 'Enter a search term',
                          ),
                          onChanged: (text) {
                            setState(() {
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        tooltip: "Search records",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _numberOfRecords,
                  itemBuilder: (context, i) {
                    return ExpansionTile(
                      subtitle: Text(
                        "Date: 20/07/2020",
                        style: TextStyle(
                            color: Colors.black54, fontSize: 12.0),
                      ),
                      leading: Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                      title: Text(
                        "Record $i",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Doctor: ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Ben Geller",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Reason for coming: ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Said that he possible has a cold and that he can maybe die",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Symptoms: ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Sneezing",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Result: ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Patient has signs of cold",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Treatment: ",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Drink more tea",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
