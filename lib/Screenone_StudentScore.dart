import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wisdyreport/Screentwo_OpenQuestions.dart';
import 'package:wisdyreport/const.dart';

class StudentScore extends StatefulWidget {
  @override
  _StudentScoreState createState() => _StudentScoreState();
}

class _StudentScoreState extends State<StudentScore>
    with SingleTickerProviderStateMixin {
  double studentPercent;

  void calculatePercentage() {
    studentPercent = Data.score / Data.totalScore * 100;
  }

  AnimationController controller;

  @override
  void initState() {
    calculatePercentage();
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this,
        upperBound: studentPercent);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                    iconSize: 40.0,
                    onPressed: () {
                      Navigator.of(context).push(SecondPageRoute());
                    },
                    icon: Icon(
                      Icons.navigate_next,
                    )),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'W',
                            style: TextStyle(
                              color: deepBlue,
                              fontFamily: 'Rochester',
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            )),
                        TextSpan(
                            text: 'AN',
                            style: TextStyle(
                              color: Colors.pink,
                              fontFamily: 'LuckiestGuy',
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: pinkPurple,
                      ),
                      height: 70,
                      width: 290,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.done,
                              color: deepBlue,
                              size: 40,
                            ),
                          ),
                          Text(
                            'Student no.${Data.studentNo} scanned',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: deepBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Text(
                      'Student score',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 29,
                          color: deepBlue),
                    ),
                  ),
                  CircularPercentIndicator(
                    backgroundColor: Color(0xFFEDEDF7),
                    radius: 190.0,
                    lineWidth: 14.0,
                    percent: controller.value / 100,
                    //animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${(controller.value).toInt()}",
                              style: TextStyle(
                                  fontSize: 65, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 9.0, left: 3.0),
                              child: Text(
                                '%',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '22/30',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    progressColor: deepBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Test: ',
                              style: TextStyle(
                                color: Colors.black,
                              )),
                          TextSpan(
                              text: '${Data.indexTest} of ${Data.amountTest}',
                              style: TextStyle(color: deepBlue)),
                        ],
                      ),
                    ),
                  ),
                  ButtonCustom(
                    onPressed: () {},
                    fillColor: deepBlue,
                    splashColor: grey,
                    text: 'Keep scanning',
                    textColor: Colors.white,
                    paddingHorizontal: 120.0,
                    paddingVertical: 15.5,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ButtonCustom(
                      onPressed: () {},
                      fillColor: Color(0xCCE8E8F3),
                      splashColor: deepBlue,
                      text: 'Complete open Questions',
                      textColor: deepBlue,
                      paddingVertical: 15,
                      paddingHorizontal: 80,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
