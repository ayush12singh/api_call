import 'dart:convert';
import 'dart:ffi';
import "clientmodel.dart";
import 'package:http/http.dart' as http;

class Data {
  var data = <Clients>[];
  Future<void> getdata() async {
    var response = await http.get(Uri.parse(
        "https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6"));

    var jsondata = jsonDecode(response.body);
    if (jsondata != nullptr) {
      jsondata['clients'].forEach((element) {
        Clients clients = Clients(
            name: element['name'].toString(),
            id: element['id'].toString(),
            company: element['company'].toString(),
            orderId: element['orderId'].toString(),
            invoicepaid: element['invoicepaid'].toString(),
            invoicepending: element['invoicepending'].toString());
        data.add(clients);
      });
    }
 
  }
}
