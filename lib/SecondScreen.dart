import 'package:flutter/material.dart';
import 'package:navigation_page/network_helper.dart';

class SecondScreen extends StatelessWidget {

var newAppBarName;
List timeago =[
  '2 hr ago',
  '7 hr ago',
  '5 hr ago',
  '2020-11-21',
  null
];

List content = [
  'Promoted to trainee',
  'Promoted to junior',
  'Promoted to mid level',
  'Promoted to senior',
  null
];

List numberofDocuments = [
  '2 Docs',
  '5 Docs',
  '3 Docs',
  '6 Docs',
  null
  ];

List filterData= [
  'General',
  'Law',
  'Public Purchase',
  'Promotion',
  'Holidays',
  'Housing'
];



SecondScreen(
  {this.newAppBarName,
});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Color(0xFF1E7FB2,
),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: (){
          NetworkHelper networkHelper =  NetworkHelper();
          networkHelper.getWeatherNews();
          },
          child: Text('$newAppBarName')),
        centerTitle: true,
        actions: [
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.notifications),
          ),
        ],
        ),
        body: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: ListView(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                SizedBox(height: 24,),
                  TextField(
                    decoration: InputDecoration(
                    
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        // borderSide: BorderSide(
                        //   color: Color(0xFF6E6E6E),
                        // ),
                      ),
                      hintText: 'Search',
                     
                      suffixIcon: Icon(Icons.search),
                      
                    ),
                  
                    // keyboardType: TextInputType.number,
                   
                    
                  ),
                  


                  
                  SizedBox(height: 20,),

        
        Container(
          height: 40,
          child: ListView.builder(
           
           itemCount: filterData.length,
           shrinkWrap: true,
           physics: ScrollPhysics(),
           scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                        margin: EdgeInsets.only(right: 8),
                         decoration: BoxDecoration(
                         color: Color(0xFFEDEDED),
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Text('${filterData[index]}',
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           
                         ),),
                       ),
                       );
                       
            },
          ),
        ),

                  
SizedBox(height: 15,),

                  
              NoticeList( timeName: '6hrs ago',
              content: 'Regarding being promoted to the post of Deputy Inspector General of Police(2080-01-06)',
              numberofDocuments: '${numberofDocuments[0]}',
              ), 
          
              NoticeList(
          timeName: '2022-03-30',
              content: 'Notice regarding the publication of promotion recommendation list from the post of Senior...)',
              numberofDocuments: '${numberofDocuments[1]}',
          
              ), 
          //     NoticeList(
          // timeName: '2022-03-30',
          //     content: 'Notice regarding the publication of promotion recommendation list from the post of Senior...)',
          //     numberofDocuments: 2,
          //     ),
          //      NoticeList(
          // timeName: '2022-03-30',
          //     content: 'Notice regarding the publication of promotion recommendation list from the post of Senior...)',
          //     numberofDocuments: 2,
          //      ),    
          // NoticeList(
          // timeName: '2022-03-30',
          //     content: 'Notice regarding the publication of promotion recommendation list from the post of Senior...)',
          //     numberofDocuments: 2,
          //      ),    

               
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                itemBuilder: (context, index){
                  return  NoticeList(

                      timeName: timeago[index] ?? 'No time available',
                      content: content[index] ?? 'Nothing to show',
                      numberofDocuments: numberofDocuments[index] ?? 'Unavailable',
                     

                  );
                },
              ),
                ],
              ),
            ],
          ),


            
        ),
        );
   
  }
}

class NoticeList extends StatelessWidget {

final timeName;
final content;
final numberofDocuments;
NoticeList({

  this.timeName,
  this.content,
  this.numberofDocuments,
});


  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    
      Text('$timeName'),
      SizedBox(height: 5,),

      Text('$content',style: TextStyle(
        color: Color(0xFF292929),
        fontSize: 15,
        fontWeight: FontWeight.w600
      ),),
      SizedBox(height: 15,),


      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
              
              Icon(Icons.book),
                  SizedBox(width: 3,),
            
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text('$numberofDocuments'),
                  ),
               
            ]),
          ),
        ],
      ),

      
      SizedBox(height: 12,),
  Divider(
    thickness: 1,
    color: Colors.grey,
  ),
   
    ],
    );
  }
}