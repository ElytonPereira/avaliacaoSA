import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tela_avaliacao/componentes/botao.dart';
import 'package:tela_avaliacao/componentes/caixaTexto.dart';
import 'package:tela_avaliacao/componentes/texto.dart';

const List<String> list = <String>['Ótimo', 'Bom', 'Normal', 'Ruim', 'Péssimo'];

class TelaAvaliacao extends StatefulWidget {
  const TelaAvaliacao({super.key});

  @override
  State<TelaAvaliacao> createState() => _TelaAvaliacaoState();
}

class _TelaAvaliacaoState extends State<TelaAvaliacao> {
  final titulo = TextEditingController();
  final texto = TextEditingController();
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    DateTime currentDateTime = DateTime.now();
    String formattedDateTime =
        '${currentDateTime.day}/${currentDateTime.month}/${currentDateTime.year} ${currentDateTime.hour}:${currentDateTime.minute}:${currentDateTime.second}';

    criaRow1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: CaixaTexto(
                controlador: titulo,
                texto: 'Titulo',
                msgValidacao: 'Digite o titulo',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius:  BorderRadius.circular(15),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Texto(
                  conteudo: 'Data atual: $formattedDateTime',
                ),
              ),
            )
          ],
        ),
      );
    }

    criaRow2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 0, 5, 400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Texto',
            ),
          ),
        ),
      );
    }

    criaColuna1() {
      return Expanded(
        flex: 5,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [criaRow1(), criaRow2()],
          ),
        ),
      );
    }

    criaColuna2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Botao(
                textoBotao: 'Consultar',
                funcaoBotao: () {},
                tamanhoTexto: 10,
              ),
              Botao(
                textoBotao: 'Incluir',
                funcaoBotao: () {},
                tamanhoTexto: 10,
              ),
              Botao(
                textoBotao: 'Alterar',
                funcaoBotao: () {},
                tamanhoTexto: 10,
              ),
              Botao(
                textoBotao: 'Salvar',
                funcaoBotao: () {},
                tamanhoTexto: 10,
              ),
            ],
          ),
        ),
      );
    }

    criaBody() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [criaColuna1(), criaColuna2()],
        ),
      );
    }

    criaAppBar() {
      return AppBar(
        title: const Text('Cadastro de Avaliação'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
        centerTitle: true,
      );
    }

    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody(),
    );
  }
}
