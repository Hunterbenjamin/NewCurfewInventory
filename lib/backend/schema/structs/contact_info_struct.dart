// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactInfoStruct extends FFFirebaseStruct {
  ContactInfoStruct({
    String? phone,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _phone = phone,
        _email = email,
        super(firestoreUtilData);

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  static ContactInfoStruct fromMap(Map<String, dynamic> data) =>
      ContactInfoStruct(
        phone: data['phone'] as String?,
        email: data['email'] as String?,
      );

  static ContactInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ContactInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'phone': _phone,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactInfoStruct(
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContactInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactInfoStruct &&
        phone == other.phone &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([phone, email]);
}

ContactInfoStruct createContactInfoStruct({
  String? phone,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactInfoStruct(
      phone: phone,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactInfoStruct? updateContactInfoStruct(
  ContactInfoStruct? contactInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contactInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactInfoStructData(
  Map<String, dynamic> firestoreData,
  ContactInfoStruct? contactInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contactInfo == null) {
    return;
  }
  if (contactInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contactInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactInfoData =
      getContactInfoFirestoreData(contactInfo, forFieldValue);
  final nestedData =
      contactInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contactInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactInfoFirestoreData(
  ContactInfoStruct? contactInfo, [
  bool forFieldValue = false,
]) {
  if (contactInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contactInfo.toMap());

  // Add any Firestore field values
  contactInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactInfoListFirestoreData(
  List<ContactInfoStruct>? contactInfos,
) =>
    contactInfos?.map((e) => getContactInfoFirestoreData(e, true)).toList() ??
    [];
