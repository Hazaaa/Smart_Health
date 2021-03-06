import 'package:flutter/material.dart';
import 'package:call_number/call_number.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sms/sms.dart';

class EmergencyFloatButton extends StatefulWidget {
  const EmergencyFloatButton({Key key}) : super(key: key);

  @override
  _EmergencyFloatButtonState createState() => _EmergencyFloatButtonState();
}

class _EmergencyFloatButtonState extends State<EmergencyFloatButton> {
  initCall(String number) async {
    if (number != null || number != "")
      await new CallNumber().callNumber(number);
  }

  _sendEmergencySMS(String recipent) {
    getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
          SmsSender sender = new SmsSender();
          sender.sendSms(new SmsMessage(recipent, "Help! My coordinates are: ${position.latitude} lat ${position.longitude} lon!"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.red,
      child: Icon(Icons.phone),
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.warning, color: Colors.white),
          backgroundColor: Colors.red,
          label: 'Call 911',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.redAccent,
          onTap: () {
            initCall("+381192");
          }
        ),
        SpeedDialChild(
          child: Icon(Icons.person, color: Colors.white),
          backgroundColor: Colors.blue,
          label: 'Call emergency contact',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.blue,
          onTap: () {
            initCall("+1-770-651-9826");
          }
        ),
        SpeedDialChild(
          child: Icon(Icons.person, color: Colors.white),
          backgroundColor: Colors.orange,
          label: 'Send coordinates to emergency contact',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.orange,
          onTap: () {
            _sendEmergencySMS("+1-770-651-9826");
          }
        )
      ],
    );
  }
}
