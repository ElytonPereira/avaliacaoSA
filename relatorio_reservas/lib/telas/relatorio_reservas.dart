import 'package:flutter/material.dart';
import 'package:relatorio_reservas/componentes/botao.dart';
import 'package:relatorio_reservas/componentes/caixaTexto.dart';
import 'package:relatorio_reservas/componentes/texto.dart';

const List<String> list1 = <String>['Canceladas', 'Pendente', 'Finalizada'];

class TelaRelatorioCidades extends StatefulWidget {
  const TelaRelatorioCidades({super.key});

  @override
  State<TelaRelatorioCidades> createState() => _TelaRelatorioCidadesState();
}

class _TelaRelatorioCidadesState extends State<TelaRelatorioCidades> {
  String dropdownValue1 = list1.first;
  @override
  Widget build(BuildContext context) {
    final nome = TextEditingController();
    final uf =  TextEditingController();

    criaAppBar(){
      return AppBar(
        title: const Text('Relatório de reservas'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
        centerTitle: true,
      );
    }

    criaRow1(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children:[
          Expanded(
            child: CaixaTexto(
              controlador: nome,
              texto: 'Numero da reserva',
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: uf,
              texto: 'Periodo da reserva',
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue1,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue1 = value!;
                    });
                  },
                  items: list1.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            )  
        ]
        ),
      );          
    }
    

    criaRow3(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
          child: Row(children: const [
            Expanded(
              child: Texto(
              conteudo: 'Número Reserva: 1',
                  ),
            ),
            Expanded(
              child: Texto(
              conteudo: 'Data: 05/06/2023',
                  ),
            ),
            Expanded(
              child: Texto(
              conteudo: 'Status: Pendente',
                  ),
            ),
          ]
          ),
        ),
      );
    }

    criaBody(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
          child: Column(
            children: [
              criaRow1(),              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Botao(
                  textoBotao: 'Consultar',
                  funcaoBotao: (){},
                  tamanhoTexto: 10,
                ),
              ),
              criaRow3()
            ],
          ),
        ),
      );

    }
    
    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody()
      
      
    );
  }
}