import 'package:demo_getx/controller/congviec_controller.dart';
import 'package:demo_getx/model/CongViecModel.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/pageB', page: () => PageB()),
        GetPage(name: '/pageC', page: () => PageC()),
      ],
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count.value++;
    update();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // đăng ký controller
    final CongViecController controller = Get.put(CongViecController());
    print(controller.isLoading.value);

    return Scaffold(
        appBar: AppBar(title: Text("Fetch Data Demo")),

        // c1:
        // body: GetX<Controller>(
        //   builder: (value) {
        //     print("count rebuild");
        //     return Text("${value.count.value}");
        //   },
        // )

        // c2:
        // body: GetBuilder<Controller>(
        //   init: Controller(),
        //   builder: (controller) {
        //     return Obx(() => Text("${controller.count.value}"));
        //   },
        // ),

        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                CongViec congviec = controller.listCongViec[index];
                return Container(
                  child: Column(
                    children: [
                      Text(congviec.tieuDe.toString()),
                    ],
                  ),
                );
              },
              itemCount: controller.listCongViec.length,
            );
          }
        }));
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${controller.count.value}")),
            ElevatedButton(
              // onPressed: () => Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => PageB()),
              // ),
              onPressed: () => Get.toNamed('/pageB'),
              child: Text("Next Page B"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => PageC()),
              child: Text("Next Page C"),
            ),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text("Incremnent"),
            ),
            ElevatedButton(
              onPressed: () => Get.defaultDialog(
                  title: "GetX Dialog",
                  middleText: "Content Dialog",
                  textConfirm: "Yes",
                  textCancel: "No"),
              child: Text("Show Dialog"),
            ),
            ElevatedButton(
                onPressed: () => Get.bottomSheet(
                      Container(
                        child: ListTile(
                          leading: Icon(Icons.music_note),
                          title: Text("Music"),
                          onTap: () {},
                        ),
                      ),
                    ),
                child: Text("Show Bottom Sheet"))
          ],
        ),
      ),
    );
  }
}

Widget btnShowDialog() {
  final Controller controller = Get.find();
  return ElevatedButton(
    onPressed: () => Get.defaultDialog(
        title: "GetX Dialog",
        middleText: Obx(() => Text("${controller.count.value}")).toString(),
        textConfirm: "Yes",
        textCancel: "No"),
    child: Text("Show Dialog"),
  );
}

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page B"),
      ),
      body: Center(
        child: GetBuilder<Controller>(
          init: Controller(),
          builder: (controller) {
            return Column(
              children: [
                Text("${controller.count.value}"),
                ElevatedButton(
                  onPressed: controller.increment,
                  child: Text("Incremnent"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  final Controller c = Get.find();

  PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page C"),
      ),
      body: Center(
        child: Text("${c.count.value}"),
      ),
    );
  }
}
