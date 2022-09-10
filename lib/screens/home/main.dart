import 'package:flutter/material.dart';
import 'package:test_mottu/controllers/home.controller.dart';
import 'package:test_mottu/widgets/alert.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeController homeController;
  late TextEditingController nameUSerController;

  modifyState() {
    setState(() {});
  }

  @override
  void initState() {
    homeController = HomeController(modifyState);
    nameUSerController = TextEditingController();
    homeController.capturingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          floatingActionButton: SizedBox(
            width: 70,
            height: 70,
            child: FloatingActionButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                homeController.randomName();
                if (homeController.listName.length >= 2) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertCustom(context)
                          .AlertDialogRandom(homeController: homeController));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => AlertCustom(context).AlertDialogError());
                }
              },
              child: const Text('Sortear'),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Sorteio de Nomes'),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Adicione o nome de um participante',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameUSerController,
                  ),
                ),
                MaterialButton(
                    color: Colors.green,
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (nameUSerController.text.isNotEmpty) {
                        homeController.addNameUser(
                            name: nameUSerController.text);
                        nameUSerController.clear();
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: homeController.listName.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) => Card(
                              child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      homeController.listName[index],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      homeController.removeName(index: index);
                                    },
                                    icon: const Icon(Icons.close_sharp))
                              ],
                            ),
                          )))),
                ),
              ],
            ),
          )),
    );
  }
}
