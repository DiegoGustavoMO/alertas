//siempre hay que importar la libreria de material para flutter
import 'package:flutter/material.dart';

//la clase main principal que ejecuta la aplicacion al inciar es
//en este casso MyApp debe tener la primera letra en mayuscula
void main() => runApp(const MyApp());
//con este main estoy indicando que ejecute la aplicacion principal

//con la ayuda del los pluggins usamos statlessW o StatefulW
//la diferencia entre estos es que en el full podemos sobre escribir

//se crea el primer widget (clase) de la aplicacion
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //este es un contructor (build) donde se construye el widget y que retorna
  //un widget

  @override
  Widget build(BuildContext context) {
    //devolvemos un MaterialApp , Material es un patron de diseño de google
    //material tiene ciertos parametros como title,home
    //title define el titulo de la aplicacion
    //home lo que aparece en el inicio de la aplicacion
    return const MaterialApp(
      //Para quitar el banner de debug
      debugShowCheckedModeBanner: false,
      title: "Mi App",
      home: Inicio(),
    );
  }
}

//como en home colocamos que llame a un widget (clase) llamado Inicio()
//debemos crearlo

//creamos el widget Inicio() de tipo stateful
class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    //debemos retornar un widget usado en aplicaciones tradicionales
    //llamado Scaffold()
    //debemos recordar que hay widget que son contenedores de otros widgets
    //por eso se ve como si fuera una clase dentro de otra clase
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dialogo de Alerta"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _mostrarAlerta(context);
                },
                child: const Text("Mostrar alerta"),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text("Si"),
            ],
          ),
        ));
  }
}

//funcion para mostrar una alerta
void _mostrarAlerta(BuildContext context) {
  showDialog(
    //propiedad para mantener el cuadro de Dialogo apesar de dar click
    //fuera del cuadro de alerta usarlo para decisiones importantes
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentTextStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.red,
      //esta es otra forma de poner el color en codigo hexadecimal y rgb
      //backgroundColor: Color(0xffC52201),
      title: const Text('Hola'),
      content: const Text(
        'Esta es una alerta quieres volver?',
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
            onPressed: () {
              print("No");
              //navigator es para navegar entre ventanas
              //pop para volver a la anterior
              Navigator.pop(context);
            },
            child: const Text("No")),
        TextButton(
            onPressed: () {
              print("si");
              Navigator.pop(context);
            },
            child: const Text("Si"))
      ],
    ),
  );
}
