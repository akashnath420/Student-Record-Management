import 'dart:io';

void main() {
  
  String? option;
  int count = 0;
  

  List<Map<String, dynamic>> student = [];
  
  do {
    print("\n");
    print("---------------------------------------------------");
    print("(1) Add Student Record.");
    print("(2) Remove Student Record.");
    print("(3) Show All Student Record.");
    print("(4) Show Higest and Lowest Student.");
    print("(5) show Total Number of Student Record Exist.");
    print("(6) Exit.");
     print("---------------------------------------------------");

    stdout.write("Enter your option : ");
    option = stdin.readLineSync();

    print("\n\n");
    

    
    if(option == "1") {
      

      print("Student ${count+1} Record : ");

      stdout.write("Enter the ID : ");
      String? id = stdin.readLineSync();
      stdout.write("Enter the Student Name : ");
      String? name = stdin.readLineSync();
      stdout.write("Enter the Score : ");
      String? score = stdin.readLineSync();

      bool check = false;

      for(int i = 0; i < student.length; i++) {
        if(student[i]["Id"] == id) {
          check = true;
          break;
        }
      }

      if(check) print("ID already assined.");
      
      if(name != null && id != null && score != null && check == false) {
        student.add({
          'Name' : name,
          'Id' : id,
          'Score' : score,
        });
        count++;
        print("Successfully Added.");
      }
      else {
        print("Add Failed!");
      }
    }
    
    else if(option == "2") {
      print("Remove student record : ");
      stdout.write("Enter the Student ID : ");
      String? id = stdin.readLineSync();

      bool check = true;

      for(int i = 0; i < student.length; i++) {
        if(student[i]["Id"] == id) {
          print("${student[i]["Id"]} Student id was removed.");
          student.removeAt(i);
          check = false;
          count--;
        }
      }

      if(check) print("$id Student ID not Found.");
      
    }
    else if(option == "3") {
      print("Show all Student record List : ");

      for(int i = 0; i < student.length; i++) {

        double mark = double.parse(student[i]["Score"]);
        String grade = "";

        if(mark >= 80) grade = "A+";
        else if(mark >= 70) grade = "A";
        else if(mark >= 60) grade = "A-";
        else if(mark >= 50) grade = "B";
        else if(mark >= 40) grade = "C";
        else if(mark >= 33) grade = "F";
        else grade = "F";
        

        print("Student ${i + 1} :");
        print("Name : ${student[i]["Name"]}" );
        print("ID : ${student[i]["Id"]}" );
        print("Score : ${student[i]["Score"]}" );
        print("Grade : $grade \n" );
        
      }
    }
    else if(option == "4") {
      
      student.sort((a, b) => double.parse(b["Score"].toString()).compareTo(double.parse(a["Score"].toString())));
      int n = student.length - 1;

      print("Highest Score Student : ");
      print("Name : ${student[0]["Name"]}" );
      print("ID : ${student[0]["Id"]}" );
      print("Score : ${student[0]["Score"]}" );
  

      print("Lowest Score Student : ");
      print("Name : ${student[n]["Name"]}" );
      print("ID : ${student[n]["Id"]}" );
      print("Score : ${student[n]["Score"]}" );

    }
    else if(option == "5") print("Total Number of Student Record is ${count}");
    
    else if(option == "6") print("Exiting......");
    
    else {
      print("Invalid Option!");
      print("Please Try again........");
    }

  }while(option != "6");

}