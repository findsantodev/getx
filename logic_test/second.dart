/*
Membeli makan siang dan menabung
Rusli adalah seorang anak sekolah di SD Beever
Setiap harinya, Rusli diberikan uang jajan oleh orang tuanya 
sebesar Rp. 10.000,- rupiah.
Rusli bisa menabung atau membeli makanan di sekolahnya untuk
makan siang. Kita telah diberikan catatan keuangan Rusli
dalam bentuk text biasa, dan kita diminta menghitung
jumlah uang tabungan Rusli per harinya dan total tabungannya.
Result OUTPUT:
{
    Senin: 2000,
    Selasa: 5500,
    Rabu: 3500,
    Kamis: 7000,
    Jumat: 5500,
    TotalTabungan: 23500
}
*/

class Item {
  String? name;
  int? price;
  Item({required this.name, required this.price});
}

class Result {
  num senin;
  num selasa;
  num rabu;
  num kamis;
  num jumat;
  num totaltabungan;

  Result({
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat,
    required this.totaltabungan,
  });

  Map<String, num> toJson() {
    final Map<String, num> data = <String, num>{};
    data['Senin'] = senin;
    data['Selasa'] = selasa;
    data['Rabu'] = rabu;
    data['Kamis'] = kamis;
    data['Jumat'] = jumat;
    data['TotalTabungan'] = totaltabungan;

    return data;
  }
}

class Savings {
  List<Item> menu = [
    Item(name: "ayam", price: 5000),
    Item(name: "nasi", price: 2000),
    Item(name: "cola", price: 1000),
    Item(name: "chiki", price: 1500),
    Item(name: "hotdog", price: 3000),
    Item(name: "aqua", price: 2000)
  ];

  String purchaseHistory =
      "Senin-ayam,nasi,cola.Selasa-chiki,hotdog.Rabu-ayam,chiki.Kamis-hotdog.Jumat-chiki,cola,nasi.";

  calculate() {
    var daily = [10000, 10000, 10000, 10000, 10000, 0];

    var regExp79 = RegExp(r'(?<=-)(.*?)(?=[.])', dotAll: true);
    var mylistdate = regExp79.allMatches(purchaseHistory).map((z) {
      return z.group(0);
    }).toList();

    for (var i = 0; i < mylistdate.length; i++) {
      var menusDaily = mylistdate[i];
      var listOfMenusDaily = menusDaily!.split(",").toList();
      print(listOfMenusDaily);
      for (var element in listOfMenusDaily) {
        for (var item in menu) {
          if (item.name == element) {
            daily[i] -= item.price!.toInt();
          }
        }
      }
    }

    Result result = Result(
      senin: daily[0],
      selasa: daily[1],
      rabu: daily[2],
      kamis: daily[3],
      jumat: daily[4],
      totaltabungan:
          daily.fold(0, (previousValue, element) => previousValue + element),
    );
    print(result.toJson());
  }
}

void main() {
  Savings().calculate();
}
