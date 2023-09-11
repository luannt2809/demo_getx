import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("Click: ${controller.count.value}"),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to other page"),
          onPressed: () => Get.to(() => OtherPage()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  final Controller c = Get.find();

  OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}
