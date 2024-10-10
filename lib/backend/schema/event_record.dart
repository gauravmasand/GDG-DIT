import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "imageUrls" field.
  List<String>? _imageUrls;
  List<String> get imageUrls => _imageUrls ?? const [];
  bool hasImageUrls() => _imageUrls != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "prerequisites" field.
  String? _prerequisites;
  String get prerequisites => _prerequisites ?? '';
  bool hasPrerequisites() => _prerequisites != null;

  // "itemsToBring" field.
  String? _itemsToBring;
  String get itemsToBring => _itemsToBring ?? '';
  bool hasItemsToBring() => _itemsToBring != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "entryFees" field.
  int? _entryFees;
  int get entryFees => _entryFees ?? 0;
  bool hasEntryFees() => _entryFees != null;

  // "bookingURL" field.
  String? _bookingURL;
  String get bookingURL => _bookingURL ?? '';
  bool hasBookingURL() => _bookingURL != null;

  // "speakerName" field.
  List<String>? _speakerName;
  List<String> get speakerName => _speakerName ?? const [];
  bool hasSpeakerName() => _speakerName != null;

  // "speakerImage" field.
  List<String>? _speakerImage;
  List<String> get speakerImage => _speakerImage ?? const [];
  bool hasSpeakerImage() => _speakerImage != null;

  // "spakerDesc" field.
  List<String>? _spakerDesc;
  List<String> get spakerDesc => _spakerDesc ?? const [];
  bool hasSpakerDesc() => _spakerDesc != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imageUrls = getDataList(snapshotData['imageUrls']);
    _description = snapshotData['description'] as String?;
    _location = snapshotData['location'] as String?;
    _prerequisites = snapshotData['prerequisites'] as String?;
    _itemsToBring = snapshotData['itemsToBring'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _entryFees = castToType<int>(snapshotData['entryFees']);
    _bookingURL = snapshotData['bookingURL'] as String?;
    _speakerName = getDataList(snapshotData['speakerName']);
    _speakerImage = getDataList(snapshotData['speakerImage']);
    _spakerDesc = getDataList(snapshotData['spakerDesc']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? name,
  String? description,
  String? location,
  String? prerequisites,
  String? itemsToBring,
  DateTime? dateTime,
  int? entryFees,
  String? bookingURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'location': location,
      'prerequisites': prerequisites,
      'itemsToBring': itemsToBring,
      'dateTime': dateTime,
      'entryFees': entryFees,
      'bookingURL': bookingURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.imageUrls, e2?.imageUrls) &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        e1?.prerequisites == e2?.prerequisites &&
        e1?.itemsToBring == e2?.itemsToBring &&
        e1?.dateTime == e2?.dateTime &&
        e1?.entryFees == e2?.entryFees &&
        e1?.bookingURL == e2?.bookingURL &&
        listEquality.equals(e1?.speakerName, e2?.speakerName) &&
        listEquality.equals(e1?.speakerImage, e2?.speakerImage) &&
        listEquality.equals(e1?.spakerDesc, e2?.spakerDesc);
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.name,
        e?.imageUrls,
        e?.description,
        e?.location,
        e?.prerequisites,
        e?.itemsToBring,
        e?.dateTime,
        e?.entryFees,
        e?.bookingURL,
        e?.speakerName,
        e?.speakerImage,
        e?.spakerDesc
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
