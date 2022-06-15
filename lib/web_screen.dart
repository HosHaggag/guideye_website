import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(
              'images/Guide.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          SizedBox(
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30.0, fontFamily: 'Cairo', color: Colors.black),
              child: AnimatedTextKit(
                pause: Duration(milliseconds: 3000),
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome to Guideye',
                    speed: Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Guideye is a mobile application that helps you to find the description of Antiques and Art pieces.',
                    speed: Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'You can search for the description of the piece by using the QR code below the piece.',
                    speed: Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Or by explore the pieces by using the app by category or by country.',
                    speed: Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Download now and know more about our Historical Pieces and incredible Arts',
                    speed: Duration(milliseconds: 100),
                  ),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(
                            'https://play.google.com/store/apps/details?id=com.cce.guideye',
                          ),
                        );
                      },
                      child: Image.asset(
                        'images/google_play.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
