import '../../muallim/muallim_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetUthmaniAyahCall {
  static Future<ApiCallResponse> call({
    String pageNumber = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUthmaniAyah',
      apiUrl: 'https://api.quran.com/api/v4/quran/verses/uthmani?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page_number': pageNumber,
      },
      returnBody: true,
    );
  }

  static dynamic getVerses(dynamic response) => getJsonField(
        response,
        r'''$.verses''',
      );
  static dynamic getVerseKey(dynamic response) => getJsonField(
        response,
        r'''$.verses[0].verse_key''',
      );
}

class GetChapterInfoCall {
  static Future<ApiCallResponse> call({
    String id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChapterInfo',
      apiUrl: 'https://api.quran.com/api/v4/chapters/' + id,
      callType: ApiCallType.GET,
      headers: {},
      params: {
      },
      returnBody: true,
    );
  }
  static dynamic getChapter(dynamic response) => getJsonField(
    response,
    r'''$.chapter''',
  );
}
