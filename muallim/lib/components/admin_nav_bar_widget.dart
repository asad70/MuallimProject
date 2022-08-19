import 'package:muallim/components/student_nav_bar_widget.dart';

import '../admin_pages/admin_home_widget.dart';
import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../admin_pages/student_registration_widget.dart';
import '../muallim/nav/nav.dart';
import '../student_pages/student_home_widget.dart';
import '../widgets/common_widgets.dart';

class AdminNavBarWidget extends StatefulWidget {
  const AdminNavBarWidget({
    Key key,
    this.currentPage,
  }) : super(key: key);

  final String currentPage;

  @override
  _AdminNavBarWidgetState createState() => _AdminNavBarWidgetState();
}

class _AdminNavBarWidgetState extends State<AdminNavBarWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

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
                  'Muallim Admin',
                  style: MuallimTheme.of(context).title1.override(
                        fontFamily: 'Mukta',
                        fontSize: 25,
                      ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AuthUserStreamWidget(
                  child: AutoSizeText(
                    'Logged in as: ${currentUserDisplayName}',
                    textAlign: TextAlign.start,
                    style: MuallimTheme.of(context).subtitle1.override(
                          fontFamily: 'Mukta',
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: ButtonWidget(
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();
                      context.goNamedAuth(
                        'HomePage',
                        mounted,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
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
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            navBarItemWidget(context, 'Home', 'home', widget.currentPage, 'adminHome'),
            navBarItemWidget(context, 'Student Registration', 'registration', widget.currentPage, 'studentRegistration'),
            navBarItemWidget(context, 'Home', 'home', widget.currentPage, 'adminHome'),
            navBarItemWidget(context, 'Home', 'home', widget.currentPage, 'adminHome'),
          ],
        ),
      ],
    );
  }

}
