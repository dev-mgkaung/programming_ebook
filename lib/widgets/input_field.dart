import 'package:flutter/material.dart';


class FlutterInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator validator;
  final TextInputType keyboard;
  final FocusNode focusNode;
  final VoidCallback onFinished;
  final bool isPassword;
  final double horizontalPadding;
  final Function onValueChanged;
  final String error;

  const FlutterInputField(
      {Key key,
      @required this.controller,
      this.hint,
      this.validator,
      this.keyboard = TextInputType.text,
      this.focusNode,
      this.onFinished,
      this.isPassword = false,
      this.horizontalPadding = 16.0,
      this.onValueChanged,
      this.error})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlutterInputFieldState();
  }
}

class FlutterInputFieldState extends State<FlutterInputField> {
  String error;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    error = widget.error;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            shape: error != null
                ? RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius:
                        BorderRadius.circular(20),
                  )
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius:
                        BorderRadius.circular(10),
                  ),

            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: TextField(
                onChanged: (value) => widget.onValueChanged(value),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboard,
                obscureText: widget.isPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.hint,
                    hintText: widget.hint,
                    suffixIcon: error != null
                        ? Icon(
                            Icons.close,
                            color: Colors.red,
                          )
                        : isChecked ? Icon(Icons.done) : null,
                    hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ),
          error == null
              ? Container()
              : Text(error, style: TextStyle(color: Colors.red, fontSize: 12),)
        ],
      ),
    );
  }

  String validate() {
    setState(() {
      error = widget.validator(widget.controller.text);
    });
    return error;
  }
}
