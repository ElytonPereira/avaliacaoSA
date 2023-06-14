import 'package:flutter/material.dart';
import 'package:tela_reserva_quarto/componentes/botao.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tela_reserva_quarto/componentes/caixaTexto.dart';

const List<String> list = <String>['Pendente', 'Reservado'];

class ReservaQuarto extends StatefulWidget {
  const ReservaQuarto({super.key});

  @override
  State<ReservaQuarto> createState() => _ReservaQuartoState();
}

class _ReservaQuartoState extends State<ReservaQuarto> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(
        mask: '##/##/####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    final nmrQuarto = TextEditingController();
    final valor = TextEditingController();
    final codCliente = TextEditingController();
    final nmrDaReserva = TextEditingController();
    final dataPrimeiroPagamento = TextEditingController();

    criaRow1() {
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: nmrDaReserva,
              texto: 'Numero da reserva',
              msgValidacao: 'Digite o Numero da reserva',
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: nmrQuarto,
              texto: 'Numero do quarto',
              msgValidacao: 'Digite o Numero do quarto',
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
      );
    }

    criaRow2() {
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: codCliente,
              texto: 'Código cliente',
              msgValidacao: 'Digite o codigo do cliente',
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: valor,
              texto: 'Valor',
              msgValidacao: 'Digite o valor',
            ),
          ),
          Expanded(
            child: TextField(
                controller: dataPrimeiroPagamento,
                inputFormatters: [maskFormatter],
                decoration: InputDecoration(
                    labelText: 'Data primeiro pagamento',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
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
        title: const Text('Reserva de quarto'),
        backgroundColor: const Color.fromARGB(255, 19, 87, 22),
        centerTitle: true,
      );
    }

    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody(),
    );
  }
}
