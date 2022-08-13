import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorLegendWidget extends StatefulWidget {
  const ColorLegendWidget({Key key}) : super(key: key);

  @override
  _ColorLegendWidgetState createState() => _ColorLegendWidgetState();
}

class _ColorLegendWidgetState extends State<ColorLegendWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: Container(
                  width: 7,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF0000FF),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: AutoSizeText(
                  'Assigned/To do',
                  style: MuallimTheme.of(context).bodyText1.override(
                        fontFamily: 'Mukta',
                        fontSize: 17,
                      ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: Container(
                  width: 7,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFF00),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: AutoSizeText(
                  'Practiced',
                  style: MuallimTheme.of(context).bodyText1.override(
                        fontFamily: 'Mukta',
                        fontSize: 17,
                      ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: Container(
                  width: 7,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF228B22),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: AutoSizeText(
                  'Accepted',
                  style: MuallimTheme.of(context).bodyText1.override(
                        fontFamily: 'Mukta',
                        fontSize: 17,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
