
import '../home_page/home_page_widget.dart';
import '../login_page/login_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import '../muallim/nav/nav.dart';

class NavBarCompWidget extends StatefulWidget {
  const NavBarCompWidget({Key key}) : super(key: key);

  @override
  _NavBarCompWidgetState createState() => _NavBarCompWidgetState();
}

class _NavBarCompWidgetState extends State<NavBarCompWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () async {
                context.pushNamed(
                  'HomePage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                    ),
                  },
                );
              },
              child: AutoSizeText(
                'Muallim',
                style: MuallimTheme.of(context).title1.override(
                  fontFamily: 'Mukta',
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: ButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'loginPage',
                        queryParams: {
                          'userType':
                          serializeParam('Student', ParamType.String),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    text: 'Student Login',
                    icon: Icon(
                      Icons.login_sharp,
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
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: ButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'loginPage',
                          queryParams: {
                            'userType':
                            serializeParam('Admin', ParamType.String),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      text: 'Admin/Teacher Login',
                      icon: Icon(
                        Icons.person_sharp,
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
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: ButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'loginPage',
                          queryParams: {
                            'userType':
                            serializeParam('Parents', ParamType.String),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      text: 'Parents Login',
                      icon: Icon(
                        Icons.person_outline_sharp,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
