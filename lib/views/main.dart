import 'package:api_explorer/controllers/settings_controller.dart';
import 'package:api_explorer/views/settings_view.dart';
import 'package:api_explorer/widgets/window_button.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  final SettingsController settingsController;
  const MainView({
    super.key,
    required this.settingsController,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  double popMenuItemHeight = 25;
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: WindowTitleBarBox(
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: FlutterLogo(size: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  PopupMenuButton(
                    tooltip: "",
                    offset: Offset.fromDirection(2, 25),
                    onSelected: (value) => value(),
                    child: Text(
                      "File",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        height: popMenuItemHeight,
                        child: Text(
                          "New",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      // PopupMenuItem(
                      //   height: popMenuItemHeight,
                      //   child: Expanded(
                      //     child: PopupMenuButton(
                      //       tooltip: '',
                      //       offset: Offset.fromDirection(0, 100),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             "New",
                      //             style: Theme.of(context).textTheme.bodyMedium,
                      //           ),
                      //           const Center(
                      //               child: Icon(
                      //             Icons.chevron_right,
                      //             size: 15,
                      //           )),
                      //         ],
                      //       ),
                      //       itemBuilder: (_) {
                      //         return [
                      //           PopupMenuItem(
                      //             height: popMenuItemHeight,
                      //             child: Text(
                      //               "Request",
                      //               style:
                      //                   Theme.of(context).textTheme.bodyMedium,
                      //             ),
                      //           ),
                      //           PopupMenuItem(
                      //             height: popMenuItemHeight,
                      //             child: Text(
                      //               "Document",
                      //               style:
                      //                   Theme.of(context).textTheme.bodyMedium,
                      //             ),
                      //           ),
                      //         ];
                      //       },
                      //     ),
                      //   ),
                      // ),
                      PopupMenuItem(
                        height: popMenuItemHeight,
                        value: () {
                          Navigator.of(context).push(
                            DialogRoute(
                              context: context,
                              builder: (context) => SettingsView(
                                controller: widget.settingsController,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Settings",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      PopupMenuItem(
                        height: popMenuItemHeight,
                        child: Text(
                          "Exit",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                    tooltip: "",
                    offset: Offset.fromDirection(2, 25),
                    onSelected: (value) => value(),
                    child: Text(
                      "Help",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        height: popMenuItemHeight,
                        value: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AboutDialog(
                                applicationName: "API Explorer",
                                applicationIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      color: Colors.white,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FlutterLogo(
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                applicationVersion: "Pre-ALPHA",
                              );
                            },
                          );
                        },
                        child: Text(
                          "About",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: MoveWindow(
                      child: Center(
                        child: Text(
                          "API Explorer",
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const WindowButtons(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                LeftSide(settingsController: widget.settingsController),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 280,
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                        appBar: TabBar(
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          isScrollable: true,
                          indicator: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                          ),
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.api,
                                  color: Colors.cyan,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("API request"),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.file_present,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("Document"),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        body: TabBarView(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton(
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              underline: Container(),
                                              value: selectedMethod ?? 'GET',
                                              items: [
                                                'GET',
                                                'POST',
                                                'PUT',
                                                'UPDATE',
                                                'DELETE'
                                              ]
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedMethod = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Expanded(child: TextField())
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Center(child: Text("2")),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("Ready"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({super.key, required this.settingsController});
  final SettingsController settingsController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(children: [
                SizedBox(
                  height: 50,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.home_outlined),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          DialogRoute(
                            context: context,
                            builder: (context) => SettingsView(
                              controller: settingsController,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.settings_outlined),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Column(
                children: [
                  WindowTitleBarBox(child: MoveWindow()),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: const []),
      ),
    );
  }
}
