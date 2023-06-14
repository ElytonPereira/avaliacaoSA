import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tela_cliente/componentes/botao.dart';
import 'package:tela_cliente/componentes/caixaTexto.dart';
import 'package:tela_cliente/componentes/texto.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente>  with RestorationMixin {

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2000, 1, 1));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1950),
          lastDate: DateTime(2023),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Data selecionada: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final nome = TextEditingController();
    final senha = TextEditingController();
    final cpf = TextEditingController();
    final endereco = TextEditingController();
    final dataNasc = TextEditingController();
    final cep = TextEditingController();
    final cidade = TextEditingController();
    String data =
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';

    criaAppBar(){
      return AppBar(
        title: const Text('Cadastro de cliente'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
        centerTitle: true,
      );
    }

    criaRow1(){
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: nome,
              texto: 'Nome',
              msgValidacao: 'Digite o seu nome',            
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: cpf,
              texto: 'CPF',
              msgValidacao: 'Digite o seu CPF',            
            ),
          )
        ],
      );
    }
    criaRow2(){
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: senha,
              texto: 'Senha',
              msgValidacao: 'Digite o sua senha',
              senha: true,            
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: cep,
              texto: 'CEP',
              msgValidacao: 'Digite o seu CEP',            
            ),
          ),
          
        ],
      );
    }
    criaRow3(){
      return Row(
        children: [
          Expanded(
            child: CaixaTexto(
              controlador: endereco,
              texto: 'Endereço',
              msgValidacao: 'Digite o seu Endereco',            
            ),
          ),
          Expanded(
            child: CaixaTexto(
              controlador: cidade,
              texto: 'Cidade',
                     
            ),
          ),         
        ],
      );
    }

    criaRowData() {
      return Row(
        
        children: [
          Botao(
            textoBotao: 'Nascimento',
            tamanhoTexto: 10,
            
            funcaoBotao: () {
              _restorableDatePickerRouteFuture.present();
            },
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            child: Texto(
              conteudo: data,
            ),
          )
          
        ],
      );
    }

    criaColuna1(){
      return Expanded(
        flex: 5,
        child: Container(
          decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
          child: Column(
            children: [
              criaRow1(),
              criaRow2(),
              criaRow3(),
              criaRowData()
              
            ],
          ),
        ),
      );
    }
    criaColuna2(){
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
                funcaoBotao: (){},
                tamanhoTexto: 10,
                
                
              ),
              Botao(
                textoBotao: 'Alterar',
                funcaoBotao: (){},
                tamanhoTexto: 10,
                
              ),
              Botao(
                textoBotao: 'Salva',
                funcaoBotao: (){},
                tamanhoTexto: 10,
              ),
              Botao(
                textoBotao: 'Deletar',
                funcaoBotao: (){},
                tamanhoTexto: 10,
              ),
              Botao(
                textoBotao: 'Pesquisa CEP',
                funcaoBotao: (){},
                tamanhoTexto: 8,
          )
            ],
          ),
        ),
      );
    }
    
    criaBody(){
      
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              criaColuna1(),
              criaColuna2()
            ],
          ),
        );
      
      
    }

    

    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody()
      
      
    );
  }
}