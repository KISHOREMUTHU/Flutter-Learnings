import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CareerOrientedQuiz extends StatefulWidget {
  final int? academicQuizmark;
  const CareerOrientedQuiz({Key? key,this.academicQuizmark}) : super(key: key);

  @override
  State<CareerOrientedQuiz> createState() => _CareerOrientedQuizState();
}

class _CareerOrientedQuizState extends State<CareerOrientedQuiz> {
  final _formKey = GlobalKey<FormBuilderState>();
  int? markPercentage;
  int? preferredLocation;
  int? furtherEducation;
  int? numberOfSubjects;
  int? academics;
  int? academicQuizmark;

  @override
  void initState() {
    super.initState();
    markPercentage=0;
    preferredLocation=0;
    furtherEducation=0;
    numberOfSubjects=0;
    academicQuizmark=0;
    academics=0;
  }

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;

    return Scaffold(

      body: Container(
          decoration: const BoxDecoration(

            gradient: LinearGradient(


              colors: [
                Color(0xFF3550DC),
                Color(0xFF27E9F7),

              ],
            ),
          ),
          child:Column(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0,0,40),
                    child: Text("Academic Details",
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  )
                ],
              ),
              Container(
                height: size.height * .8,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      FormBuilder(
                        key: _formKey,
                        onChanged: () {
                          _formKey.currentState!.save();
                          debugPrint(_formKey.currentState!.value.toString());
                        },
                        skipDisabled: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Percentage of marks in 10th and 11th',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                          )
                                      ),
                                      FormBuilderRadioGroup<String>(
                                        orientation: OptionsOrientation.vertical,
                                        decoration:  InputDecoration(
                                            border: InputBorder.none,

                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 24, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                            )
                                        ),
                                        initialValue: null,
                                        name: 'marks',
                                        onChanged: (value){
                                          setState(() {
                                            if(value == 'Above 85'){
                                              markPercentage=4;
                                            }
                                            else if(value == '71-85'){
                                              markPercentage=3;
                                            }
                                            else if(value == '56-70'){
                                              markPercentage=2;
                                            }
                                            else if(value == '40-55'){
                                              markPercentage=1;
                                            }
                                            else{
                                              markPercentage=0;
                                            }
                                          });
                                          print(markPercentage);
                                        },
                                        validator: FormBuilderValidators.compose(
                                            [FormBuilderValidators.required()]),
                                        options:
                                        ['Above 85', '71-85', '56-70', '40-55', 'Less than 40']
                                            .map((mark) => FormBuilderFieldOption(
                                          value: mark,
                                          child: Text(mark, style: GoogleFonts.montserrat(fontSize: 15, color: Theme.of(context).secondaryHeaderColor),),
                                        ))
                                            .toList(growable: false),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Do you have a preferred location for higher studies?',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                          )
                                      ),
                                      FormBuilderRadioGroup<String>(
                                        orientation: OptionsOrientation.vertical,
                                        decoration:  InputDecoration(
                                            border: InputBorder.none,

                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 24, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                            )
                                        ),

                                        initialValue: null,
                                        name: 'location',
                                        onChanged: (value){
                                          setState(() {
                                            if(value == 'Yes, I have'){
                                              preferredLocation=4;
                                            }

                                            else{
                                              preferredLocation=0;
                                            }
                                          });
                                          print(preferredLocation);
                                        },
                                        validator: FormBuilderValidators.compose(
                                            [FormBuilderValidators.required()]),
                                        options:
                                        ['Yes, I have', "No, I don't have"]
                                            .map((mark) => FormBuilderFieldOption(
                                          value: mark,
                                          child: Text(mark, style: GoogleFonts.montserrat(fontSize: 15, color: Theme.of(context).secondaryHeaderColor),),
                                        ))
                                            .toList(growable: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Are you interested in pursuing further education after your undergraduate studies?',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                          )
                                      ),
                                      FormBuilderRadioGroup<String>(
                                        orientation: OptionsOrientation.vertical,
                                        decoration:  InputDecoration(
                                            border: InputBorder.none,

                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 24, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                            )
                                        ),

