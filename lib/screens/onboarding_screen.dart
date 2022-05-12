import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import './Signup.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  void GoToLogi(BuildContext ctx) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return SignP();
    }));
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration getpagedeco() => PageDecoration(
          imageAlignment: Alignment.topCenter,
          imagePadding: EdgeInsets.only(
            top: 50,
          ),
        );

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.blue[200],
        pages: [
          PageViewModel(
            title: 'Create a fundraiser',
            body:
                'Lift up a Friend, Family or even yourself. Start a Free Personal Fundraiser today.',
            image: Image.asset(
              'assets/donations.jpg',
              fit: BoxFit.contain,
            ),
            decoration: getpagedeco(),
          ),
          PageViewModel(
            title: 'Raise awareness on social media',
            body:
                'Create accounts for your cause on Facebook, Twitter, Instagram, and YouTube. Start engaging with people and related communities. Try sparking thoughtful conversations about your cause by asking questions or giving feedback.',
            image: Image.asset(
              'assets/campaign.jpg',
              fit: BoxFit.contain,
            ),
            decoration: getpagedeco(),
          ),
          PageViewModel(
            title: 'Raise Funds',
            body:
                'Amidst the Covid-19 crisis, nonprofit organizations have faced onerous financial burdens.  ',
            image: Image.asset(
              'assets/dollar.jpg',
              fit: BoxFit.contain,
            ),
            decoration: getpagedeco(),
          ),
        ],
        onDone: () => GoToLogi(context),
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: false,
        showNextButton: false,
        skip: const Icon(Icons.skip_next_rounded),
        next: const Icon(Icons.next_plan_outlined),
        done: const Text("Done",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'ReadexPro-SemiBold',
                fontSize: 20,
                color: Colors.green)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blueAccent,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
