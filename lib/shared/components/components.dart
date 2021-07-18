import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/news_cubit.dart';

Widget newsItem(article) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        "${article['urlToImage']}",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${article['title']}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        "${article['publishedAt']}",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

Widget MyDivider() => Container(
      color: Colors.grey,
      width: double.infinity,
      height: 1,
    );

Widget textField({
  required TextEditingController Controller,
  required TextInputType keyboard,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  required Function(String?) valide,
  required String label,
  required IconData preIcon,
  IconData? sufficon,
  bool password = false,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      enabled: isClickable,
      controller: Controller,
      obscureText: password,
      keyboardType: keyboard,
      onFieldSubmitted: (value) => onSubmit!(value),
      onChanged: (value) => onChange!(value),
      validator: (value) => valide(value),
      decoration: InputDecoration(
        //hintText: "Enter your email address",
        labelText: "$label",
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          preIcon,
        ),
        suffixIcon: sufficon != null
            ? IconButton(
                onPressed: () => suffixPressed!(),
                icon: Icon(
                  sufficon,
                ),
              )
            : null,
      ),
      onTap: () => onTap!(),
    );
