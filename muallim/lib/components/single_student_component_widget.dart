import '../backend/backend.dart';
import '../components/update_student_component_widget.dart';
import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleStudentComponentWidget extends StatefulWidget {
  const SingleStudentComponentWidget({
    Key key,
    this.studentDoc,
  }) : super(key: key);

  final StudentsUsersRecord studentDoc;

  @override
  _SingleStudentComponentWidgetState createState() =>
      _SingleStudentComponentWidgetState();
}

class _SingleStudentComponentWidgetState
    extends State<SingleStudentComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MuallimTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x2E000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: MuallimTheme.of(context).primaryBackground,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: MuallimTheme.of(context).primaryColor,
                            size: 24,
                          ),
                        ),
                      ),
                      Text(
                        '${widget.studentDoc.firstName} ${widget.studentDoc.lastName}',
                        style: MuallimTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MuallimIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 25,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.edit_sharp,
                          color: MuallimTheme.of(context).primaryText,
                          size: 25,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: UpdateStudentComponentWidget(
                                  studentDoc: widget.studentDoc,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      MuallimIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 25,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.delete_sharp,
                          color: MuallimTheme.of(context).primaryText,
                          size: 25,
                        ),
                        onPressed: () async {
                          await widget.studentDoc.reference.delete();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.star_sharp,
                        color: MuallimTheme.of(context).primaryText,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.studentDoc.level,
                          style: MuallimTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Icon(
                          Icons.email_sharp,
                          color: MuallimTheme.of(context).primaryText,
                          size: 20,
                        ),
                      ),
                      Text(
                        widget.studentDoc.email,
                        style: MuallimTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.person_outline_sharp,
                        color: MuallimTheme.of(context).primaryText,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.studentDoc.gender,
                          style: MuallimTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.security_sharp,
                        color: MuallimTheme.of(context).primaryText,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.studentDoc.password,
                          style: MuallimTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.date_range_sharp,
                        color: MuallimTheme.of(context).primaryText,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                           widget.studentDoc.dob,
                          style: MuallimTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //  nameRating Widget...
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.place_sharp,
                        color: MuallimTheme.of(context).primaryText,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.studentDoc.address,
                          style: MuallimTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.person,
                        color: MuallimTheme.of(context).primaryText,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.studentDoc.reference.id,
                          style: MuallimTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: MuallimTheme.of(context).primaryText,
            ),
          ],
        ),
      ),
    );
  }
}
