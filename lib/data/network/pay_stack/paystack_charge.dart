import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zia/Domain/models/charge_class.dart';
import 'package:zia/Domain/models/charge_response.dart';
import 'package:zia/data/network/API/API%20Url/Urls.dart';

Future<ChargeResponse> payMyMoney(ChargeClass charge) async {
  try {
    String url = Urls.paystackCharge;
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer sk_test_3e6391b5fca3144f40e8790aac15ad2f2d01ecf1"
        },
        body: jsonEncode(charge.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonBody = jsonDecode(response.body);
      ChargeResponse respons;
      return respons;
    } else {
      throw Exception("Something went wrong");
    }
  } catch (e) {
    throw e;
  }
}
