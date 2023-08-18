import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_sendingMails() async {
  var url = Uri.parse("mailto:feedback@geeksforgeeks.org");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sendingSMS() async {
  var url = Uri.parse("sms:966738292");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLBrowser() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLApp() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class SendingText extends StatelessWidget {
  const SendingText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 200.0,
              ),
              const Text(
                'Welcome to GFG!',
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 20.0,
              ),
              const Text(
                'For any Queries, Mail us',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: _sendingMails,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                child: const Text('Here'),
              ), // ElevatedButton

              // DEPRECATED
              // RaisedButton(
              // onPressed: _sendingMails,
              // child: Text('Here'),
              // textColor: Colors.black,
              // padding: const EdgeInsets.all(5.0),
              // ),
              Container(
                height: 20.0,
              ),
              const Text(
                'Or Send SMS',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: _sendingSMS,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                child: const Text('Here'),
              ), // ElevatedButton

              Container(
                height: 20.0,
              ),
              const Text(
                'Or Open URL In Browser',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: _launchURLBrowser,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                child: const Text('Here'),
              ), //

              Container(
                height: 20.0,
              ),
              const Text(
                'Or Open URL In App',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: _launchURLApp,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                child: const Text('Here'),
              ), //
              // DEPRECATED
              // RaisedButton(
              // onPressed: _sendingSMS,
              // textColor: Colors.black,
              // padding: const EdgeInsets.all(5.0),
              // child: Text('Here'),
              // ), child: const Text('Here'),
            ],
          ),
        ),
      ),
    );
  }
}
