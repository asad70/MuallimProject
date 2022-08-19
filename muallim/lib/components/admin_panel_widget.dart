import '../backend/backend.dart';
import '../components/add_student_component_widget.dart';
import '../components/view_std_bottom_sheet_widget.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AdminPanelWidget extends StatefulWidget {
  const AdminPanelWidget({Key key}) : super(key: key);

  @override
  _AdminPanelWidgetState createState() => _AdminPanelWidgetState();
}

class _AdminPanelWidgetState extends State<AdminPanelWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Color(0xFFF5F5F5),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              'Quick Access',
              style: MuallimTheme.of(context).title3,
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
              child: ButtonWidget(
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: ViewStdBottomSheetWidget(),
                      );
                    },
                  );
                },
                text: 'View/Update Students',
                icon: Icon(
                  Icons.view_agenda,
                  color: MuallimTheme.of(context).primaryText,
                  size: 15,
                ),
                options: ButtonOptions(
                  width: 200,
                  height: 50,
                  color: MuallimTheme.of(context).alternate,
                  textStyle: MuallimTheme.of(context).subtitle1,
                  elevation: 5,
                  borderSide: BorderSide(
                    color: MuallimTheme.of(context).primaryText,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Icon(
              Icons.supervisor_account_rounded,
              color: Color(0xFF101213),
              size: 44,
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 4),
            //   child: FutureBuilder<List<StudentsUsersRecord>>(
            //     future: queryStudentsUsersRecordOnce(),
            //     builder: (context, snapshot) {
            //       // Customize what your widget looks like when it's loading.
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: SizedBox(
            //             width: 50,
            //             height: 50,
            //             child: SpinKitThreeBounce(
            //               color: MuallimTheme.of(context).secondaryText,
            //               size: 50,
            //             ),
            //           ),
            //         );
            //       }
            //       List<StudentsUsersRecord> textStudentsUsersRecordList =
            //           snapshot.data;
            //       return Text(
            //         textStudentsUsersRecordList.length.toString(),
            //         textAlign: TextAlign.center,
            //         style: MuallimTheme.of(context).title1.override(
            //               fontFamily: 'Outfit',
            //               color: Color(0xFF101213),
            //               fontSize: 32,
            //               fontWeight: FontWeight.w600,
            //             ),
            //       );
            //     },
            //   ),
            // ),
            // Text(
            //   'Total Students',
            //   textAlign: TextAlign.center,
            //   style: MuallimTheme.of(context).bodyText2.override(
            //         fontFamily: 'Outfit',
            //         color: Color(0xFF57636C),
            //         fontSize: 14,
            //         fontWeight: FontWeight.normal,
            //       ),
            // ),
          ],
        ),
      ),
    );
  }
}
