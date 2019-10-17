import 'package:better_sales/src/shared/utils/simple_object.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidgetV2<T extends SimpleObject> extends StatelessWidget {
  final Stream<List<T>> streamList;
  final Stream<T> streamValue;
  final Function(T) onChanged;
  final String labelText;
  final String Function(T) validator;
  final T initialData;

  const CustomDropdownWidgetV2(
      {@required this.streamList,
      @required this.streamValue,
      @required this.onChanged,
      this.initialData,
      this.labelText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
        stream: streamList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data;
            return StreamBuilder<T>(
                stream: streamValue,
                initialData: initialData,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  final items = list
                      .map((item) => DropdownMenuItem<T>(
                            value: item,
                            child: Text(item.name),
                          ))
                      .toList();

                  return DropdownButtonFormField<T>(
                    decoration: InputDecoration(
                      labelText: labelText,
                    ),
                    items: items,
                    onChanged: onChanged,
                    value: value,
                    validator: validator,
                  );
                });
          }
          return Center(child: Text('Carregando...'));
        });
  }
}
