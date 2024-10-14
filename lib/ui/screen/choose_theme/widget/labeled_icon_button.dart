import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/theme/app_colors.dart';

class LabeledIconButton extends StatelessWidget {
  const LabeledIconButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.iconPath,
  });
  final VoidCallback onTap;
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).brightness ==
                            (label == 'Dark Mode'
                                ? Brightness.dark
                                : Brightness.light)
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 2)),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black87,
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.fill,
                width: 60,
              ),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
                color: AppColors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
