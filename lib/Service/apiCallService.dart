import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:crassesment/Model/coinRichModel.dart';
import 'package:crassesment/Utils/apiConstant.dart';
import 'package:http/retry.dart';

Future<CoinRichModel?> getData(context) async {
  CoinRichModel? result;
  try {
    final response = await http.get(Uri.parse(apiUrl), headers: header);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      result = CoinRichModel.fromJson(item);

      log(result.data[0]!.cmcRank.toString());
    } else {
      log("Error to load");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
