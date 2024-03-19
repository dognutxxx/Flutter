import 'package:flutter/material.dart';

class MyAge extends StatefulWidget {
  const MyAge({Key? key}) : super(key: key);

  @override
  State<MyAge> createState() => _MyAgeState();
}

class _MyAgeState extends State<MyAge> {
  final dateController = TextEditingController();
  late String textAge = "";

  String dateISO(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  calAge(int year, int month, int day) {
    DateTime birthday = DateTime(year, month, day);

    DateTime now = DateTime.now();

    Duration difference = now.difference(birthday);
    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30).floor();
    int days = (difference.inDays % 365) % 30;

    setState(() {
      textAge = 'อายุ: $years ปี $months เดือน $days วัน';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('คำนวนอายุ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    labelText: "วันเกิด",
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2101),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );

                    if (pickedDate != null) {
                      calAge(pickedDate.year, pickedDate.month, pickedDate.day);
                      setState(() {
                        dateController.text = dateISO(pickedDate);
                      });
                    }
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAge,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
