import '../components/add_student_component_widget.dart';
import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentAddedCompWidget extends StatefulWidget {
  const StudentAddedCompWidget({
    Key key,
    this.username,
    this.buttonText,
    this.currentFamClicked,
  }) : super(key: key);

  final String username;
  final String buttonText;
  final DocumentReference currentFamClicked;


  @override
  _StudentAddedCompWidgetState createState() => _StudentAddedCompWidgetState();
}
  DocumentReference currentFamClicked;


class _StudentAddedCompWidgetState extends State<StudentAddedCompWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: MuallimTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    '${widget.username} have been added.',
                                    style: MuallimTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Mukta',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  MuallimIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.close,
                                      color: MuallimTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 10, 5),
                                  child: ButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: AddStudentComponentWidget(famClicked: widget.currentFamClicked),
                                          );
                                        },
                                      );
                                    },
                                    text: widget.buttonText,
                                    icon: Icon(
                                      Icons.add_circle_sharp,
                                      color: MuallimTheme.of(context)
                                          .primaryText,
                                      size: 15,
                                    ),
                                    options: ButtonOptions(
                                      width: 300,
                                      height: 50,
                                      color: MuallimTheme.of(context)
                                          .alternate,
                                      textStyle: MuallimTheme.of(context)
                                          .subtitle1,
                                      elevation: 5,
                                      borderSide: BorderSide(
                                        color: MuallimTheme.of(context)
                                            .primaryText,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
