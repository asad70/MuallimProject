import '../backend/backend.dart';
import '../components/single_student_component_widget.dart';
import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ViewStdBottomSheetWidget extends StatefulWidget {
  const ViewStdBottomSheetWidget({Key key}) : super(key: key);

  @override
  _ViewStdBottomSheetWidgetState createState() =>
      _ViewStdBottomSheetWidgetState();
}

class _ViewStdBottomSheetWidgetState extends State<ViewStdBottomSheetWidget> {
  List<StudentsUsersRecord> simpleSearchResults = [];
  TextEditingController searchFieldController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
    MWAppState().showFullSearch = true;
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
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: MuallimTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: searchFieldController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'searchFieldController',
                                  Duration(milliseconds: 200),
                                  () async {
                                    await queryStudentsUsersRecordOnce()
                                        .then(
                                          (records) => simpleSearchResults =
                                              TextSearch(
                                            records
                                                .map(
                                                  (record) =>
                                                      TextSearchItem(record, [
                                                    record.email,
                                                    record.firstName,
                                                    record.gender,
                                                    record.lastName,
                                                    record.phoneNumber,
                                                        record.level,
                                                        record.reference.id
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                                  .search(searchFieldController
                                                      .text)
                                                  .map((r) => r.object)
                                                  .toList(),
                                        )
                                        .onError(
                                            (_, __) => simpleSearchResults = [])
                                        .whenComplete(() => setState(() {}));

                                    setState(() =>
                                        MWAppState().showFullSearch = false);
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Search for student',
                                  hintText: 'Search..',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MuallimTheme.of(context)
                                          .primaryText,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MuallimTheme.of(context)
                                          .primaryText,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      MuallimTheme.of(context).alternate,
                                  prefixIcon: Icon(
                                    Icons.search_sharp,
                                  ),
                                ),
                                style: MuallimTheme.of(context).bodyText1,
                              ),
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
                            color: MuallimTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    // if (MWAppState().showFullSearch)
                    //   Expanded(
                    //     child: FutureBuilder<List<StudentsUsersRecord>>(
                    //       future: queryStudentsUsersRecordOnce(),
                    //       builder: (context, snapshot) {
                    //         // Customize what your widget looks like when it's loading.
                    //         if (!snapshot.hasData) {
                    //           return Center(
                    //             child: SizedBox(
                    //               width: 50,
                    //               height: 50,
                    //               child: SpinKitThreeBounce(
                    //                 color: MuallimTheme.of(context)
                    //                     .secondaryText,
                    //                 size: 50,
                    //               ),
                    //             ),
                    //           );
                    //         }
                    //         List<StudentsUsersRecord>
                    //             listViewStudentsUsersRecordList = snapshot.data;
                    //         return ListView.builder(
                    //           controller: _scrollController,
                    //           padding: EdgeInsets.zero,
                    //           shrinkWrap: true,
                    //           scrollDirection: Axis.vertical,
                    //           itemCount: listViewStudentsUsersRecordList.length,
                    //           itemBuilder: (context, listViewIndex) {
                    //             final listViewStudentsUsersRecord =
                    //                 listViewStudentsUsersRecordList[
                    //                     listViewIndex];
                    //             return Padding(
                    //               padding: EdgeInsetsDirectional.fromSTEB(
                    //                   10, 0, 10, 5),
                    //               child: SingleStudentComponentWidget(
                    //                 studentDoc: listViewStudentsUsersRecord,
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       },
                    //     ),
                    //   ),
                    if (!MWAppState().showFullSearch)
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final searchChild = simpleSearchResults.toList();
                            return ListView.builder(
                              controller: _scrollController,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searchChild.length,
                              itemBuilder: (context, searchChildIndex) {
                                final searchChildItem =
                                    searchChild[searchChildIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 5),
                                  child: SingleStudentComponentWidget(
                                    studentDoc: searchChildItem,
                                  ),
                                );
                              },
                            );
                          },
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
