import 'package:auto_size_text/auto_size_text.dart';
import 'package:muallim/components/edit_fam_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/schema/parents_users_record.dart';
import '../components/add_fam_component_widget.dart';
import '../components/add_student_component_widget.dart';
import '../customized_actions/actions/index.dart' as actions;
import '../components/admin_nav_bar_widget.dart';
import '../components/update_student_component_widget.dart';
import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StudentRegistrationWidget extends StatefulWidget {
  const StudentRegistrationWidget({Key key}) : super(key: key);


  @override
  _StudentRegistrationWidgetState createState() =>
      _StudentRegistrationWidgetState();
}

class _StudentRegistrationWidgetState extends State<StudentRegistrationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool showStudents = false;
  List<DocumentReference> studentDocs = [];

  ScrollController _controller = new ScrollController();
  ScrollController _scrollController = new ScrollController();

  DocumentReference currentFamClicked;
  String currentFamClickedName = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MuallimTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AuthUserStreamWidget(
                        child: AdminNavBarWidget(
                          currentPage: 'registration',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Container(
                              width: width * 0.5,
                                height: height * 1,
                                decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    famHeader(context),
                                Expanded(

                                child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 10, 0),
                                      child: AuthUserStreamWidget(
                                        child: Builder(
                                          builder: (context) {
                                            final familiesLinked =
                                                (currentUserDocument.families
                                                    .toList() ?? [])
                                                    .toList();

                                            return ListView.builder(
                                              physics: const AlwaysScrollableScrollPhysics(), // new
                                              controller: _controller,
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: familiesLinked.length,
                                              itemBuilder: (context,
                                                  familiesLinkedIndex) {
                                                final familiesLinkedItem =
                                                    familiesLinked[
                                                        familiesLinkedIndex];
                                                return
                                                  StreamBuilder<ParentsUsersRecord>(
                                                    stream: ParentsUsersRecord.getDocument(familiesLinkedItem),
                                                    builder: (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child: SpinKitThreeBounce(
                                                              color: MuallimTheme.of(context).secondaryText,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final columnParentsUsersRecord = snapshot.data;
                                                      return Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          parentsUserRecord(context, columnParentsUsersRecord),
                                                          AutoSizeText(
                                                            columnParentsUsersRecord
                                                                .email,
                                                            style: MuallimTheme.of(context).subtitle1,
                                                          ),
                                                          Divider(
                                                            thickness: 0.5,
                                                            indent: 10,
                                                            endIndent: 10,
                                                            color: MuallimTheme.of(context).primaryText,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  )
                                                ;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                  ))],
                                ),
                            ))),
                            if (!showStudents)
                              Container(
                              width: width * 0.5,
                            ),

                            if (showStudents)

                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 5,
                                  child: Container(
                                    width: width * 0.5,
                                    height: height * 1,
                                    decoration: BoxDecoration(
                                      color: MuallimTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          stdHeader(context),
                                          Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                                            child: Builder(
                                              builder: (context) {
                                                final studentsOfFam = studentDocs;
                                                return ListView.builder(
                                                  physics: const AlwaysScrollableScrollPhysics(), // new
                                                  controller: _scrollController,
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: studentsOfFam.length,
                                                  itemBuilder: (context, studentsOfFamIndex) {
                                                    final studentsOfFamItem = studentsOfFam[studentsOfFamIndex];
                                                    return StreamBuilder<StudentsUsersRecord>(
                                                      stream: StudentsUsersRecord.getDocument(studentsOfFamItem),
                                                      builder: (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child: SpinKitThreeBounce(
                                                                color: MuallimTheme.of(context).secondaryText,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final columnStudentsUsersRecord = snapshot.data;
                                                        return printStudetsData(context, columnStudentsUsersRecord, currentFamClicked);
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                          )],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget parentsUserRecord(BuildContext context, columnParentsUsersRecord){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: InkWell(
              onTap: () async {
                setState(() => studentDocs = columnParentsUsersRecord.studentLinks.toList());
                setState(() => showStudents = true);
                setState(() => currentFamClicked = columnParentsUsersRecord.reference);
                setState(() => currentFamClickedName = '${columnParentsUsersRecord.firstName} ${columnParentsUsersRecord.lastName}');
              },

              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    '${columnParentsUsersRecord.firstName} ${columnParentsUsersRecord.lastName}',
                    style: MuallimTheme.of(context).title2,
                  ),
                  Icon(
                    Icons.arrow_right_sharp,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            )),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MuallimIconButton(
              borderColor: Colors.transparent,
              borderWidth: 1,
              buttonSize: 60,
              fillColor: MuallimTheme.of(context).primaryText,
              icon: Icon(
                Icons.delete_sharp,
                color: MuallimTheme.of(context).alternate,
                size: 30,
              ),
              onPressed: () async {
                await columnParentsUsersRecord.reference.delete();
                final usersUpdateData = {
                  'families': FieldValue.arrayRemove(
                      [columnParentsUsersRecord.reference]),
                };
                await currentUserReference.update(usersUpdateData);

              },
            ),
            MuallimIconButton(
              borderColor: Colors.transparent,
              borderWidth: 1,
              buttonSize: 60,
              fillColor: MuallimTheme.of(context).secondaryText,
              icon: Icon(
                Icons.edit_sharp,
                color: MuallimTheme.of(context).alternate,
                size: 30,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: EditFamComponentWidget(
                        famDocs: columnParentsUsersRecord,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget famHeader(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: AutoSizeText(
            'Families',
            style: MuallimTheme.of(context)
                .title2
                .override(
              fontFamily: 'Mukta',
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor:
                Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding:
                    MediaQuery.of(context)
                        .viewInsets,
                    child:
                    AddFamComponentWidget(),
                  );
                },
              );
            },
            text: 'Add Family',
            icon: Icon(
              Icons.group_add,
              color:
              MuallimTheme.of(context)
                  .primaryText,
              size: 15,
            ),
            options: ButtonOptions(
              width: 150,
              height: 40,
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
      ],
    );
  }
  Widget stdHeader(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: AutoSizeText(
            'Add student to $currentFamClickedName family',
            maxLines: 2,
            style: MuallimTheme.of(
                context)
                .title2
                .override(
              fontFamily: 'Mukta',
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(isScrollControlled: true, backgroundColor: Colors.transparent, context: context,
                builder: (context) {
                  return Padding(
                    padding:
                    MediaQuery.of(
                        context)
                        .viewInsets,
                    child:
                    AddStudentComponentWidget(famClicked: currentFamClicked),
                  );
                },
              );
            },
            text: 'Add Student',
            icon: Icon(
              Icons.add_sharp,
              color: MuallimTheme.of(
                  context)
                  .primaryText,
              size: 15,
            ),
            options: ButtonOptions(
              width: 150,
              height: 40,
              color: MuallimTheme.of(
                  context)
                  .alternate,
              textStyle:
              MuallimTheme.of(
                  context)
                  .subtitle1,
              elevation: 5,
              borderSide: BorderSide(
                color:
                MuallimTheme.of(
                    context)
                    .primaryText,
                width: 1,
              ),
              borderRadius:
              BorderRadius.circular(
                  5),
            ),
          ),
        ),
        MuallimIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.close_sharp,
            color: MuallimTheme.of(
                context)
                .primaryText,
            size: 30,
          ),
          onPressed: () async {
            setState(() => showStudents = false);
          },
        ),
      ],
    );
  }
}


Widget printStudetsData(BuildContext context, columnStudentsUsersRecord, currentFamClicked){
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  columnStudentsUsersRecord.firstName + " " + columnStudentsUsersRecord.lastName,
                  style: MuallimTheme.of(context).title2,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MuallimIconButton(
                borderColor: Colors.transparent,
                borderWidth: 1,
                buttonSize: 60,
                fillColor:
                MuallimTheme.of(context).primaryText,
                icon: Icon(
                  Icons.delete_sharp,
                  color: MuallimTheme.of(context).alternate,
                  size: 30,
                ),
                onPressed: () async {
                  await columnStudentsUsersRecord.reference.delete();
                  final parentsUsersUpdateData = {
                    'studentLinks':
                    FieldValue.arrayRemove([columnStudentsUsersRecord.reference]),
                  };
                  await currentFamClicked.update(parentsUsersUpdateData);
                },
              ),
              MuallimIconButton(
                borderColor: Colors.transparent,
                borderWidth: 1,
                buttonSize: 60,
                fillColor:
                MuallimTheme.of(context).secondaryText,
                icon: Icon(
                  Icons.edit_sharp,
                  color: MuallimTheme.of(context).alternate,
                  size: 30,
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
                          studentDoc: columnStudentsUsersRecord,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
      AutoSizeText(
        columnStudentsUsersRecord.email,
        style: MuallimTheme.of(context).subtitle1,
      ),
      Divider(
        thickness: 0.5,
        indent: 10,
        endIndent: 10,
        color: MuallimTheme.of(context).primaryText,
      ),
    ],
  );
}
