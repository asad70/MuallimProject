import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'students_users_record.g.dart';

abstract class StudentsUsersRecord
    implements Built<StudentsUsersRecord, StudentsUsersRecordBuilder> {
  static Serializer<StudentsUsersRecord> get serializer =>
      _$studentsUsersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get firstName;

  @nullable
  String get gender;

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
  String get dob;

  @nullable
  DocumentReference get parentsLink;

  @nullable
  String get level;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StudentsUsersRecordBuilder builder) => builder
    ..email = ''
    ..firstName = ''
    ..gender = ''
    ..lastName = ''
    ..password = ''
    ..phoneNumber = ''
    ..address = ''
    ..dob = ''
    ..level = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('studentsUsers');

  static Stream<StudentsUsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StudentsUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
              (s) => serializers.deserializeWith(serializer, serializedData(s)));

  StudentsUsersRecord._();
  factory StudentsUsersRecord(
      [void Function(StudentsUsersRecordBuilder) updates]) =
  _$StudentsUsersRecord;

  static StudentsUsersRecord getDocumentFromData(
      Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStudentsUsersRecordData({
  String email,
  String firstName,
  String gender,
  String lastName,
  String password,
  String phoneNumber,
  DocumentReference adminLink,
  String address,
  String dob,
  DocumentReference parentsLink,
  String level,
}) =>
    serializers.toFirestore(
        StudentsUsersRecord.serializer,
        StudentsUsersRecord((s) => s
          ..email = email
          ..firstName = firstName
          ..gender = gender
          ..lastName = lastName
          ..password = password
          ..phoneNumber = phoneNumber
          ..adminLink = adminLink
          ..address = address
          ..dob = dob
          ..parentsLink = parentsLink
          ..level = level));
