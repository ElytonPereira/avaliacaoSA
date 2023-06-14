import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tela_documento/componentes/botao.dart';
import 'package:tela_documento/componentes/caixaTexto.dart';

class TelaDocumento extends StatefulWidget {
  const TelaDocumento({super.key});

  @override
  State<TelaDocumento> createState() => _TelaDocumentoState();
}

class _TelaDocumentoState extends State<TelaDocumento> {
  final titulo = TextEditingController();
  final autor = TextEditingController();
  final texto = TextEditingController();
  final double height = 300;

  @override
  Widget build(BuildContext context) {
    criaRow1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CaixaTexto(
                controlador: titulo,
                texto: 'titulo',
                msgValidacao: 'Digite o titulo',
              ),
            ),
          ],
        ),
      );
    }

    criaRow2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CaixaTexto(
                controlador: titulo,
                texto: 'Autor',
                msgValidacao: 'Digite o Autor',
              ),
            ),
          ],
        ),
      );
    }

    criaRow3() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 0, 5, 300),
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
            children: [criaRow1(), criaRow2(), criaRow3()],
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
        title: const Text('Cadastro de Documento'),
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
