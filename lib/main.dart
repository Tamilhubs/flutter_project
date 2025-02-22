import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( 
    debugShowCheckedModeBanner: false,
   home:Mainpage()
    ));
}

class Mainpage extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Column(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
            child: MaterialButton(
              color: Colors.white,
        shape: CircleBorder(),
        height: 160,
        minWidth: 150,
              onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(builder:(context)=>Gamepage()));
              },
            child: Text("START"),
            ),)
          ),
          Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height/2,
      width: double.infinity,
      child: Center(
      child: MaterialButton(
        color: Colors.white,
        shape: CircleBorder(),
        height: 160,
        minWidth: 150,
        onPressed:(){
          Navigator.push(context, 
                MaterialPageRoute(builder:(context)=>Gamepage()));
        },
      child:Text("START"),
      ),)
          )
        ],
      )
    );
  }
}

class Gamepage extends StatefulWidget{
  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  double BlueCardHeight=0;
 double RedCardHeight=0;
int Player1Score=0;
int Player2Score=0;

bool initialized=false;

@override
  Widget build(BuildContext context) {
      
      if (initialized == false){

    BlueCardHeight= MediaQuery.of(context).size.height/2;
    RedCardHeight=MediaQuery.of(context).size.height/2;
         initialized=true;

      }
   return Scaffold(
       body: Column(
        children: [
          MaterialButton(
            onPressed: () {
            
             setState(() {
                 BlueCardHeight=BlueCardHeight+30;
                 RedCardHeight=RedCardHeight-30;

                 Player2Score=Player2Score+10;
             });
             double screenHeight=MediaQuery.of(context).size.height;
             double WinHeight=MediaQuery.of(context).size.height-60;

             print(BlueCardHeight);
             print(WinHeight);

             if (BlueCardHeight>WinHeight){
              Navigator.push(context, MaterialPageRoute(builder:( context)=> ResultPage(Player2Score,"PLAYER 2 WON")));
             }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: BlueCardHeight,
              color: Colors.blue,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(9),
              child: Row(
                children: [
                  Expanded(child:
                  Text("Player 2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  ),
                  Text(Player2Score.toString(),
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ),
          ),
             MaterialButton(
              onPressed: () {
                setState(() {
                  RedCardHeight= RedCardHeight+30;
              BlueCardHeight=BlueCardHeight-30;

              Player1Score=Player1Score+10;
                });
               double screenHeight=MediaQuery.of(context).size.height;
               double WinHeight=MediaQuery.of(context).size.height-60;

             print(RedCardHeight);
             print(WinHeight);

             if (RedCardHeight>WinHeight){
              Navigator.push(context, MaterialPageRoute(builder:( context)=> ResultPage(Player1Score,"PLAYER 1 WON")));
             }
              },
              padding: EdgeInsets.zero,
               child: Container(
                           width: double.infinity,
                           height: RedCardHeight,
                           color: Colors.redAccent,
                           alignment: Alignment.bottomLeft,
                           padding: EdgeInsets.all(9),
                           child: Row(
                children: [
                  Expanded(child:
                  Text("Player 1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  ),
                  Text(Player1Score.toString(),
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
                           ),
                           ),
             )

        ],
       ),


   );
  }
}
 class ResultPage extends StatelessWidget{
   
   int score=0;
   String player="";
   ResultPage(this.score,this.player);
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player== "PLAYER 1 WON" ? Colors.redAccent : Colors.blue,
      body:Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(score.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
          Text(player, style: TextStyle(fontSize: 30)),
          MaterialButton(onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: Colors.white,
          child: Text("Restart Game"),
          )
        ],),
      ),
      );
  }

 }