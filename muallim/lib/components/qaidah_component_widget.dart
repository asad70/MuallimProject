import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class QaidahComponentWidget extends StatefulWidget {
  const QaidahComponentWidget({
    Key key,
    this.text,
    this.index,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final String index;
  final int fontSize;

  @override
  _QaidahComponentWidgetState createState() => _QaidahComponentWidgetState();
}

class _QaidahComponentWidgetState extends State<QaidahComponentWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(0),
        ),
        border: Border.all(
          color: Color(0xFF0000FF),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: AutoSizeText(
                widget.index,
                style: MuallimTheme.of(context).bodyText1.override(
                      fontFamily: 'Mukta',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: AutoSizeText(
              functions.getArabicVerion(widget.text),
              style: MuallimTheme.of(context).bodyText1.override(
                    fontFamily: 'meQuran',
                    fontSize: 24,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
