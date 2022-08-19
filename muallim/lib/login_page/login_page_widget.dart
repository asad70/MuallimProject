import '../admin_pages/admin_home_widget.dart';
import '../auth/auth_util.dart';
import '../components/nav_bar_comp_widget.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_widgets.dart';
import '../muallim/nav/nav.dart';
import '../student_pages/student_home_widget.dart';
import '../teacher_pages/teacher_home_widget.dart';
import '../customized_actions/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key key,
    this.userType,
  }) : super(key: key);

  final String userType;

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  bool userFound = false;
  bool invalidUsername = false;
  bool invalidPassword = false;

  String userPassword;
  bool userExists;
  TextEditingController emailController;
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MuallimTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: NavBarCompWidget(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        valueOrDefault<String>(
                          '${widget.userType} Login',
                          'Login',
                        ),
                        style: MuallimTheme.of(context).title2.override(
                              fontFamily: 'Mukta',
                              fontSize: 24,
                            ),
                      ),
                    ],
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: MuallimTheme.of(context).alternate,
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.userType != 'Admin')
                          loginTextField(context, 'Enter your username', 'Username..', usernameController, TextInputType.text),
                        if (widget.userType == 'Admin')
                          loginTextField(context, 'Enter your email', 'Email..', emailController, TextInputType.emailAddress),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
                          child: TextFormField(
                            controller: passwordController,
                            autofocus: true,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Enter your password',
                              hintText: 'Password..',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MuallimTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MuallimTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: MuallimTheme.of(context).alternate,
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: MuallimTheme.of(context).bodyText1,
                          ),
                        ),
                        if (widget.userType != 'Admin')
                          nonAdminUser(context),
                        if (invalidUsername)
                          LoginValidity(value: "Username is incorrect."),
                        if (invalidPassword)
                          LoginValidity(value: "Password is incorrect."),
                        if (widget.userType == 'Admin')
                          adminUser(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget loginTextField(BuildContext context, label, hint, controller, type){
    return Padding(
      padding:
      EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
      child: TextFormField(
        controller: controller,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MuallimTheme.of(context).primaryText,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MuallimTheme.of(context).primaryText,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          filled: true,
          fillColor: MuallimTheme.of(context).alternate,
        ),
        style: MuallimTheme.of(context).bodyText1,
        keyboardType: type,
      ),
    );
  }

  Widget adminUser(BuildContext context){
    return Padding(
      padding:
      EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
      child: ButtonWidget(
        onPressed: () async {
          // admin login
          final user = await signInWithEmail(
            context,
            emailController.text,
            passwordController.text,
          );
          if (user == null) {
            return;
          }
          await Future.delayed(
              const Duration(milliseconds: 1000));
          if (valueOrDefault(
              currentUserDocument.accountType, '') ==
              'admin') {
            context.goNamed(
              'adminHome',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType:
                  PageTransitionType.fade,
                ),
              },
            );
          } else if (valueOrDefault(
              currentUserDocument.accountType, '') ==
              'teacher') {
            context.goNamed(
              'teacherHome',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType:
                  PageTransitionType.fade,
                ),
              },
            );
          }
        },
        text: 'Login',
        icon: Icon(
          Icons.login_sharp,
          color: MuallimTheme.of(context).primaryText,
          size: 15,
        ),
        options: ButtonOptions(
          width: double.infinity,
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
    );
  }

  Widget nonAdminUser(BuildContext context){
    return Padding(
      padding:
      EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
      child: ButtonWidget(
        onPressed: () async {
          setState(() => invalidUsername = false);
          setState(() => invalidPassword = false);
          userFound = await actions.checkUserExists(
            usernameController.text,
          );
          if (userFound) {
            userPassword = await actions.getStdPassword(
              usernameController.text,
            );
            if (passwordController.text == userPassword) {
              setState(() => MWAppState().loggedUser =
                  usernameController.text);
              context.goNamed(
                'studentHome',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType:
                    PageTransitionType.fade,
                  ),
                },
              );
            } else {
              setState(() => invalidPassword = true);
            }
          } else {
            setState(() => invalidUsername = true);
          }

          setState(() {});
        },
        text: 'Login',
        icon: Icon(
          Icons.login_sharp,
          color: MuallimTheme.of(context).primaryText,
          size: 15,
        ),
        options: ButtonOptions(
          width: double.infinity,
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
    );
  }
}

class LoginValidity extends StatelessWidget {
  const LoginValidity({Key key, this.value}) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: AutoSizeText(
        '$value',
        style: MuallimTheme.of(context).bodyText1.override(
              fontFamily: 'Mukta',
              color: Color(0xFFB00020),
            ),
      ),
    );
  }
}


