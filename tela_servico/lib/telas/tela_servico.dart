import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tela_servico/componentes/botao.dart';
import 'package:tela_servico/componentes/caixaTexto.dart';

const List<String> list = <String>['Ativo', 'Inativo'];

class TelaServico extends StatefulWidget {
  const TelaServico({super.key});

  @override
  State<TelaServico> createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  String dropdownValue = list.first;
  final descicao = TextEditingController();
  final texto = TextEditingController();
  final double height = 400;

  @override
  Widget build(BuildContext context) {
    criaRow1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CaixaTexto(
                controlador: descicao,
                texto: 'Descição',
                msgValidacao: 'Digite o titulo',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
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
          ],
        ),
      );
    }

    criaRow2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 0, 5, 400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Observação',
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
              Botao(
                textoBotao: 'Inativar',
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
        title: const Text('Cadastro de serviços'),
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
