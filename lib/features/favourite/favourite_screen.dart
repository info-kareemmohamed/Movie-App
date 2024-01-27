import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      body: _buildRowList(),
    );
  }

  Widget _buildRowList() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://resizing.flixster.com/dV1vfa4w_dB4wzk7A_VzThWUWw8=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzEyZDMyYjZmLThmNzAtNDliNC1hMjFmLTA2ZWY4M2UyMjJhMi5qcGc='),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(children: [
                    Text(
                      'oppenheimer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '2023 Total of 4,25GB',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text(
                        'Movie',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  SizedBox(width: 0,),
                  Column(
                    children: [
                      ElevatedButton.icon( style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),onPressed: (){}, icon:Icon( Icons.play_arrow_outlined,color: Colors.black,),label: Text('Show',style: TextStyle(color: Colors.black,fontSize: 13),),),                    ElevatedButton.icon( style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),onPressed: (){}, icon:Icon( Icons.delete,color: Colors.white,),label: Text('Delete',style: TextStyle(color: Colors.white,fontSize: 13),),)
                    ],
                  )
                ],
              ),


            ],
          ),
        );
      },
    );
  }
}