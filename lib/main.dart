import 'package:flutter/material.dart';
import 'package:team55tasks/tasks/home_page.dart';

// Import the firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //flutter fire example

  runApp(const TaskApp());
}

// чем этот способ плох?
// тем что если апп уже проверена что нормально инициализируется - а потом грохнули файрбейс ?
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); //flutter fire example
//   await Firebase.initializeApp();

//   // Ideal time to initialize firebase emulator
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

//   runApp(const TaskApp());
// }

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class TaskApp extends StatefulWidget {
  const TaskApp({Key? key}) : super(key: key);

  // Create the initialization Future outside of `build`:
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  /// The future is part of the state of our widget.
  /// We should not call `initializeApp` directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return somethingWentWrong(context); // firebase app not initialized
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return rootApp(context);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return loading(context);
      },
    );
  }

  Widget loading(BuildContext context) {
    return const Text('LOADING');
  }

  Widget somethingWentWrong(BuildContext context) {
    return const Text('Something Went Wrong');
  }

  Widget rootApp(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo !!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page !!'),
    );
  }
}

class FireStore {
  //создать инстанс
//FirebaseAuth auth = FirebaseAuth.instance;

//авторизоваться анонимно
//UserCredential userCredential = await auth.signInAnonymously();

//подписаться на обновления статуса юзера
  // FirebaseAuth.instance.authStateChanges()
  //     //.idTokenChanges() или так
  //     //userChanges() но читать особенности методов - этот больше событий ловит
  //     // что бы перечитать юзера надо дергать FirebaseAuth.instance.currentUser.reload()
  //     .listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });

//регистрация по email
// try {
//   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: "barry.allen@example.com",
//     password: "SuperSecretPassword!"
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }

// вход в систему
// try {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: "barry.allen@example.com",
//     password: "SuperSecretPassword!"
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }

//проверка мыла
// User? user = FirebaseAuth.instance.currentUser;

// if (user!= null && !user.emailVerified) {
//   await user.sendEmailVerification();
// }

// там еще другие методы есть по ссылке и обработке диплинка
// и аторизации по сслыке

// выход
// await FirebaseAuth.instance.signOut();

//линковка аккаунтов
//менеджмент - удаление и новая регистрация

}

class MainTasksApp extends StatelessWidget {
  const MainTasksApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo !!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page !!'),
    );
  }
}
