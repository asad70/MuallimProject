import '../auth/auth_util.dart';
import '../backend/backend.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/schema/parents_users_record.dart';
import '../muallim/muallim_drop_down.dart';
import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_widgets.dart';
import '../widgets/common_widgets.dart';

class EditFamComponentWidget extends StatefulWidget {
  const EditFamComponentWidget({
    Key key,
    this.famDocs,
  }) : super(key: key);

  final ParentsUsersRecord famDocs;

  @override
  _EditFamComponentWidgetState createState() => _EditFamComponentWidgetState();
}

class _EditFamComponentWidgetState extends State<EditFamComponentWidget> {
  String relationshipValue;
  TextEditingController emailController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController passwordController;
  TextEditingController phoneNumController;
  TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.famDocs.address);
    emailController = TextEditingController(text: widget.famDocs.email);
    firstNameController = TextEditingController(text: widget.famDocs.firstName);
    lastNameController = TextEditingController(text: widget.famDocs.lastName);
    passwordController = TextEditingController(text: widget.famDocs.password);
    phoneNumController =
        TextEditingController(text: widget.famDocs.phoneNumber);
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
                              mainHeadline(context, 'Edit a Family'),
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

                                  namesFields(context, 'Enter phone number', 'Phone number..', phoneNumController, TextInputType.phone),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  namesFields(context, 'Set email', 'Set email..', emailController, TextInputType.emailAddress),
                                  relnWidget(context),

                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  namesFields(context, 'Add address', 'Add address..', addressController, TextInputType.streetAddress),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 5),
                                  child: ButtonWidget(
                                    onPressed: () async {
                                      final parentsUsersUpdateData =
                                      createParentsUsersRecordData(
                                        email: emailController.text,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        password: passwordController.text,
                                        phoneNumber: phoneNumController.text,
                                        address: addressController.text,
                                        relationshipToStd: relationshipValue,
                                      );
                                      await widget.famDocs.reference
                                          .update(parentsUsersUpdateData);
                                      Navigator.pop(context);
                                    },
                                    text: 'Update Family',
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
  Widget relnWidget(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          5, 10, 5, 0),
      child: MuallimDropDown(
        initialOption: relationshipValue ??=
            widget.famDocs.relationshipToStd,
        options: [
          'Father',
          'Mother',
          'Guardian',
          'Self'
        ],
        onChanged: (val) => setState(
                () => relationshipValue = val),
        width: 180,
        height: 50,
        textStyle: MuallimTheme.of(context)
            .bodyText1
            .override(
          fontFamily: 'Mukta',
          color: Colors.black,
        ),
        hintText: 'Relationship...',
        fillColor: MuallimTheme.of(context)
            .alternate,
        elevation: 2,
        borderColor: MuallimTheme.of(context)
            .primaryText,
        borderWidth: 0,
        borderRadius: 0,
        margin: EdgeInsetsDirectional.fromSTEB(
            12, 4, 12, 4),
        hidesUnderline: true,
      ),
    );
  }
}
