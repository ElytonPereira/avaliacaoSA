import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tela_reserva/componentes/botao.dart';
//mask_text_input_formatter: ^2.4.0 colocar no pubspec
import 'package:tela_reserva/componentes/caixaTexto.dart';
import 'package:tela_reserva/componentes/texto.dart';

const List<String> list = <String>['Pendente', 'Finalizada', 'Cancelada'];

class TelaReserva extends StatefulWidget {
  const TelaReserva({super.key});

  @override
  State<TelaReserva> createState() => _TelaReservaState();
}

class _TelaReservaState extends State<TelaReserva> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(
        mask: '##/##/####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    final nmrResQuarto = TextEditingController();
    final dataPreEntrada = TextEditingController();
    final dataPreSaida = TextEditingController();
    final codFuncionario = TextEditingController();
    final valorDesconto = TextEditingController(text: '0.0');
    double valorTotal = 0.00;

    criaRow1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CaixaTexto(
                controlador: nmrResQuarto,
                texto: 'Numero da reserva do quarto',
                msgValidacao: 'Digite o numero da reserva do quarto',
              ),
            ),
            Expanded(
              child: TextField(
                  controller: dataPreEntrada,
                  inputFormatters: [maskFormatter],
                  decoration: InputDecoration(
                      labelText: 'Data previsão entrada',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
            Expanded(
              child: TextField(
                  controller: dataPreSaida,
                  inputFormatters: [maskFormatter],
                  decoration: InputDecoration(
                      labelText: 'Data previsão saida',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
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
                controlador: codFuncionario,
                texto: 'Código do funcionario',
                msgValidacao: 'Digite o codigo do funcionario',
              ),
            ),
            Expanded(
              child: CaixaTexto(
                controlador: valorDesconto,
                texto: 'Valor desconto',
                msgValidacao: 'Digite o Valor do desconto',
              ),
            ),
            Expanded(
                child: Texto(
              conteudo: 'Valor Total: $valorTotal ',
            )),
          ],
        ),
      );
    }

    criaRow3() {
      return Row(
        children: [
          Botao(
            textoBotao: 'Forma de pagamento',
            funcaoBotao: () {},
            tamanhoTexto: 10,
          ),
          Botao(
            textoBotao: 'Avaliação',
            funcaoBotao: () {},
            tamanhoTexto: 10,
          ),
          Botao(
            textoBotao: 'pesquisar promoção',
            funcaoBotao: () {},
            tamanhoTexto: 10,
          ),
          Botao(
            textoBotao: 'pesquisar serviço',
            funcaoBotao: () {},
            tamanhoTexto: 10,
          ),
        ],
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
                textoBotao: 'Finalizar',
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
        title: const Text('Reserva'),
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
