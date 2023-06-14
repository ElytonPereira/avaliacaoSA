import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:relatorio_cidades/componentes/botao.dart';
import 'package:relatorio_cidades/componentes/caixaTexto.dart';
import 'package:relatorio_cidades/componentes/texto.dart';

class TelaRelatorioCidades extends StatefulWidget {
  const TelaRelatorioCidades({super.key});

  @override
  State<TelaRelatorioCidades> createState() => _TelaRelatorioCidadesState();
}

class _TelaRelatorioCidadesState extends State<TelaRelatorioCidades> {
  @override
  Widget build(BuildContext context) {
    final nome = TextEditingController();
    final uf =  TextEditingController();

    criaAppBar(){
      return AppBar(
        title: const Text('Relatório de clientes'),
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
              texto: 'Nome',
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: uf,
              texto: 'CPF',
            ),
          ),  
        ]
        ),
      );          
    }
    criaRow2(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children:[
          Expanded(
            child: CaixaTexto(
              controlador: nome,
              texto: 'Data de nascimento',
            ),
          ),
          
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
              conteudo: 'Nome: Fernando',
                  ),
            ),
            Expanded(
              child: Texto(
              conteudo: 'CPF: 111-545-989-66',
                  ),
            ),
            Expanded(
              child: Texto(
              conteudo: 'Nascimento: 01/12/2000',
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
              criaRow2(),
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