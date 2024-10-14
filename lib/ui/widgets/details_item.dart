import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import 'capsule_container.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    super.key,
    required this.first,
    required this.second,
  });
  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CapsuleContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              first,
              style: context.textStyles.headlineSmall,
            ),
            Text(
              second,
              style: context.textStyles.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
