import 'package:flutter/material.dart';

class SelectionChip extends StatefulWidget {
  final String text;
  final bool selected;
  final Function onPressed;

  SelectionChip({this.text, this.onPressed, this.selected = false});

  @override
  _SelectionChipState createState() => _SelectionChipState();
}

class _SelectionChipState extends State<SelectionChip> {
  bool selected;

  @override
  void initState() {
    super.initState();
    this.selected = widget.selected;
  }
  
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.text),
      backgroundColor: Colors.grey[300],
      selectedColor: Colors.lightGreenAccent,
      selected: this.selected,
      onSelected: (selected) {
        setState(() {
          this.selected = selected;
          widget.onPressed(selected);
        });
      },
    );
  }
}