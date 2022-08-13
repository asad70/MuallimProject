import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../student_pages/student_home_widget.dart';
import '../student_pages/student_naazirah_widget.dart';
import '../student_pages/student_qaaidah_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common_widgets.dart';

class StudentNavBarWidget extends StatefulWidget {
  const StudentNavBarWidget({
    Key key,
    this.currentPage,
  }) : super(key: key);

  final String currentPage;

  @override
  _StudentNavBarWidgetState createState() => _StudentNavBarWidgetState();
}

class _StudentNavBarWidgetState extends State<StudentNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  'Muallim Student',
                  style: MuallimTheme.of(context).title1.override(
                        fontFamily: 'Mukta',
                        fontSize: 25,
                      ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  'Logged in as: ${MWAppState().loggedUser}',
                  textAlign: TextAlign.start,
                  style: MuallimTheme.of(context).subtitle1.override(
                        fontFamily: 'Mukta',
                        fontSize: 16,
                      ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: ButtonWidget(
                    onPressed: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: HomePageWidget(),
                        ),
                        (r) => false,
                      );
                      setState(() => MWAppState().loggedUser = '');

                    },
                    text: 'Logout',
                    icon: Icon(
                      Icons.logout,
                      color: MuallimTheme.of(context).primaryText,
                      size: 15,
                    ),
                    options: ButtonOptions(
                      width: 200,
                      height: 50,
                      color: Color(0xE1FFFFFF),
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
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            navBarItemWidget(context, 'Home', 'home', widget.currentPage, StudentHomeWidget()),
            navBarItemWidget(context, 'Qaaidah', 'qaaidah', widget.currentPage, StudentQaaidahWidget()),
            navBarItemWidget(context, 'Naazirah', 'naazirah', widget.currentPage, StudentNaazirahWidget()),
            navBarItemWidget(context, 'Hifz', 'hifz', widget.currentPage, StudentNaazirahWidget()),
          ],
        ),
      ],
    );
  }
}
