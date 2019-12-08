import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService{
  Firestore _firestore = Firestore.instance;
  String ref = 'product';



  Future<List<DocumentSnapshot>> getProducts() => _firestore.collection(ref).getDocuments().then((snaps){

    return snaps.documents;
  });
}