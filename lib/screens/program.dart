import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/enums/program.enums.dart';
import 'package:myapp/models/program.model.dart';
import 'package:myapp/screens/program-form.page.dart';
import 'package:myapp/utils/svg.utils.dart';

const duration = Duration(milliseconds: 300);

class ProgramPage extends StatefulWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  State<ProgramPage> createState() => ProgramPageState();
}

class ProgramPageState extends State<ProgramPage> {
  bool _showFab = false;
  List<Program> _items = [];

  bool _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = _items.removeAt(oldIndex);
      _items.insert(index, item);
    });
    return true;
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          elevation: 0,
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }

  Widget _renderProgramItem(Program item, int index) {
    Widget _renderSwipeActionCell(child) {
      final trailingActions = <SwipeAction>[
        SwipeAction(
          widthSpace: 0,

          /// this is the same as iOS native
          performsFirstActionWithFullSwipe: true,
          content: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              children: [
                Icon(
                  Icons.remove_circle_outline,
                  color: Color.fromRGBO(255, 51, 51, 0.7),
                  size: 66,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "REMOVE",
                  style: TextStyle(color: Color.fromRGBO(255, 51, 51, 0.7)),
                ),
              ],
            ),
          ]),
          onTap: (CompletionHandler handler) async {
            await handler(true);
            _items.removeAt(index);
            setState(() {});
          },
          // color: Color.fromRGBO(255, 51, 51, 0.7),
          color: Colors.transparent,
        ),
      ];
      return SwipeActionCell(
          backgroundColor: Colors.transparent,
          key: ObjectKey(item),
          child: child,
          trailingActions: trailingActions);
    }

    Widget _renderContent() {
      return Padding(
        key: ValueKey(item),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: InkWell(
          onTap: _showForm,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 1,
                  minHeight: 141,
                  maxHeight: 141,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: SecondaryColor, width: 3),
                  color: BackgroundColor,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: item.type == ExerciseType.PushUps
                            ? [
                                LottieBuilder.asset(
                                  "assets/lottie/pushups.json",
                                  height: 80,
                                ),
                                Text("PUSH UPS",
                                    style:
                                        Theme.of(context).textTheme.bodyText2)
                              ]
                            : [
                                LottieBuilder.asset(
                                  "assets/lottie/pullups.json",
                                  height: 80,
                                ),
                                Text("PULL UPS",
                                    style:
                                        Theme.of(context).textTheme.bodyText2)
                              ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.quantity.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: PrimaryColor),
                          ),
                          Text("${item.interval}M",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      );
    }

    final content = _renderContent();
    return _renderSwipeActionCell(content);
  }

  List<Program> _getItems() {
    return List.generate(
        10,
        (index) => Program(
            type:
                (index % 2) == 0 ? ExerciseType.PullUps : ExerciseType.PushUps,
            interval: 0.30,
            quantity: 15));
  }

  @override
  void initState() {
    super.initState();
    _items = _getItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showForm() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProgramFormPage(mode: Mode.CREATE)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: renderArrowLeftIcon(color: PrimaryColor),
          ),
        ),
        title: Text(
          "CHANGE A PROGRAM",
          style: TextStyle(fontSize: 32, height: 1.333),
        ),
        centerTitle: true,
      ),
      // TODO вывести это в Hight Order Widget
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: ReorderableListView.builder(
          onReorder: _onReorder,
          proxyDecorator: _proxyDecorator,
          itemBuilder: ((context, index) {
            final item = _items[index];
            return _renderProgramItem(item, index);
          }),
          itemCount: _items.length,
        ),
      ),
      floatingActionButton: AnimatedSlide(
        offset: _showFab ? Offset.zero : Offset(0, 2),
        duration: duration,
        child: FloatingActionButton(
          onPressed: _showForm,
          child: Icon(Icons.add),
          elevation: 0,
          backgroundColor: SecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
