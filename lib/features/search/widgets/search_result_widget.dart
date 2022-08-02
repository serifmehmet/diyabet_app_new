import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/bottom_sheet/bottom_sheet_widget.dart';
import '../../../domain/entities/cache_food_list_item.dart';
import '../../food/cubit/food_unit_cubit.dart';

class SearchResultWidget extends StatefulWidget {
  final List<CacheFoodListItem?> foodEntity;

  const SearchResultWidget({Key? key, required this.foodEntity}) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (context) {
                    return BottomSheetWidget(
                      foodId: widget.foodEntity[index]!.Id!,
                    );
                  }).whenComplete(
                () => BlocProvider.of<FoodUnitCubit>(context).clearUnits(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.foodEntity[index]!.Name!,
                      style: Theme.of(context).textTheme.orangeText,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          height: 1,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
        );
      },
      itemCount: widget.foodEntity.length,
    );
  }
}
