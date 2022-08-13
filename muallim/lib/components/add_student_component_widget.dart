import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/student_added_comp_widget.dart';
import '../muallim/muallim_drop_down.dart';
import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import 'dart:ui';
import '../customized_actions/actions/index.dart' as actions;
import '../muallim/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common_widgets.dart';

class AddStudentComponentWidget extends StatefulWidget {
  const AddStudentComponentWidget({
    Key key,
    this.famClicked,
  }) : super(key: key);

  final DocumentReference famClicked;

  @override
  _AddStudentComponentWidgetState createState() =>
      _AddStudentComponentWidgetState();
}

class _AddStudentComponentWidgetState extends State<AddStudentComponentWidget> {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  bool usernameExists = false;
  StudentsUsersRecord addedUser;

  String generatedUsername;

  var dropDownValues = {};


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    passwordController = TextEditingController();
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
                              mainHeadline(context, 'Add a student'),
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
                                  dropDown(context, 'levelValue', 1, ['Qaaidah', 'Naazirah', 'Hifz'], 'Quran level..'),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  namesFields(context, 'Set email', 'Set email..', emailController, TextInputType.emailAddress),
                                  dropDown(context, 'genderValue', 1, ['Male', 'Female'], 'Gender..'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              5, 10, 5, 5),
                                          child: ButtonWidget(
                                            onPressed: () async {
                                              setState(() => generatedUsername =
                                              '${firstNameController.text.toLowerCase().replaceAll(" ", "")}.${lastNameController.text.toLowerCase().replaceAll(" ", "")}${random_data.randomInteger(0, 99).toString()}');
                                              usernameExists =
                                              await actions.checkUserExists(
                                                generatedUsername,
                                              );

                                              setState(() {});
                                            },
                                            text: 'Generate Username',
                                            icon: FaIcon(
                                              FontAwesomeIcons.random,
                                              color:
                                              MuallimTheme.of(context)
                                                  .primaryText,
                                            ),
                                            options: ButtonOptions(
                                              width: 200,
                                              height: 50,
                                              color:
                                              MuallimTheme.of(context)
                                                  .alternate,
                                              textStyle:
                                              MuallimTheme.of(context)
                                                  .subtitle1,
                                              elevation: 5,
                                              borderSide: BorderSide(
                                                color:
                                                MuallimTheme.of(context)
                                                    .primaryText,
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (usernameExists ?? true)
                                    usernameText(context, "isn't available", 0xFFFF0000),
                                  if (!usernameExists ?? true)
                                    usernameText(context, "is available", 0xFF32CD32),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: AutoSizeText(
                                      'Date of birth:',
                                      style: MuallimTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ),
                                  dropDown(context, 'dayValue', 2, days, 'Day..'),
                                  dropDown(context, 'monthValue', 2, months, 'Month..'),
                                  dropDown(context, 'yearValue', 3, years, 'Year..'),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 5),
                                  child: ButtonWidget(
                                    onPressed: () async {
                                      final studentsUsersCreateData =
                                      createStudentsUsersRecordData(
                                        email: emailController.text,
                                        firstName: firstNameController.text,
                                        gender: dropDownValues['genderValue'],
                                        lastName: lastNameController.text,
                                        password: passwordController.text,
                                        dob:
                                        '${dropDownValues['dayValue']}-${dropDownValues['monthValue']}-${dropDownValues['yearValue']}',
                                        adminLink: currentUserReference,
                                        level: dropDownValues['levelValue'],
                                        parentsLink: widget.famClicked,
                                      );
                                      var studentsUsersRecordReference =
                                      StudentsUsersRecord.collection.doc(generatedUsername);
                                      await studentsUsersRecordReference
                                          .set(studentsUsersCreateData);
                                      addedUser = StudentsUsersRecord
                                          .getDocumentFromData(
                                          studentsUsersCreateData,
                                          studentsUsersRecordReference);

                                      final parentsUsersUpdateData = {
                                        'studentLinks': FieldValue.arrayUnion(
                                            [addedUser.reference]),
                                      };
                                      await widget.famClicked
                                          .update(parentsUsersUpdateData);
                                      Navigator.pop(context);
                                      // await showModalBottomSheet(
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return Padding(
                                      //       padding: MediaQuery.of(context)
                                      //           .viewInsets,
                                      //
                                      //     );
                                      //   },
                                      // );
                                      setState(()  {});
                                    },
                                    text: 'Add Student',
                                    icon: Icon(
                                      Icons.add_sharp,
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
  Widget usernameText(BuildContext context, text, color){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          0, 5, 0, 0),
      child: AutoSizeText(
        valueOrDefault<String>(
          '$generatedUsername $text',
          '‎',
        ),
        style: MuallimTheme.of(context)
            .subtitle1
            .override(
          fontFamily: 'Mukta',
          color: Color(color),
        ),
      ),
    );
  }

  Widget dropDown(BuildContext context, dropDownKey, flexValue, options, hint){
    return Expanded(
        flex: flexValue,
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                5, 0, 5, 0),
            child: MuallimDropDown(
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
