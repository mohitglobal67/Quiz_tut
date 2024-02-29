import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flare_flutter/flare_actor.dart';



class FlagAnimationScreen extends StatefulWidget {
  @override
  _FlagAnimationScreenState createState() => _FlagAnimationScreenState();
}

class _FlagAnimationScreenState extends State<FlagAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jai Shree Ram Flag Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: FlareActor(
                'assets/flag_animation.flr', // replace with the path to your Flare animation file
                animation: 'flag_wave',
              ),
            ),
            SizedBox(height: 20),
            SvgPicture.asset(
              'assets/jai_shree_ram.svg', // replace with the path to your SVG file
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
