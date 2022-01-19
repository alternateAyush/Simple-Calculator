import 'package:calculator_task/calculate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color color1 = Color(0xFF413D4B);
const Color color2 = Color(0xFFF4B6B0);
const Color color3 = Color(0xFFF5DFD9);
const Color color4 = Color(0xFFDA7E70);
const Color color5 = Color(0xFFE8CCCC);

Widget buildRowOne() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSymbol('( )'),
        buildSymbol('π'),
        buildSymbol('e'),
        buildSymbol('!'),
        CircleAvatar(
          radius: 25,
          backgroundColor: color5,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.unfold_more,
              color: color1,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildSymbol(String value) {
  return Consumer<Calculate>(builder: (context, manager, child) {
    return TextButton(
      onPressed: () {
        manager.screen(value);
      },
      child: Text(
        '$value',
        style: const TextStyle(
          color: color1,
          fontSize: 25,
        ),
      ),
    );
  });
}

Widget buildButton(
    String value, IconData? icon, Color textColor, Color? buttonColor) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      backgroundColor: buttonColor,
      radius: 40,
      child: textIcon(value, icon, textColor),
    ),
  );
}

Widget textIcon(String textValue, IconData? iconValue, Color valueColor) {
  return Consumer<Calculate>(builder: (context, manager, child) {
    if (iconValue != null) {
      return IconButton(
        onPressed: () {
          manager.screen(textValue);
        },
        icon: Icon(
          iconValue,
          color: valueColor,
          size: 30,
        ),
      );
    }
    return TextButton(
      onPressed: () {
        manager.screen(textValue);
      },
      child: Text(
        '$textValue',
        style: TextStyle(
          color: valueColor,
          fontSize: 30,
        ),
      ),
    );
  });
}

List<Widget> buildRows() {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildButton('AC', null, Colors.white, color1),
        buildButton('%', null, color1, color2),
        buildButton('÷', null, color1, color2),
        buildButton('delete', Icons.backspace_outlined, color1, color2),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildButton('7', null, color1, color3),
        buildButton('8', null, color1, color3),
        buildButton('9', null, color1, color3),
        buildButton('×', null, color1, color2),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildButton('4', null, color1, color3),
        buildButton('5', null, color1, color3),
        buildButton('6', null, color1, color3),
        buildButton('-', null, color1, color2),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildButton('3', null, color1, color3),
        buildButton('2', null, color1, color3),
        buildButton('1', null, color1, color3),
        buildButton('+', null, color1, color2),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: buildButton('0', null, color1, color3),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: buildButton('.', null, color1, color3),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Consumer<Calculate>(
              builder: (context, manager, child) {
                return GestureDetector(
                  onTap: () {
                    manager.screen('=');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: color4,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  ];
}
