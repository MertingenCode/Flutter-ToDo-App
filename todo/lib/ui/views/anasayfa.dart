import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/entity/yapilacaklar.dart';
import 'package:todo/ui/cubit/anasayfa_cubit.dart';
import 'package:todo/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklariYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo APP",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
        builder: (context,yapilacaklarListesi){
          if(yapilacaklarListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacaklarListesi.length,
                itemBuilder: (context,indeks){
                var yapilacaklar = yapilacaklarListesi[indeks];
                return Card(
                  child: SizedBox(width: 100, height: 100,
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.alarm),
                        Text(yapilacaklar.yapilacak,style: TextStyle(fontSize: 24,),),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${yapilacaklar.yapilacak} silinsin mi?"),
                              action: SnackBarAction(label: "Evet", onPressed: (){
                                context.read<AnasayfaCubit>().sil(yapilacaklar.id);
                              }),

                            ),

                          );
                        }, icon: const Icon(Icons.delete,color: Colors.black54,)),
                      ],
                    ),
                  ),
                );
                }
            );
          }else {
            return const Center(child: Text("Hemen Yapılacak Bir Şey Ekle!"),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> KayitSayfa())).
        then((value){
          context.read<AnasayfaCubit>().yapilacaklariYukle();
        });
      },
        child: const Icon(Icons.add),
      ),
    );
  }
}
