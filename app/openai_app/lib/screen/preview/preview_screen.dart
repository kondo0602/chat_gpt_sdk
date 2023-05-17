import 'package:flutter/material.dart';
import 'package:openai_app/components/background/background_gradient.dart';
import 'package:openai_app/constants/theme/colors.dart';
import 'package:openai_app/constants/theme/dimen.dart';
import 'package:openai_app/screen/home/home_screen.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  void toSetupScreen({required BuildContext context}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildImageBackground(),
          const BackgroundGradient(),
          buildNextButton(context, size)
        ],
      ),
    );
  }

  Widget buildNextButton(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Anything you want, just right here at all.",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            SizedBox(
              height: size.height * .05,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kDefaultPadding / 2))),
                onPressed: () => toSetupScreen(context: context),
                child: Text("Get Started",
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImageBackground() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/robot_bg.jpg'),
              fit: BoxFit.cover)),
    );
  }
}