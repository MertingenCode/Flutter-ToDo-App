import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/entity/yapilacaklar.dart';
import 'package:todo/repo/tododao_repository.dart';
import 'package:todo/sqlite/veritabani_yardimcisi.dart';

class KayitCubit extends Cubit<void>{
  KayitCubit():super(0);

  var tRepo = ToDoRepository();

  Future<void> ekle(String yapilacakKayit) async{
    await tRepo.ekle(yapilacakKayit);
  }
}