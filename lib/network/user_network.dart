import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:untitled55/model/user_model.dart';

class UserNetwork{
  // Load JSON data from the assets
  Future<List<UserModel>> userListData() async {
    try{
      final jsonString = await rootBundle.loadString('assets/user_list.json');
      final jsonData = json.decode(jsonString) as List;
          return jsonData.map((data) => UserModel.fromJson(data)).toList();
    }catch(e){
           rethrow;
    }

  }
}