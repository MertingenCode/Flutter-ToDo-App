import 'package:todo/data/entity/yapilacaklar.dart';
import 'package:todo/sqlite/veritabani_yardimcisi.dart';

class ToDoRepository {
Future<List<Yapilacaklar>> yapilacaklariYukle() async{
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM todo");
  
  return List.generate(maps.length,(index){
    var satir = maps[index];
    return Yapilacaklar(id: satir["id"], yapilacak: satir["yapilacak"]);
  });
}

Future<void> sil(int id) async{
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  db.delete("todo",where: "id = ? ",whereArgs: [id] );
}

Future<void> ekle(String yapilacakKayit) async{
  var db = await VeritabaniYardimcisi.veritabaniErisim();
  var yeniEkle = Map<String,dynamic>();
  yeniEkle["yapilacak"] = yapilacakKayit;
  await db.insert("todo", yeniEkle);
}

}