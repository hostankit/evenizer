import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:evenizer/services/firestore_service.dart';

import 'firebase_path.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('hosteldevta');

abstract class Database {
  Future<void> createSearch(Map<String, dynamic> searchData);
  Future<void> getSearchedData(Map<String, dynamic> searchData);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance;


  // Future<void> setHostel(Hostel hostel) => _service.setData(
  //   path: FirestorePath.hostel(uid, hostel.id),
  //   data: hostel.toMap(),
  // );
  //
  // Future<void> deleteHostel(Hostel hostel) async {
  //   // delete where search.hostelId == hostel.hostelId
  //   final allSearches = await searchesStream(hostel: hostel).first;
  //   for (final search in allSearches) {
  //     if (search.hostelId == hostel.id) {
  //       await deleteSearch(search);
  //     }
  //   }
  //   // delete hostel
  //   await _service.deleteData(path: FirestorePath.hostel(uid, hostel.id));
  // }
  //
  // Stream<Hostel> hostelStream({required String hostelId}) => _service.documentStream(
  //   path: FirestorePath.hostel(uid, hostelId),
  //   builder: (data, documentId) => Hostel.fromMap(data, documentId),
  // );
  //
  // Stream<List<Hostel>> hostelsStream() => _service.collectionStream(
  //   path: FirestorePath.hostels(uid),
  //   builder: (data, documentId) => Hostel.fromMap(data, documentId),
  // );
  //
  // Future<void> setSearch(Search search) => _service.setData(
  //   path: FirestorePath.search(uid, search.id),
  //   data: search.toMap(),
  // );
  //
  // Future<void> deleteSearch(Search search) =>
  //     _service.deleteData(path: FirestorePath.search(uid, search.id));
  //
  // Stream<List<Search>> entriesStream({Hostel? hostel}) =>
  //     _service.collectionStream<Search>(
  //       path: FirestorePath.entries(uid),
  //       queryBuilder: hostel != null
  //           ? (query) => query.where('hostelId', isEqualTo: hostel.id)
  //           : null,
  //       builder: (data, documentID) => Search.fromMap(data, documentID),
  //       sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
  //     );


  Future<void> addItem({
    required String title,
    required String description,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(uid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection = _mainCollection.doc(uid).collection('items');
    return notesItemCollection.snapshots();
  }
  Stream<QuerySnapshot> readHostels() {
    CollectionReference notesItemCollection = _mainCollection.doc('database').collection('hostels');
    return notesItemCollection.snapshots();
  }

  Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(uid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(uid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  Future<void> createSearch(Map<String, dynamic> searchData) async {
    final path = '/users/$uid/searches/search_abc';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(searchData);
  }

  Future<void> getSearchedData(Map<String, dynamic> searchData) async {
    final result = await FirebaseFirestore.instance.collection('hostelhub/database/hostels').where("gender", isEqualTo: "male").get();
  }

}