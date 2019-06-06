import 'package:flutter/material.dart';

class ChoiceChips extends StatefulWidget {
  final List<String> choices;
  final Function onPressed;
  final int selected;

  ChoiceChips({this.choices, this.onPressed, this.selected});

  @override
  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: List.generate(widget.choices.length, (index) {
        final String selection = widget.choices[index];
        return ChoiceChip(
          label: Text(selection),
          backgroundColor: Colors.grey[300],
          selectedColor: Colors.lightGreenAccent,
          selected: index == selected,
          onSelected: (selected) {
            setState(() {
              this.selected = index;
              widget.onPressed(selection);
            });
          },
        );
      }),
    );
  }
}