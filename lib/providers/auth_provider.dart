import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../models/card_model.dart';
import '../models/user_model.dart';
import '../resources/string_manager.dart';
import 'package:unique_identifier/unique_identifier.dart';
import '../services/api_handler.dart';

class AuthProvider with ChangeNotifier {
  dynamic _userModel;

  final List<CardModel> _parentCardsList = [];
  final List<CardModel> _childrenCardsList = [];

  bool hasChildrens({required int parentCardId}) {
    bool exists =
        _childrenCardsList.any((card) => card.parentId == parentCardId);
    if (exists) {
      return true;
    }
    return false;
  }

  List<CardModel> getChildrenById({required int parentCardId}) {
    return _childrenCardsList.where((element) {
      return element.parentId == parentCardId;
    }).toList();
  }

  UserModel get getUerModel {
    return _userModel;
  }

  List<CardModel> get getParentCardsList {
    return _parentCardsList;
  }

  List<CardModel> get getChildrenCardsList {
    return _childrenCardsList;
  }

  Future<String> forgetPassword({required String erpCode}) async {
    var json = {
      'ERP_ID': erpCode,
    };
    var data = await APIHandler.postData(json: json, target: 'forgetPassword');
    return data['message'];
  }

  Future<void> login(
      {required String erpCode, required String password}) async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
      log("identifier: $identifier");
    } on PlatformException {
      identifier = AppString.failed;
      throw AppString.macAddressError;
    }
    var json = {
      'ERP_ID': erpCode,
      'password': password,
      'firebase_token': "",
      'mac_address': identifier,
    };
    var data = await APIHandler.postData(json: json, target: 'login');
    //! get the user token and store it in the shared prefs
    _extractUser(data['user']);
    _extractCards(data['cards']);
  }

  Future<void> _extractCards(List<dynamic> cards) async {
    for (var card in cards) {
      CardModel newCard = CardModel.fromJson(card);
      print(newCard.imageUrl);
      if (newCard.id == newCard.parentId) {
        _parentCardsList.add(newCard);
      } else {
        _childrenCardsList.add(newCard);
      }
    }
    notifyListeners();
  }

  Future<void> _extractUser(Map<String, dynamic> user) async {
    _userModel = UserModel.fromJson(user);
    notifyListeners();
  }
}
