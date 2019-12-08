import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppesta/components/cart_items.dart';

class UserService{
  Firestore _firestore = Firestore.instance;
  String ref = 'users';
  static String userId;

  void createUser(String phone){
    //var id = Uuid();
     userId = phone;


    _firestore.collection(ref).document(userId).setData({'user': phone});
  }
  void createCart({List<single_item> cartItem})
  {
    single_item item =new single_item();
for(int i = 0 ; i< cartItem.length ; i++){

  item=cartItem[i];

  _firestore.collection(ref).document(userId).setData({
    'product':item.cart_prod_name,
    'img':item.cart_prod_picture,

  });
}


  }

  Future<List<DocumentSnapshot>> getUser() => _firestore.collection(ref).getDocuments().then((snaps){

    return snaps.documents;
  });



//  Future<List<DocumentSnapshot>> getCart(String phone) => _firestore.collection(ref).document(phone).collection('cart').then((snaps){
//
//    return snaps.;
//  });

//  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
//      _firestore.collection(ref).where('brand', isEqualTo: suggestion).getDocuments().then((snap){
//        return snap.documents;
//      });
}