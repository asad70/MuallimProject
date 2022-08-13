import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'parents_users_record.g.dart';

abstract class ParentsUsersRecord
    implements Built<ParentsUsersRecord, ParentsUsersRecordBuilder> {
  static Serializer<ParentsUsersRecord> get serializer =>
      _$parentsUsersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get firstName;

  @nullable
  String get lastName;

  @nullable
  String get password;

  @nullable
  String get phoneNumber;

  @nullable
  DocumentReference get adminLink;

  @nullable
  String get address;

  @nullable
  String get relationshipToStd;

  @nullable
  BuiltList<DocumentReference> get studentLinks;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ParentsUsersRecordBuilder builder) => builder
    ..email = ''
    ..firstName = ''
    ..lastName = ''
    ..password = ''
    ..phoneNumber = ''
    ..address = ''
    ..relationshipToStd = ''
    ..studentLinks = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parentsUsers');

  static Stream<ParentsUsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ParentsUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ParentsUsersRecord._();
  factory ParentsUsersRecord(
          [void Function(ParentsUsersRecordBuilder) updates]) =
      _$ParentsUsersRecord;

  static ParentsUsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createParentsUsersRecordData({
  String email,
  String firstName,
  String lastName,
  String password,
  String phoneNumber,
  DocumentReference adminLink,
  String address,
  String relationshipToStd,
}) =>
    serializers.toFirestore(
        ParentsUsersRecord.serializer,
        ParentsUsersRecord((p) => p
          ..email = email
          ..firstName = firstName
          ..lastName = lastName
          ..password = password
          ..phoneNumber = phoneNumber
          ..adminLink = adminLink
          ..address = address
          ..relationshipToStd = relationshipToStd
          ..studentLinks = null));
