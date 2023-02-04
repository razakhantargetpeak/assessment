import 'package:crassesment/Model/coinRichModel.dart';
import 'package:crassesment/Service/apiCallService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinRichDataProvider extends ChangeNotifier {
  CoinRichModel? coinRichModel;
  late final Map<String, Datum> data;
  bool loading = false;

  getCoinData(context) async {
    loading = true;
    coinRichModel = await getData(context);
    data = coinRichModel!.data;
    loading = false;
    notifyListeners();
  }
}
