import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/widgets/PersonalInfoEditType.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Personalinfrotiles extends StatefulWidget {
  final String label;
  final String? value;
  final bool showEdit;
  final Function(String)? onValueChanged;
  final PersonalInfoEditType editType;

  const Personalinfrotiles({
    super.key,
    required this.label,
    required this.value,
    this.showEdit = true,
    this.onValueChanged,
    this.editType = PersonalInfoEditType.text,
  });

  @override
  _PersonalinfrotilesState createState() => _PersonalinfrotilesState();
}

class _PersonalinfrotilesState extends State<Personalinfrotiles> {
  bool _isEditing = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(Personalinfrotiles oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && !_isEditing) {
      _controller.text = widget.value ?? "";
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus && _isEditing) {
      _saveAndExitEditing();
    }
  }

  void _saveAndExitEditing() {
    if (_controller.text.isEmpty) {
      _controller.text = widget.value ?? "";
    }

    setState(() {
      _isEditing = false;
    });

    if (widget.onValueChanged != null && _controller.text != widget.value) {
      widget.onValueChanged!(_controller.text);
    }
  }

  void _enterEditing() {
    if (widget.editType == PersonalInfoEditType.date) {
      _selectDate(context);
    } else {
      setState(() {
        _isEditing = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      if (widget.onValueChanged != null) {
        widget.onValueChanged!(formattedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius(12)),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width(16),
            vertical: Dimensions.height(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: widget.label,
                      style: TextStyle(
                        fontSize: Dimensions.font(12),
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: Dimensions.height(5)),
                    _isEditing
                        ? TextFormField(
                            controller: _controller,
                            focusNode: _focusNode,
                            keyboardType: widget.editType == PersonalInfoEditType.phone
                                ? TextInputType.phone
                                : TextInputType.text,
                            inputFormatters: widget.editType == PersonalInfoEditType.phone
                                ? [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ]
                                : [],
                            validator: (value) {
                              if (widget.editType == PersonalInfoEditType.phone) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a contact number.';
                                }
                                if (value.length != 10) {
                                  return 'Contact number must be 10 digits.';
                                }
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            style: TextStyle(fontSize: Dimensions.font(16)),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                            ),
                            onFieldSubmitted: (value) {
                              _saveAndExitEditing();
                            },
                          )
                        : AppText(
                            text: widget.value ?? "Add Details",
                            style: TextStyle(fontSize: Dimensions.font(16)),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ],
                ),
              ),
              if (widget.showEdit)
                InkWell(
                  onTap: _enterEditing,
                  child: Icon(
                    widget.editType == PersonalInfoEditType.date ? Icons.calendar_today : Icons.edit,
                    color: bottomSheetSubtitle,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height(12)),
      ],
    );
  }
}
