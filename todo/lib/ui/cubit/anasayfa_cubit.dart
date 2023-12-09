import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/entity/yapilacaklar.dart';
import 'package:todo/repo/tododao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>>{
  AnasayfaCubit():super(<Yapilacaklar>[]);

  var tRepo = ToDoRepository();
  Future<void> yapilacaklariYukle() async{
    var liste = await tRepo.yapilacaklariYukle();
    emit(liste);
  }

  Future<void> sil(int id) async{
    await tRepo.sil(id);
    await yapilacaklariYukle();
  }
}