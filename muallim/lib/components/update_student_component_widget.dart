import '../backend/backend.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';


import '../muallim/muallim_drop_down.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_widgets.dart';
import '../widgets/common_widgets.dart';

class UpdateStudentComponentWidget extends StatefulWidget {
  const UpdateStudentComponentWidget({
    Key key,
    this.studentDoc,
  }) : super(key: key);

  final StudentsUsersRecord studentDoc;

  @override
  _UpdateStudentComponentWidgetState createState() =>
      _UpdateStudentComponentWidgetState();
}

class _UpdateStudentComponentWidgetState
    extends State<UpdateStudentComponentWidget> {

  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;

  var dropDownValues = {};

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.studentDoc.email);
    firstNameController =
        TextEditingController(text: widget.studentDoc.firstName);
    lastNameController =
        TextEditingController(text: widget.studentDoc.lastName);
    passwordController =
        TextEditingController(text: widget.studentDoc.password);
  }

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
                              mainHeadline(context, 'Update a student'),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  namesFields(context, 'Enter first name', 'First name..', firstNameController, TextInputType.text),
                                  namesFields(context, 'Enter last name', 'Last name..', lastNameController, TextInputType.text),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  namesFields(context, 'Set password', 'Set password..', passwordController, TextInputType.visiblePassword),
                                  dropDown(context, 'levelValue', 1, ['Qaaidah', 'Naazirah', 'Hifz'], widget.studentDoc.level, 'Quran level..'),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  namesFields(context, 'Set email', 'Set email..', emailController, TextInputType.emailAddress),
                                  dropDown(context, 'genderValue', 1, ['Male', 'Female'], widget.studentDoc.gender, 'Gender..'),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: AutoSizeText(
                                        'Date of birth:',
                                        style: MuallimTheme.of(context)
                                            .subtitle1,
                                      ),
                                    ),
                                    dropDown(context, 'dayValue', 2, days, widget.studentDoc.dob.split("-")[0], 'Day..'),
                                    dropDown(context, 'monthValue', 2, months, widget.studentDoc.dob.split("-")[1], 'Month..'),
                                    dropDown(context, 'yearValue', 3, years, widget.studentDoc.dob.split("-")[2], 'Year..'),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 5),
                                  child: ButtonWidget(
                                    onPressed: () async {
                                      final studentsUsersUpdateData =
                                      createStudentsUsersRecordData(
                                        email: emailController.text,
                                        firstName: firstNameController.text,
                                        gender: dropDownValues['genderValue'],
                                        lastName: lastNameController.text,
                                        password: passwordController.text,
                                        dob:
                                        '${dropDownValues['dayValue']}-${dropDownValues['monthValue']}-${dropDownValues['yearValue']}',
                                        level: dropDownValues['levelValue'],
                                      );
                                      await widget.studentDoc.reference
                                          .update(studentsUsersUpdateData);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Student profile updated.',
                                            style: TextStyle(
                                              color:
                                              MuallimTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                          Duration(milliseconds: 4000),
                                          backgroundColor:
                                          MuallimTheme.of(context)
                                              .primaryText,
                                        ),
                                      );
                                    },
                                    text: 'Update Student',
                                    icon: Icon(
                                      Icons.update_sharp,
                                      color: MuallimTheme.of(context)
                                          .primaryText,
                                      size: 15,
                                    ),
                                    options: ButtonOptions(
                                      width: 200,
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

  Widget dropDown(BuildContext context, dropDownKey, flexValue, options, value, hint){
    return Expanded(
        flex: flexValue,
        child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
        5, 0, 5, 0),
    child: MuallimDropDown(
      initialOption: dropDownValues[dropDownKey] ??=
          value,
      options: options,
      onChanged: (val) =>
          setState(() => dropDownValues[dropDownKey] = val),
      width: 180,
      height: 50,
      textStyle: MuallimTheme.of(context)
          .bodyText1
          .override(
        fontFamily: 'Mukta',
        color: Colors.black,
      ),
      hintText: hint,
      elevation: 2,
      borderColor: MuallimTheme.of(context)
          .primaryText,
      borderWidth: 0,
      borderRadius: 0,
      margin: EdgeInsetsDirectional.fromSTEB(
          12, 4, 12, 4),
      hidesUnderline: true,
    )));
  }
}
