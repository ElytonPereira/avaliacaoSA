import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tela_login/componentes/botao.dart';
import 'package:tela_login/componentes/caixaTexto.dart';
import 'package:tela_login/componentes/texto.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    final nome = TextEditingController();
    final senha = TextEditingController();

    criaAppBar() {
      return AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
        centerTitle: true,
      );
    }

    criaRow1() {
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: nome,
              texto: 'Nome',
              msgValidacao: 'Digite seu nome',
            ),
          )
        ],
      );
    }

    criaRow2() {
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: nome,
              texto: 'Senha',
              msgValidacao: 'Digite a sue senha',
            ),
          )
        ],
      );
    }

    criaRow3() {
      return Row(
        children: [
          Botao(
            textoBotao: 'Entrar',
            funcaoBotao: () {},
          ),
          Botao(
            textoBotao: 'Criar conta',
            funcaoBotao: () {},
          )
        ],
      );
    }

    criaBody() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.zero),
          ),
          child: Column(
            children: [
              const Texto(
                conteudo: 'Bem vindo a Hotel Bom Pastor',
                tamanho: 90,
              ),
              criaRow1(),
              criaRow2(),
              criaRow3()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody(),
    );
  }
}
