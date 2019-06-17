import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class DevUpFormField extends StatelessWidget {
  final String iconPath;
  final String hintText;
  final bool hideText;
  final TextInputType inputType;

  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool autoValidate;
  final List<TextInputFormatter> formatters;
  final EdgeInsets margin;
  final String initialValue;
  final double width;
  final double height;
  final String label;
  final int maxLines;

  const DevUpFormField({
    Key key,
    this.iconPath,
    this.hintText,
    this.hideText = false,
    this.inputType = TextInputType.text,
    this.onSaved,
    this.validator,
    this.controller,
    this.autoValidate = false,
    this.formatters,
    this.margin = const EdgeInsets.only(top: 11.0),
    this.width,
    this.height = 45.0,
    this.initialValue,
    this.maxLines = 1,
    
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label,
                  textAlign: TextAlign.left,
                )
              : SizedBox(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: width,
            height: height,
            child: TextFormField(
                initialValue: initialValue,
                inputFormatters: formatters,
                autovalidate: autoValidate,
                controller: controller,
                onSaved: onSaved,
                validator: validator,
                keyboardType: inputType,
                obscureText: hideText,
                maxLines: maxLines,
                style: Theme.of(context).textTheme.body1,
                decoration: new InputDecoration(
                    prefixIcon: iconPath != null
                        ? Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            width: 22.0,
                            height: 22.0,
                            child: SvgPicture.asset(iconPath,
                                color: const Color(0xff999999)))
                        : null,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: const Color(0xff666666),
                      fontFamily: 'Roboto-Light',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ))),
          ),
        ],
      ),
    );
  }
}
