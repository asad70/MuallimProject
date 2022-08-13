
part of 'parents_users_record.dart';


Serializer<ParentsUsersRecord> _$parentsUsersRecordSerializer =
    new _$ParentsUsersRecordSerializer();

class _$ParentsUsersRecordSerializer
    implements StructuredSerializer<ParentsUsersRecord> {
  @override
  final Iterable<Type> types = const [ParentsUsersRecord, _$ParentsUsersRecord];
  @override
  final String wireName = 'ParentsUsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ParentsUsersRecord object,
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
    value = object.relationshipToStd;
    if (value != null) {
      result
        ..add('relationshipToStd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.studentLinks;
    if (value != null) {
      result
        ..add('studentLinks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  ParentsUsersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ParentsUsersRecordBuilder();

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
        case 'relationshipToStd':
          result.relationshipToStd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'studentLinks':
          result.studentLinks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$ParentsUsersRecord extends ParentsUsersRecord {
  @override
  final String email;
  @override
  final String firstName;
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
  final String relationshipToStd;
  @override
  final BuiltList<DocumentReference<Object>> studentLinks;
  @override
  final DocumentReference<Object> reference;

  factory _$ParentsUsersRecord(
          [void Function(ParentsUsersRecordBuilder) updates]) =>
      (new ParentsUsersRecordBuilder()..update(updates))._build();

  _$ParentsUsersRecord._(
      {this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.phoneNumber,
      this.adminLink,
      this.address,
      this.relationshipToStd,
      this.studentLinks,
      this.reference})
      : super._();

  @override
  ParentsUsersRecord rebuild(
          void Function(ParentsUsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentsUsersRecordBuilder toBuilder() =>
      new ParentsUsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParentsUsersRecord &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        password == other.password &&
        phoneNumber == other.phoneNumber &&
        adminLink == other.adminLink &&
        address == other.address &&
        relationshipToStd == other.relationshipToStd &&
        studentLinks == other.studentLinks &&
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
                                    $jc($jc(0, email.hashCode),
                                        firstName.hashCode),
                                    lastName.hashCode),
                                password.hashCode),
                            phoneNumber.hashCode),
                        adminLink.hashCode),
                    address.hashCode),
                relationshipToStd.hashCode),
            studentLinks.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParentsUsersRecord')
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('password', password)
          ..add('phoneNumber', phoneNumber)
          ..add('adminLink', adminLink)
          ..add('address', address)
          ..add('relationshipToStd', relationshipToStd)
          ..add('studentLinks', studentLinks)
          ..add('reference', reference))
        .toString();
  }
}

class ParentsUsersRecordBuilder
    implements Builder<ParentsUsersRecord, ParentsUsersRecordBuilder> {
  _$ParentsUsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

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

  String _relationshipToStd;
  String get relationshipToStd => _$this._relationshipToStd;
  set relationshipToStd(String relationshipToStd) =>
      _$this._relationshipToStd = relationshipToStd;

  ListBuilder<DocumentReference<Object>> _studentLinks;
  ListBuilder<DocumentReference<Object>> get studentLinks =>
      _$this._studentLinks ??= new ListBuilder<DocumentReference<Object>>();
  set studentLinks(ListBuilder<DocumentReference<Object>> studentLinks) =>
      _$this._studentLinks = studentLinks;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ParentsUsersRecordBuilder() {
    ParentsUsersRecord._initializeBuilder(this);
  }

  ParentsUsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _password = $v.password;
      _phoneNumber = $v.phoneNumber;
      _adminLink = $v.adminLink;
      _address = $v.address;
      _relationshipToStd = $v.relationshipToStd;
      _studentLinks = $v.studentLinks?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParentsUsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ParentsUsersRecord;
  }

  @override
  void update(void Function(ParentsUsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ParentsUsersRecord build() => _build();

  _$ParentsUsersRecord _build() {
    _$ParentsUsersRecord _$result;
    try {
      _$result = _$v ??
          new _$ParentsUsersRecord._(
              email: email,
              firstName: firstName,
              lastName: lastName,
              password: password,
              phoneNumber: phoneNumber,
              adminLink: adminLink,
              address: address,
              relationshipToStd: relationshipToStd,
              studentLinks: _studentLinks?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'studentLinks';
        _studentLinks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ParentsUsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
