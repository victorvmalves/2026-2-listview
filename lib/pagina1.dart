import 'package:flutter/material.dart';
import 'package:listatarefas/tarefa.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  TextEditingController cNome = TextEditingController();
  TextEditingController cDesc = TextEditingController();
  var tarefas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Lista de Tarefas"),
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text(tarefas[index].nome),
              subtitle: Text(tarefas[index].desc),
              trailing: IconButton(
                onPressed: (){
                  setState(() {
                    tarefas.removeAt(index);
                  });
                }, 
                icon: Icon(Icons.delete)),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return Container(
              height: MediaQuery.of(context).size.height*0.5,
              margin: EdgeInsets.all(20),
              child: Column(
                spacing: 15,
                children: [
                  TextField(controller: cNome,),
                  TextField(controller: cDesc),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      tarefas.add(Tarefa(nome: cNome.text, desc: cDesc.text));
                    });
                    cNome.clear();
                    cDesc.clear();
                    Navigator.pop(context);
                  }, child: Text("Salvar"))
                ],
              ),
            );
          });
        },
        child: Icon(Icons.add),
        ),
    );
  }
}