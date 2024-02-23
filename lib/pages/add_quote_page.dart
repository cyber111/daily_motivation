import 'package:daily_motivation/components/my_button.dart';
import 'package:daily_motivation/components/my_text_field.dart';
import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:daily_motivation/providers/motivation_quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddQuotePage extends StatelessWidget {
  const AddQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController textController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController authorController = TextEditingController();
    return Consumer<MotivationQuoteProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Add Quote'),
            centerTitle: true,
          ),
          body: Card(
            margin: const EdgeInsets.only(top: 10, bottom: 300, right: 12, left: 12),
            child: Column(
              children: [
                const SizedBox(height: 40),
                //Title
                MyTextField(hintText: 'Title', textEditingController: titleController),
                const SizedBox(height: 12),
                //Text
                MyTextField(hintText: 'Text', textEditingController: textController),
                const SizedBox(height: 12),
                //Category
                MyTextField(hintText: 'Category', textEditingController: categoryController),
                const SizedBox(height: 12),
                //Author
                MyTextField(hintText: 'Author', textEditingController: authorController),
                const SizedBox(height: 12),
                //Button Add
                MyButton(
                    onTap: () {
                      provider.insert(MotivationQuote(
                        title: titleController.text,
                        text: textController.text,
                        author: authorController.text,
                        category: categoryController.text,
                      ));
                      Fluttertoast.showToast(msg: 'Quote Added', fontSize: 15, gravity: ToastGravity.CENTER);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add Quote',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary, fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
