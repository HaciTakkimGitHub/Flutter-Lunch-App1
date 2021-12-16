import 'package:http/http.dart' as http;
import 'dart:convert';

class BeyanService {
  static const String _apiUrl = "http://localhost:59529";

  Future<Beyan> getBeyan(String id) async {
    try {
      var url = Uri.parse('$_apiUrl/onbeyan/$id');
      http.Response response = await http.get(url, headers: {});

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        Beyan beyan = Beyan.fromJson(map);
        return beyan;
      } else {
        throw Exception('API doesnt return success');
      }
    } catch (e) {
      print(e.toString());
      throw ('Has an error calling API');
    }
  }

  Future<List<Beyan>> getBeyanList() async {
    try {
      var url = Uri.parse('$_apiUrl/onbeyan');
      http.Response response = await http.get(url, headers: {});

      if (response.statusCode == 200) {
        List<Beyan> beyanList = (json.decode(response.body) as List)
            .map((i) => Beyan.fromJson(i))
            .toList();
        print(beyanList.toString());
        return beyanList;
      } else {
        throw Exception('API doesnt return success');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Has an error calling API');
    }
  }
}

class Beyan {
  static const String idColumnHeader = "ID";
  static const String aciklamaColumnHeader = "AÇIKLAMA";
  static const String durumColumnHeader = "DURUM";

  final String id;
  final String aciklama;
  final String durum;

  bool selected = false;

  Beyan(this.id, this.aciklama, this.durum);

  Beyan.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        aciklama = json["aciklama"],
        durum = json['durum'];
}

class OnBeyanDurum {
  final int id;
  final String durumAdi;

  OnBeyanDurum(this.id, this.durumAdi);

  OnBeyanDurum.fromJson(Map<String, dynamic> json)
      : id = json["Id"],
        durumAdi = json["DurumAdi"];
}
