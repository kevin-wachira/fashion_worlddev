/*
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';


bool confirmed = false;
String code;

class Mpesa extends StatefulWidget {
  dynamic transactionInitialisation;
//Wrap it with a try-catch
  try {
//Run it
  transactionInitialisation =
  await MpesaFlutterPlugin.initializeMpesaSTKPush(
 // businessShortCode: <your-code>,
  //transactionType: TransactionType.CustomerPayBillOnline,
  amount: <amount-in-string-format>,
  artyA: <user's-phone-to-request-payment>,
  partyB: <your-code>,
  callBackURL: <url-to-receive-payment-results>,
  accountReference: <could-be-order-number>,
  phoneNumber: <user's-phone-to-request-payment>,
  baseUri: <live-or-sandbox-base-url>,
  transactionDesc: <short-description>,
  passKey: <your-passkey>);

  } catch (e) {
//you can implement your exception handling here.
//Network unreachability is a sure exception.
  print(e.getMessage();
  }
}

}
*/
