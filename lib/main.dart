import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fight club',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

BodyPart? defendingBodyPart;
BodyPart? attackingBodyPart;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var head = BodyPart.head;
    return Scaffold(
      backgroundColor: const Color(0xFFD5DEF0),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(width: 16),
              Expanded(child: Center(child: Text('You'))),
              SizedBox(width: 12),
              Expanded(child: Center(child: Text('Enemy'))),
              SizedBox(width: 16),
            ],
          ),
          LivesCountRow(),
          LivesCountRow(),
          LivesCountRow(),
          LivesCountRow(),
          LivesCountRow(),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(children: [
                  const SizedBox(height: 40),
                  Text('Defend'.toUpperCase()),
                  const SizedBox(height: 13),
                  BodyPartButton(
                    bodyPart: BodyPart.head,
                    selected: defendingBodyPart == BodyPart.head,
                    bodyPartSetter: _selectDefendingBodyPart,
                  ),
                  const SizedBox(height: 14),
                  BodyPartButton(
                    bodyPart: BodyPart.torso,
                    selected: defendingBodyPart == BodyPart.torso,
                    bodyPartSetter: _selectDefendingBodyPart,
                  ),
                  const SizedBox(height: 14),
                  BodyPartButton(
                    bodyPart: BodyPart.legs,
                    selected: defendingBodyPart == BodyPart.legs,
                    bodyPartSetter: _selectDefendingBodyPart,
                  ),
                ]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(children: [
                  const SizedBox(height: 40),
                  Text('Attak'.toUpperCase()),
                  const SizedBox(height: 13),
                  BodyPartButton(
                    bodyPart: BodyPart.head,
                    selected: attackingBodyPart == BodyPart.head,
                    bodyPartSetter: _selectAttackingBodyPart,
                  ),
                  const SizedBox(height: 14),
                  BodyPartButton(
                    bodyPart: BodyPart.torso,
                    selected: attackingBodyPart == BodyPart.torso,
                    bodyPartSetter: _selectAttackingBodyPart,
                  ),
                  const SizedBox(height: 14),
                  BodyPartButton(
                    bodyPart: BodyPart.legs,
                    selected: attackingBodyPart == BodyPart.legs,
                    bodyPartSetter: _selectAttackingBodyPart,
                  ),
                ]),
              ),
              SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                  child: GestureDetector(
                onTap: () => {
                  if (attackingBodyPart != null && defendingBodyPart != null)
                    {
                      setState(
                        () {
                          attackingBodyPart = null;
                          defendingBodyPart = null;
                        },
                      )
                    }
                },
                child: SizedBox(
                  height: 40,
                  child: ColoredBox(
                    color:
                        attackingBodyPart == null || defendingBodyPart == null
                            ? Colors.black38
                            : Color.fromRGBO(0, 0, 0, 0.87),
                    child: Center(
                      child: Text(
                        'Go'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _selectDefendingBodyPart(final BodyPart value) {
    setState(() {
      defendingBodyPart = value;
    });
  }

  void _selectAttackingBodyPart(final BodyPart value) {
    setState(() {
      attackingBodyPart = value;
    });
  }
}

class LivesCountRow extends StatelessWidget {
  const LivesCountRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          SizedBox(width: 16),
          Expanded(child: Center(child: Text('1'))),
          SizedBox(width: 12),
          Expanded(child: Center(child: Text('1'))),
          SizedBox(width: 16),
        ]);
  }
}

class BodyPart {
  final String name;
  const BodyPart._(this.name);
  static const head = BodyPart._('Head');
  static const torso = BodyPart._('Torso');
  static const legs = BodyPart._('Legs');
  @override
  String toString() {
    return 'BodyPart(name: $name)';
  }
}

class BodyPartButton extends StatelessWidget {
  final BodyPart bodyPart;
  final bool selected;
  final ValueSetter<BodyPart> bodyPartSetter;
  const BodyPartButton({
    Key? key,
    required this.bodyPart,
    required this.selected,
    required this.bodyPartSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bodyPartSetter(bodyPart),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
            color: selected
                ? const Color.fromRGBO(28, 121, 206, 1)
                : Colors.black38,
            child: Center(
              child: Text(bodyPart.name.toUpperCase()),
            )),
      ),
    );
  }
}
