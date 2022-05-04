// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rate_me/screens/welcome.dart';

class ContentChoice extends StatefulWidget {
  const ContentChoice({Key? key}) : super(key: key);

  static const routeName = '/content-screen';

  @override
  State<ContentChoice> createState() => _ContentChoice();
}

class _ContentChoice extends State<ContentChoice> {
  final List<String> movies = [
    'Comedy',
    'Horror',
    'Old School',
    'Adventure',
    'Drama',
    'Funny',
    'Sci-fi',
    'Action',
    'Romance'
  ];
  List<String> selectedReportList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Which type of content you interest in',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
            ),
            MultiSelectChip(
              movies,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                  color: const Color.fromARGB(255, 0, 48, 137),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen())),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> typeList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.typeList, {required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.typeList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: const TextStyle(fontSize: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: const Color(0xffededed),
          selectedColor: const Color.fromARGB(255, 230, 76, 76),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
