import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../muallim/muallim_icon_button.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/nav/nav.dart';


List<String> days = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'];
List<String> months = ['Jan', 'Feb', 'Mar', 'April', 'May', 'June', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
List<String> years = ['1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022'];


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: SpinKitThreeBounce(
          color: MuallimTheme
              .of(context)
              .secondaryText,
          size: 50,
        ),
      ),
    );
  }
}


Widget navBarItemWidget(BuildContext context, name, page, currentPage, goTo){
  return Expanded(
    flex: 1,
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: InkWell(
        onTap: () async {
          context.pushNamed(goTo);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: MuallimTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(5),
              topLeft: Radius.circular(5),
              topRight: Radius.circular(0),
            ),
            border: Border.all(
              color: MuallimTheme.of(context).primaryText,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (page.toString().toLowerCase() == currentPage)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                  child: Icon(
                    Icons.arrow_right_sharp,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: AutoSizeText(
                  name,
                  style:
                  MuallimTheme.of(context).bodyText1.override(
                    fontFamily: 'Mukta',
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget namesFields(BuildContext context, labelText, hintText, controller, inputType){
  return Expanded(
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          5, 10, 5, 0),
      child: TextFormField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
              MuallimTheme.of(context)
                  .primaryText,
              width: 1,
            ),
            borderRadius:
            const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
              MuallimTheme.of(context)
                  .primaryText,
              width: 1,
            ),
            borderRadius:
            const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          filled: true,
          fillColor:
          MuallimTheme.of(context)
              .alternate,
        ),
        style: MuallimTheme.of(context)
            .bodyText1,
        keyboardType:
        inputType,
      ),
    ),
  );
}


Widget mainHeadline(BuildContext context, text){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
      AutoSizeText(
        text,
        style: MuallimTheme.of(context)
            .title1
            .override(
          fontFamily: 'Mukta',
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      MuallimIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30,
        borderWidth: 1,
        buttonSize: 60,
        icon: Icon(
          Icons.close,
          color: MuallimTheme.of(context)
              .primaryText,
          size: 30,
        ),
        onPressed: () async {
          Navigator.pop(context);
        },
      ),
    ],
  );
}

void routeToPage(BuildContext context, pageName){
  context.goNamed(
    pageName,
    extra: <String, dynamic>{
      kTransitionInfoKey: TransitionInfo(
        hasTransition: true,
        transitionType:
        PageTransitionType.fade,
      ),
    },
  );
}



