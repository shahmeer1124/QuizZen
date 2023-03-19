import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../firebase_ref/reference.dart';


class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? ImgName) async {
    print('a gya function k andr');
    if (ImgName == null) {
      print('nulll hai');
      return null;
    }
    try {
      print('null nahi hai');
      var urlRef = firebaseStorage
          .child('question_paper_images')
          .child('${ImgName.toLowerCase()}.png');
      print(urlRef);
      var imgUrl = await urlRef.getDownloadURL();
      print('image url wali line');
      print(imgUrl);
      return imgUrl;
    } catch (e) {
      print(e);
    }
  }
}
