import 'package:evently_app/app_theme.dart';
import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/tabs/home/tab_items.dart';
import 'package:evently_app/widgets/default_eleveted_button.dart';
import 'package:evently_app/widgets/default_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});
  static const String routeName = '/createEvent';

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int currentIndex = 0;
  CategoryModel selectedCategory = CategoryModel.categories.first;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('d/M/yyyy');
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppTheme.primary),
        ),
        title: Text('Add event'),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.asset(
                          'assets/images/${selectedCategory.imageName}.png',
                          height: MediaQuery.sizeOf(context).height * 0.22,
                          width: double.infinity,
                          fit: .fill,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: DefaultTabController(
                        length: CategoryModel.categories.length,
                        child: TabBar(
                          tabs: CategoryModel.categories
                              .map(
                                (category) => TabItems(
                                  label: category.name,
                                  icon: category.icon,
                                  isSelected:
                                      currentIndex ==
                                      CategoryModel.categories.indexOf(
                                        category,
                                      ),
                                ),
                              )
                              .toList(),
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          labelPadding: .only(left: 8),
                          padding: .only(left: 16),
                          tabAlignment: .start,
                          onTap: (index) {
                            currentIndex = index;
                            selectedCategory =
                                CategoryModel.categories[currentIndex];
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text('Title', style: textTheme.titleMedium),
                            SizedBox(height: 8),
                            DefaultTextFormField(
                              hintText: 'Event Title',
                              controller: titleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'title can not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            Text('Description ', style: textTheme.titleMedium),
                            SizedBox(height: 8),
                            DefaultTextFormField(
                              hintText: 'Event Description',
                              controller: descriptionController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description can not be empty';
                                }
                                return null;
                              },
                              maxLines: 4,
                            ),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/calendar-add.svg',
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 4),
                                Text('Event Date'),
                                Spacer(),
                                TextButton(
                                  onPressed: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(
                                        Duration(days: 365),
                                      ),
                                      initialDate: selectedDate,
                                      initialEntryMode: .calendarOnly,
                                    );
                                    if (date != null) {
                                      selectedDate = date;
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    selectedDate == null
                                        ? 'choose date'
                                        : dateFormat.format(selectedDate!),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/clock.svg',
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 4),
                                Text('Event Time'),
                                Spacer(),
                                TextButton(
                                  onPressed: () async {
                                    TimeOfDay? time = await showTimePicker(
                                      context: context,
                                      initialTime:
                                          selectedTime ?? TimeOfDay.now(),
                                    );
                                    if (time != null) {
                                      selectedTime = time;
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    selectedTime?.format(context) ??
                                        'choose time',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            DefaultElevetedButton(
                              label: 'Add event',
                              onPressed: createEvent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void createEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedDate!.hour,
        selectedDate!.minute,
      );
      EventModel event = EventModel(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
        category: selectedCategory,
      );
      FirebaseService.createEvent(event).then((_) {
        Navigator.of(context).pop();
      });
    }
  }
}
