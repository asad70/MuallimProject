import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCompWidget extends StatefulWidget {
  const ButtonCompWidget({
    Key key,
    this.buttonText,
    this.textSize,
    this.width,
    this.height,
  }) : super(key: key);

  final String buttonText;
  final double textSize;
  final double width;
  final double height;

  @override
  _ButtonCompWidgetState createState() => _ButtonCompWidgetState();
}

class _ButtonCompWidgetState extends State<ButtonCompWidget> {
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () {
        print('button pressed ...');
      },
      text: widget.buttonText,
      options: ButtonOptions(
        width: widget.width,
        height: widget.height,
        color: MuallimTheme.of(context).alternate,
        textStyle: MuallimTheme.of(context).subtitle1.override(
              fontFamily: 'Mukta',
              fontWeight: FontWeight.normal,
            ),
        elevation: 3,
        borderSide: BorderSide(
          color: MuallimTheme.of(context).primaryText,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
