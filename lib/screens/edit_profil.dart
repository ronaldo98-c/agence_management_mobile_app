import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {

  EditProfileScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'First name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'Last name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: CircleAvatar(
                    radius: 10.r,
                    backgroundColor: Colors.green,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 10.h),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Sexe',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Masculin',
                  child: Text('Masculin'),
                ),
                DropdownMenuItem(
                  value: 'Féminin',
                  child: Text('Féminin'),
                ),
              ],
              onChanged: (value) {
                // Handle the selected value
              },
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                }
              },
            ),
            SizedBox(height: 20.h),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Constants.darkBlueColor ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.r), // Assurez-vous que le rayon est 0
                ),
                minimumSize: const Size(100, 50)
              ),
              child: const Text('Mettre à jour'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