                                        initialValue: null,
                                        name: 'further_education',
                                        onChanged: (value){
                                          setState(() {
                                            if(value == 'Yes, I have'){
                                              furtherEducation=2;
                                            }

                                            else{
                                              furtherEducation=0;
                                            }
                                          });
                                          print(furtherEducation);
                                        },
                                        validator: FormBuilderValidators.compose(
                                            [FormBuilderValidators.required()]),
                                        options:
                                        ['Yes, I have', "No, I don't have"]
                                            .map((mark) => FormBuilderFieldOption(
                                          value: mark,
                                          child: Text(mark, style: GoogleFonts.montserrat(fontSize: 15, color: Theme.of(context).secondaryHeaderColor),),
                                        ))
                                            .toList(growable: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('I believe that I am very much aware of my academic strengths and weaknesses',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                          )
                                      ),
                                      FormBuilderRadioGroup<String>(
                                        orientation: OptionsOrientation.vertical,
                                        decoration:  InputDecoration(
                                            border: InputBorder.none,

                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 24, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                            )
                                        ),

                                        initialValue: null,
                                        name: 'further_education',
                                        onChanged: (value){
                                          setState(() {
                                            if(value == 'Strongly Agree'){
                                              academics=4;
                                            }
                                            else if(value == 'Slightly Agree'){
                                              academics=3;
                                            }
                                            else if(value == 'Slightly Disagree'){
                                              academics=2;
                                            }

                                            else{
                                              academics=1;
                                            }
                                          });
                                          print(academics);
                                        },
                                        validator: FormBuilderValidators.compose(
                                            [FormBuilderValidators.required()]),
                                        options:
                                        ['Strongly Agree', "Slightly Agree","Slightly Disagree","Strongly Disagree"]
                                            .map((mark) => FormBuilderFieldOption(
                                          value: mark,
                                          child: Text(mark, style: GoogleFonts.montserrat(fontSize: 15, color: Theme.of(context).secondaryHeaderColor),),
                                        ))
                                            .toList(growable: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('How many subjects in high school did you enjoy the most?',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                          )
                                      ),
                                      FormBuilderRadioGroup<String>(
                                        orientation: OptionsOrientation.vertical,
                                        decoration:  InputDecoration(
                                            border: InputBorder.none,

                                            labelStyle: GoogleFonts.montserrat(
                                                fontSize: 24, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold
                                            )
                                        ),

                                        initialValue: null,
                                        name: 'subjects',
                                        onChanged: (value){
                                          setState(() {
                                            if(value == 'All subjects'){
                                              numberOfSubjects=6;
                                            }
                                            else if(value == 'More than 4 subjects'){
                                              numberOfSubjects=5;
                                            }
                                            else if(value == 'Half of all subjects'){
                                              numberOfSubjects=3;
                                            }
                                            else if(value== '1 or 2 subjects'){
                                              numberOfSubjects=2;
                                            }

                                            else{
                                              numberOfSubjects=1;
                                            }
                                          });
                                          print(numberOfSubjects);
                                        },
                                        validator: FormBuilderValidators.compose(
                                            [FormBuilderValidators.required()]),
                                        options:
                                        ['All subjects', "More than 4 subjects","Half of all subjects","1 or 2 subjects",'I hate my subjects']
                                            .map((mark) => FormBuilderFieldOption(
                                          value: mark,
                                          child: Text(mark, style: GoogleFonts.montserrat(fontSize: 15, color: Theme.of(context).secondaryHeaderColor),),
                                        ))
                                            .toList(growable: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:50.0,bottom: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                  onPressed: () {

                                    Navigator.pop(context);
                                  },
                                  // color: Theme.of(context).colorScheme.secondary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Go back',
                                      style: GoogleFonts.montserrat(
                                          color: Theme.of(context).colorScheme.secondary, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(

                                  onPressed: () {
                                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                                      debugPrint(_formKey.currentState?.value.toString());
                                      setState(() {
                                        academicQuizmark=academics!+preferredLocation!+furtherEducation!+markPercentage!+numberOfSubjects!;

                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CareerOrientedQuiz()));
                                    } else {
                                      debugPrint(_formKey.currentState?.value.toString());
                                      debugPrint('validation failed');
                                    }
                                  },
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.montserrat(color: Theme.of(context).colorScheme.secondary, fontSize: 20,  fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            ],
          )

      ),
    );
  }
  void _onChanged(dynamic val) => debugPrint(val.toString());
}
