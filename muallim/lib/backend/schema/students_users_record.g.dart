
part of 'students_users_record.dart';


Serializer<StudentsUsersRecord> _$studentsUsersRecordSerializer =
new _$StudentsUsersRecordSerializer();

class _$StudentsUsersRecordSerializer
    implements StructuredSerializer<StudentsUsersRecord> {
  @override
  final Iterable<Type> types = const [
    StudentsUsersRecord,
    _$StudentsUsersRecord
  ];
  @override
  final String wireName = 'StudentsUsersRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, StudentsUsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adminLink;
    if (value != null) {
      result
        ..add('adminLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dob;
    if (value != null) {
      result
        ..add('dob')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentsLink;
    if (value != null) {
      result
        ..add('parentsLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  StudentsUsersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentsUsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'adminLink':
          result.adminLink = serializers.deserialize(value,
              specifiedType: const FullType(
                  DocumentReference, const [const FullType(Object)]))
          as DocumentReference<Object>;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parentsLink':
          result.parentsLink = serializers.deserialize(value,
              specifiedType: const FullType(
                  DocumentReference, const [const FullType(Object)]))
          as DocumentReference<Object>;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
              specifiedType: const FullType(
                  DocumentReference, const [const FullType(Object)]))
          as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$StudentsUsersRecord extends StudentsUsersRecord {
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String gender;
  @override
  final String lastName;
  @override
  final String password;
  @override
  final String phoneNumber;
  @override
  final DocumentReference<Object> adminLink;
  @override
  final String address;
  @override
  final String dob;
  @override
  final DocumentReference<Object> parentsLink;
  @override
  final String level;
  @override
  final DocumentReference<Object> reference;

  factory _$StudentsUsersRecord(
      [void Function(StudentsUsersRecordBuilder) updates]) =>
      (new StudentsUsersRecordBuilder()..update(updates))._build();

  _$StudentsUsersRecord._(
      {this.email,
        this.firstName,
        this.gender,
        this.lastName,
        this.password,
        this.phoneNumber,
        this.adminLink,
        this.address,
        this.dob,
        this.parentsLink,
        this.level,
        this.reference})
      : super._();

  @override
  StudentsUsersRecord rebuild(
      void Function(StudentsUsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentsUsersRecordBuilder toBuilder() =>
      new StudentsUsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentsUsersRecord &&
        email == other.email &&
        firstName == other.firstName &&
        gender == other.gender &&
        lastName == other.lastName &&
        password == other.password &&
        phoneNumber == other.phoneNumber &&
        adminLink == other.adminLink &&
        address == other.address &&
        dob == other.dob &&
        parentsLink == other.parentsLink &&
        level == other.level &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, email.hashCode),
                                                firstName.hashCode),
                                            gender.hashCode),
                                        lastName.hashCode),
                                    password.hashCode),
                                phoneNumber.hashCode),
                            adminLink.hashCode),
                        address.hashCode),
                    dob.hashCode),
                parentsLink.hashCode),
            level.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudentsUsersRecord')
      ..add('email', email)
      ..add('firstName', firstName)
      ..add('gender', gender)
      ..add('lastName', lastName)
      ..add('password', password)
      ..add('phoneNumber', phoneNumber)
      ..add('adminLink', adminLink)
      ..add('address', address)
      ..add('dob', dob)
      ..add('parentsLink', parentsLink)
      ..add('level', level)
      ..add('reference', reference))
        .toString();
  }
}

class StudentsUsersRecordBuilder
    implements Builder<StudentsUsersRecord, StudentsUsersRecordBuilder> {
  _$StudentsUsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  DocumentReference<Object> _adminLink;
  DocumentReference<Object> get adminLink => _$this._adminLink;
  set adminLink(DocumentReference<Object> adminLink) =>
      _$this._adminLink = adminLink;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _dob;
  String get dob => _$this._dob;
  set dob(String dob) => _$this._dob = dob;

  DocumentReference<Object> _parentsLink;
  DocumentReference<Object> get parentsLink => _$this._parentsLink;
  set parentsLink(DocumentReference<Object> parentsLink) =>
      _$this._parentsLink = parentsLink;

  String _level;
  String get level => _$this._level;
  set level(String level) => _$this._level = level;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  StudentsUsersRecordBuilder() {
    StudentsUsersRecord._initializeBuilder(this);
  }

  StudentsUsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _firstName = $v.firstName;
      _gender = $v.gender;
      _lastName = $v.lastName;
      _password = $v.password;
      _phoneNumber = $v.phoneNumber;
      _adminLink = $v.adminLink;
      _address = $v.address;
      _dob = $v.dob;
      _parentsLink = $v.parentsLink;
      _level = $v.level;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentsUsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentsUsersRecord;
  }

  @override
  void update(void Function(StudentsUsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  StudentsUsersRecord build() => _build();

  _$StudentsUsersRecord _build() {
    final _$result = _$v ??
        new _$StudentsUsersRecord._(
            email: email,
            firstName: firstName,
            gender: gender,
            lastName: lastName,
            password: password,
            phoneNumber: phoneNumber,
            adminLink: adminLink,
            address: address,
            dob: dob,
            parentsLink: parentsLink,
            level: level,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
