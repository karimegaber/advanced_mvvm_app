import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String errorText;
  final Stream<bool> stream;
  final TextInputType inputType;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.errorText,
      required this.stream,
      required this.inputType,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s28.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: StreamBuilder<bool>(
            stream: stream,
            builder: (context, snapshot) {
              return TextFormField(
                keyboardType: inputType,
                controller: controller,
                decoration: InputDecoration(
                  hintText: label,
                  labelText: label,
                  errorText: (snapshot.data ?? true) ? null : errorText,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
