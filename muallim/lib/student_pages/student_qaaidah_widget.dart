import '../components/color_legend_widget.dart';
import '../components/student_nav_bar_widget.dart';
import '../muallim/muallim_drop_down.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../customized_actions/actions/index.dart' as actions;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class StudentQaaidahWidget extends StatefulWidget {
  const StudentQaaidahWidget({
    Key key,
    this.page,
    this.fontSize,
  }) : super(key: key);

  final String page;
  final int fontSize;

  @override
  _StudentQaaidahWidgetState createState() => _StudentQaaidahWidgetState();
}

class _StudentQaaidahWidgetState extends State<StudentQaaidahWidget> {
  String pageNumValue;
  String textSizeValue;
  int size;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();

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
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StudentNavBarWidget(
                        currentPage: 'qaaidah',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: ColorLegendWidget(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Text(
                              'Font Size:',
                              textAlign: TextAlign.end,
                              style: MuallimTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Mukta',
                                fontSize: 18,
                              ),
                            ),
                          ),
                          MuallimDropDown(
                            initialOption: textSizeValue ??= '30',
                            options: ['30', '34','38','42','46','50'],
                            onChanged: (val) =>
                                setState(() => textSizeValue = val),
                            width: width / 5,
                            height: 40,
                            textStyle:
                            MuallimTheme.of(context).bodyText1.override(
                              fontFamily: 'Mukta',
                              color: Colors.black,
                            ),
                            hintText: 'Page Number',
                            elevation: 1,
                            borderColor:
                            MuallimTheme.of(context).primaryText,
                            borderWidth: 1,
                            borderRadius: 0,
                            margin:
                            EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Text(
                              'Page Number:',
                              textAlign: TextAlign.end,
                              style: MuallimTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Mukta',
                                fontSize: 18,
                              ),
                            ),
                          ),
                          MuallimDropDown(
                            initialOption: pageNumValue ??= '1',
                            options: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'],
                            onChanged: (val) =>
                                setState(() =>
                                MWAppState().currentPageJS = MWAppState().qaida["page" + val]),
                            //  pageNumValue = val),
                            width: width / 5,
                            height: 40,
                            textStyle:
                            MuallimTheme.of(context).bodyText1.override(
                              fontFamily: 'Mukta',
                              color: Colors.black,
                            ),
                            hintText: 'Page Number',
                            elevation: 1,
                            borderColor:
                            MuallimTheme.of(context).primaryText,
                            borderWidth: 1,
                            borderRadius: 0,
                            margin:
                            EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //  code for this GridView Widget...
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Builder(
                      builder: (context) {
                        final qaidaItem2 = getJsonField(
                          MWAppState().currentPageJS,
                          r'''$''',
                        ).toList();
                        if (int.parse(pageNumValue) < 9){
                          size = 3;
                        } else if ((int.parse(pageNumValue) >= 9) && width < height){
                          size = 2;
                        }
                        return Directionality(
                          textDirection: ui.TextDirection.rtl,
                            child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: DynamicHeightGridView(
                              controller: _scrollController,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 3,
                              itemCount: qaidaItem2.length,
                              builder: (context, qaidaItem2Index) {
                                final qaidaItem2Item = qaidaItem2[qaidaItem2Index];
                                String item = functions.getArabicVerion(getJsonField(qaidaItem2Item,r'''$''',).replaceAll(RegExp(r'[\s\t\n]+'), ''));
                                return printQaaidahLetter(context, qaidaItem2Index, item);
                              },
                            )));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget printQaaidahLetter(BuildContext context, qaidaItem2Index, item){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 4, 10, 4),
          child: Text(
            (qaidaItem2Index + 1).toString(),
            style: MuallimTheme.of(context).bodyText1.override(
              fontFamily: 'Mukta',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          height: 200,
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
          child: Align(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                item,
                softWrap:false,
                style: MuallimTheme.of(context).bodyText1.override(
                  fontFamily: 'meQuran',
                  fontSize: double.parse(textSizeValue),
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: false,
                ),
              ),
            ),
          ),
        )],
    );
  }
}
