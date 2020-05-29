import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wisdyreport/const.dart';

class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute() : super(builder: (BuildContext context) => OpenQuestions());
}

class OpenQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                            iconSize: sizeIcon,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Student no.${Data.studentNo}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                                color: deepBlue),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: sizeIcon + 16,
                          width: sizeIcon + 16,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Open questions',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 29,
                        color: deepBlue),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.93,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Question number',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Points',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 95,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: Data.totalScore,
                          itemBuilder: (BuildContext context, int index) {
                            return ListQuestion(
                              index: index,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonCustom(
                    onPressed: () {},
                    fillColor: deepBlue,
                    splashColor: grey,
                    text: 'Save',
                    textColor: Colors.white,
                    paddingHorizontal: 150.0,
                    paddingVertical: 15.5,
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListQuestion extends StatefulWidget {
  final int index;

  ListQuestion({this.index});

  @override
  _ListQuestionState createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  var txt = TextEditingController();
  int points;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    points = 0;
    txt.text = '$points';

    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0.0,
        child: Container(
          height: 70,
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: grey,
                ),
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.all(15),
                child: Text(
                  '${widget.index + 1}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: deepBlue),
                ),
              ),
              SizedBox(
                width: 90,
              ),
              Expanded(
                  child: IconButton(
                      color: Colors.pinkAccent,
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          points--;
                        });
                      },
                      icon: Icon(Icons.remove))),
              Expanded(
                child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (content) {
                        points = int.parse(content);
                      },
                      textAlign: TextAlign.center,
                      controller: txt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )),
              ),
              Expanded(
                  child: IconButton(
                      color: Colors.pinkAccent,
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          points++;
                          txt.text = '$points';
                        });
                      },
                      icon: Icon(Icons.add))),
            ],
          ),
        ),
      ),
    );
  }
}
