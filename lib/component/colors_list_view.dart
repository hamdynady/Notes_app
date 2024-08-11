import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/component/color_item.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubit/add_note_cubit/add_note_cubit.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentColorInde = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              currentColorInde = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              setState(() {});
            },
            child: ColorItem(
              isSelected: currentColorInde == index,
              color: kColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
