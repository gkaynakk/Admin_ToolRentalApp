import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'categories';

  void createCategory(String name) {
    var uuid = Uuid();
    String categoryId = uuid.v1();
    _firestore.collection(ref).doc(categoryId).set({'category': name});
  }

  Future<List<DocumentSnapshot>> getCategory() =>
      //We will try to get our collection into a list
      _firestore.collection(ref).get().then((snaps) {
        return snaps.docs;
      });
  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) => _firestore
          .collection(ref)
          .where('category', isEqualTo: suggestion)
          .get()
          .then((snap) {
        return snap.docs;
      });
}
