import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dialogfilter extends StatefulWidget {
  const Dialogfilter({super.key});

  @override
  State<Dialogfilter> createState() => _DialogfilterState();
}

class _DialogfilterState extends State<Dialogfilter> {
  String _selectedOption = 'Latest';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.arrangementOptions),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    activeColor: const Color(0xff283E50),
                    title: Text(AppLocalizations.of(context)!.latest),
                    value: 'Latest',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                      Navigator.of(context).pop();
                      

                    },
                  ),
                  RadioListTile<String>(
                    activeColor: const Color(0xff283E50),
                    title: Text(AppLocalizations.of(context)!.oldest),
                    value: 'Oldest',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                      Navigator.of(context).pop();

                    },
                  ),
                  RadioListTile<String>(
                    activeColor: const Color(0xff283E50),
                    title: Text(AppLocalizations.of(context)!.sortAscending),
                    value: 'ascending',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                      Navigator.of(context).pop();

                    },
                  ),
                  RadioListTile<String>(
                    activeColor: const Color(0xff283E50),
                    title: Text(AppLocalizations.of(context)!.sortDescending),
                    value: 'Descending',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.exit,style: const TextStyle(color: Colors.black26 ),),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.filter_list_outlined, color: Colors.white, size: 30),
    );
  }
  }


//SecondDialog
class SecondDialog {
  static void showSecondDialog(BuildContext context) {
    List<String> _selectedCategories = [];
    String _selectedType = 'Stories';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(

          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.selectType,style: const TextStyle(fontSize: 25),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(

                    title: Text(AppLocalizations.of(context)!.stories),
                    value: 'Stories',
                    groupValue: _selectedType,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                      Navigator.of(context).pop();
                      showSecondDialog(context);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(AppLocalizations.of(context)!.novels),
                    value: 'Novels',
                    groupValue: _selectedType,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                      Navigator.of(context).pop();
                      showSecondDialog(context);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,left: 100,top: 10),
                    child: Text(AppLocalizations.of(context)!.selectCategory,style: const TextStyle(fontSize: 25),),
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.horror),
                    value: _selectedCategories.contains('Horror'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('Horror');
                        } else {
                          _selectedCategories.remove('Horror');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.romance),
                    value: _selectedCategories.contains('Romance'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('Romance');
                        } else {
                          _selectedCategories.remove('Romance');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.children),
                    value: _selectedCategories.contains('Children'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('Children');
                        } else {
                          _selectedCategories.remove('Children');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.adventure),
                    value: _selectedCategories.contains('Adventure'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('Adventure');
                        } else {
                          _selectedCategories.remove('Adventure');
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.exit,style: const TextStyle(color: Colors.black26 ),),
                ),
              ],

            );
          },
        );
      },
    );
  }
}

class thirdDialog {
  static void showRatingDialog(BuildContext context) {
    double currentRating = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.rateFrom),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppLocalizations.of(context)!.selectYourRating),
                  Slider(
                    value: currentRating,
                    min: 0,
                    activeColor: const Color(0xff283E50),
                    max: 10,
                    divisions: 9,
                    label: currentRating.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        currentRating = value;
                        
                      });
                    },
                  ),
                  Text('${AppLocalizations.of(context)!.rating} ${currentRating.round()}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.exit,style: const TextStyle(color: Colors.black26 ),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.submit,style: const TextStyle(color: Color(0xff283E50) ),),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
