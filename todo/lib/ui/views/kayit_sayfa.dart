import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {

  var kayit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ekle"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:50,right: 50,bottom: 15,top: 150),
              child: TextField(controller: kayit, decoration: InputDecoration(hintText: "Ekle"),),
            ),
            ElevatedButton(onPressed: (){
              context.read<KayitCubit>().ekle(kayit.text);
            }, child: const Text("Ekle"))
          ],
        ),
        
      ),
    );
  }
}
