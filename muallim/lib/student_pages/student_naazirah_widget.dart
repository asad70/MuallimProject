import 'dart:async';
import 'dart:convert';
import 'package:built_value/json_object.dart';
import 'package:muallim/backend/api_requests/api_manager.dart';
import 'package:muallim/index.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/color_legend_widget.dart';
import '../components/student_nav_bar_widget.dart';
import '../muallim/muallim_drop_down.dart';
import '../muallim/muallim_theme.dart';
import '../muallim/muallim_util.dart';
import '../muallim/muallim_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'dart:developer';
import 'dart:ui' as ui;

class StudentNaazirahWidget extends StatefulWidget {
  const StudentNaazirahWidget({
    Key key,
    this.page,
    this.fontSize,
  }) : super(key: key);

  final String page;
  final int fontSize;

  @override
  _StudentNaazirahWidgetState createState() => _StudentNaazirahWidgetState();
}

class _StudentNaazirahWidgetState extends State<StudentNaazirahWidget> {
  AudioPlayer soundPlayer;
  String pageNumValue;
  String textSizeValue;
  int chapterNum = 1;
  String firstAyahChapter;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MuallimTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: StudentNavBarWidget(
                          currentPage: 'naazirah',
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
                  FutureBuilder<ApiCallResponse>(
                    future: GetUthmaniAyahCall.call(
                      pageNumber: valueOrDefault<String>(
                        pageNumValue,
                        '1',
                      ),
                    ),
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
                      final columnGetUthmaniAyahResponse = snapshot.data;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Text(
                                        'Font Size:',
                                        textAlign: TextAlign.end,
                                        style: MuallimTheme.of(context)
                                            .bodyText1.override(fontFamily: 'Mukta',fontSize: 18,
                                            ),
                                      ),
                                    ),
                                    MuallimDropDown(
                                      initialOption: textSizeValue ??= '16',
                                      options: ['16', '18', '20', '22', '24', '26', '30', '34','38','42','46','50','54','58','62','66','70','74','80','82','84','86','88','90','94','98','100'],
                                      onChanged: (val) =>
                                          setState(() => textSizeValue = val),
                                      width: width / 5,
                                      height: 40,
                                      textStyle: MuallimTheme.of(context)
                                          .bodyText1.override(fontFamily: 'Mukta',
                                            color: Colors.black,
                                          ),
                                      hintText: 'Page Number',
                                      elevation: 1,
                                      borderColor: MuallimTheme.of(context)
                                          .primaryText,
                                      borderWidth: 1,
                                      borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
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
                                      options: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83','84','85','86','87','88','89','90','91','92','93','94','95','96','97','98','99','100','101','102','103','104','105','106','107','108','109','110','111','112','113','114','115','116','117','118','119','120','121','122','123','124','125','126','127','128','129','130','131','132','133','134','135','136','137','138','139','140','141','142','143','144','145','146','147','148','149','150','151','152','153','154','155','156','157','158','159','160','161','162','163','164','165','166','167','168','169','170','171','172','173','174','175','176','177','178','179','180','181','182','183','184','185','186','187','188','189','190','191','192','193','194','195','196','197','198','199','200','201','202','203','204','205','206','207','208','209','210','211','212','213','214','215','216','217','218','219','220','221','222','223','224','225','226','227','228','229','230','231','232','233','234','235','236','237','238','239','240','241','242','243','244','245','246','247','248','249','250','251','252','253','254','255','256','257','258','259','260','261','262','263','264','265','266','267','268','269','270','271','272','273','274','275','276','277','278','279','280','281','282','283','284','285','286','287','288','289','290','291','292','293','294','295','296','297','298','299','300','301','302','303','304','305','306','307','308','309','310','311','312','313','314','315','316','317','318','319','320','321','322','323','324','325','326','327','328','329','330','331','332','333','334','335','336','337','338','339','340','341','342','343','344','345','346','347','348','349','350','351','352','353','354','355','356','357','358','359','360','361','362','363','364','365','366','367','368','369','370','371','372','373','374','375','376','377','378','379','380','381','382','383','384','385','386','387','388','389','390','391','392','393','394','395','396','397','398','399','400','401','402','403','404','405','406','407','408','409','410','411','412','413','414','415','416','417','418','419','420','421','422','423','424','425','426','427','428','429','430','431','432','433','434','435','436','437','438','439','440','441','442','443','444','445','446','447','448','449','450','451','452','453','454','455','456','457','458','459','460','461','462','463','464','465','466','467','468','469','470','471','472','473','474','475','476','477','478','479','480','481','482','483','484','485','486','487','488','489','490','491','492','493','494','495','496','497','498','499','500','501','502','503','504','505','506','507','508','509','510','511','512','513','514','515','516','517','518','519','520','521','522','523','524','525','526','527','528','529','530','531','532','533','534','535','536','537','538','539','540','541','542','543','544','545','546','547','548','549','550','551','552','553','554','555','556','557','558','559','560','561','562','563','564','565','566','567','568','569','570','571','572','573','574','575','576','577','578','579','580','581','582','583','584','585','586','587','588','589','590','591','592','593','594','595','596','597','598','599','600','601','602','603','604'],
                                      // options: ['1', '2', '604'],
                                      onChanged: (val) =>
                                          setState(() =>
                                          pageNumValue = val),
                                      width: width / 5,
                                      height: 40,
                                      textStyle: MuallimTheme.of(context)
                                          .bodyText1.override(fontFamily: 'Mukta',color: Colors.black,
                                          ),
                                      hintText: 'Page Number',
                                      elevation: 1,
                                      borderColor: MuallimTheme.of(context)
                                          .primaryText,
                                      borderWidth: 1, borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: FutureBuilder<ApiCallResponse>(
                                future: GetChapterInfoCall.call(
                                  id: valueOrDefault<String>(GetUthmaniAyahCall.getVerseKey(columnGetUthmaniAyahResponse.jsonBody).toString().split(":")[0],
                                    '1',
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  var number = GetUthmaniAyahCall.getVerseKey(columnGetUthmaniAyahResponse.jsonBody).toString().split(":");
                                  firstAyahChapter = number[0];
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50, height: 50,
                                        child: SpinKitThreeBounce(
                                          color: MuallimTheme.of(context)
                                              .secondaryText,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnGetChapterInfoResponse = snapshot.data;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                      ),
                                      printSurahInfo(context, columnGetChapterInfoResponse, false, ""),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                      ),
                                      if (getJsonField(
                                        columnGetChapterInfoResponse.jsonBody,
                                        r'''$.chapter.bismillah_pre''',
                                      ))
                                        printBismillah(context)


                                  ]);
                                },
                              ),
                            ),
                            if (columnGetUthmaniAyahResponse.succeeded)
                              Builder(
                                builder: (context) {
                                  final pageAyas = GetUthmaniAyahCall.getVerses(
                                    columnGetUthmaniAyahResponse.jsonBody,
                                  ).toList();
                                  // display ayat after chapter change
                                  String chapterCurrent;
                                  chapterCurrent = pageAyas[0]["verse_key"].split(":")[0];
                                  for (int i=0; i<pageAyas.length;i++ ){
                                    if (pageAyas[i]["verse_key"].split(":")[0] != chapterCurrent) {
                                      chapterCurrent = pageAyas[i]["verse_key"].split(":")[0];
                                      pageAyas.insert(i, pageAyas[i]);
                                    }
                                  }
                                  return ListView.builder(
                                    controller: _scrollController,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: pageAyas.length,
                                    itemBuilder: (context, pageAyasIndex) {
                                      final pageAyasItem = pageAyas[pageAyasIndex];
                                      String currentChapter = pageAyasItem["verse_key"].split(":")[0];
                                      // if chapter has changed print surah info
                                      if (currentChapter != firstAyahChapter){
                                        firstAyahChapter = currentChapter;
                                        return printSurahInfo(context, "columnGetChapterInfoResponse", true, currentChapter);
                                      }
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 5),
                                          child: printAyah(context, pageAyasItem)
                                      );

                                    },
                                  );
                                },
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget printBismillah(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0x16FFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(6),
          topLeft: Radius.circular(6),
          topRight: Radius.circular(0),
        ),
        border: Border.all(
          color: Color(0xFF0000FF),
        ),
      ),
      child: Padding(
        padding:
        EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
        child: Text(
          'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
          textDirection: ui.TextDirection.rtl,
          textAlign: TextAlign.center,
          style:MuallimTheme.of(context)
              .title2.override(fontFamily: 'meQuran',useGoogleFonts: false,),
        ),
      ),
    );
  }

  Widget printSurahInfo(BuildContext context, columnGetChapterInfoResponse, newChapter, currentChapter) {
    String surahName = "";
    String arabicName = "";
    if (!newChapter) {
      surahName = getJsonField(
        columnGetChapterInfoResponse.jsonBody, r'''$.chapter.name_simple''',)
          .toString();
      arabicName = getJsonField(
        columnGetChapterInfoResponse.jsonBody, r'''$.chapter.name_arabic''',)
          .toString();
    } else {
      surahName = MWAppState().chapterInfo[currentChapter]["chapter"]["name_simple"];
      arabicName = MWAppState().chapterInfo[currentChapter]["chapter"]["name_arabic"];
    }
    return Container(
      decoration: BoxDecoration(
        color: Color(0x16FFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(6),
          topLeft: Radius.circular(6),
          topRight: Radius.circular(0),
        ),
        border: Border.all(
          color: Color(0xFF0000FF),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
        Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
        MainAxisAlignment
            .spaceBetween,
        children: [
          Padding(padding:EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Text(
              'Surah $surahName',
              style:
              MuallimTheme.of(context)
                  .title2.override(fontFamily:'Mukta',
                color: MuallimTheme.of(context)
                    .secondaryText,
              ),
            ),
          ),
          Padding(
            padding:
            EdgeInsetsDirectional
                .fromSTEB(10, 0, 10, 0),
            child: Text(arabicName,
              style:MuallimTheme.of(context)
                  .title2.override(fontFamily:'meQuran',
                color: MuallimTheme.of(
                    context)
                    .secondaryText,
                useGoogleFonts:
                false,
              ),
            ),
          ),
        ],
      ),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: [
      Padding(
      padding:
      EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Text(
        'Page:',
        style:MuallimTheme.of(context)
            .subtitle1,
      ),
    ),
    Padding(
      padding:
      EdgeInsetsDirectional
        .fromSTEB(5, 0, 10, 0),
    child: Text(pageNumValue,
    style: MuallimTheme.of(context).subtitle1),
    ),
    ]),
    ])

    );

  }

  @override
  Widget printAyah(BuildContext context, pageAyasItem){
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisSize: MainAxisSize.max,
          children: [Padding(padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Text('Ayah:',style: MuallimTheme.of(context).subtitle1,),),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 10, 5),
              child: Text(getJsonField(pageAyasItem,r'''$.verse_key''',).toString().split(":")[1],
                style: MuallimTheme.of(context).subtitle1,),),


    ]),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
          child: InkWell(onTap: () async {
            soundPlayer ??= AudioPlayer();
            if (soundPlayer.playing) {
              await soundPlayer.stop();}
            soundPlayer
                .setUrl(functions.getAudioURL(getJsonField(pageAyasItem,r'''$.verse_key''',).toString()))
                .then((_) => soundPlayer.play());},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                color: Color(0x16FFFFFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(0),),
                border: Border.all(
                  color: Color(0xFF0000FF),),),
              child: Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                child: AutoSizeText(getJsonField(pageAyasItem,r'''$.text_uthmani''').toString(),
                  textDirection: ui.TextDirection.rtl,
                  textAlign: TextAlign.start,
                  style: MuallimTheme.of(context).subtitle1.override(
                    fontFamily: 'meQuran',
                    fontSize: double.parse(textSizeValue),
                    useGoogleFonts: false,),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
