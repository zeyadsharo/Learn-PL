import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/utils/database_helper.dart';

class SaveData {
  int conceptid = 0;
  int basicconceptsid = 0;
  SaveData() {
    savelang();
    saveconceptjava();
    // saveconcepts();
    // saveobjects();
    print("database saved");
  }
  var db = new DatabaseHelper();
  Future<void> savelang() async {
    var language = ["Python", "Java", "C#", "C++"];
    var des = [
      "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learn it.. \nJust test yourself !!",
      "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
      "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
      "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
      "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
    ];
    for (var i = 0; i < language.length; i++) {
      await db.saveLang(new Lang(i, language[i].toString(), des[i].toString()));
    }
    print("lang saved");
  }

  Future<void> saveconceptjava() async {
    var javaconcepts = [
      "Basic concepts",
      "conditional and loops",
      "Array",
      "Classes and Object"
    ];

    var basicconcepts = [
      "Introduction to Java",
      "A Hello World Program",
      "Java comments",
      "Variables",
      "Strings",
      "Getting User Input",
      "Dncrement and Decrement",
    ];
    var basicconceptsdes = [
      """Java is a high level, modern programming language designed in the early 1990s by Sun Microsystems, \nand currently owned by Oracle.Java is Platform Independent,\n which means that you only need to write the program once to be able to run it on a number of different platforms!
        Java is portable, robust, and dynamic,\n with the ability to fit the needs of virtually any type of application""",
      """Your First Java Program Let's start by creating a simple program that prints \"Hello World\" to the screen
          \nclass MyClass {
          \npublic static void main(String[ ] args) {
          \nSystem.out.println(\"Hello World\");\n}""",
      """// this is a single-line comment\n
              x = 5; // a single-line comment after code\n
              /*  This is also acomment spanning multiple lines */""",
      """Variables are containers for storing data values.
                \nIn Java, there are different types of variables, for example:
                \nString - stores text, such as "Hello". String values are surrounded by double quotes
                \nint - stores integers (whole numbers), without decimals, such as 123 or -123
                \nfloat - stores floating point numbers, with decimals, such as 19.99 or -19.99
                \nchar - stores single characters, such as 'a' or 'B'. Char values are surrounded by single quotes
                \nboolean - stores values with two states: true or false \n
                \n int myNum = 5;
                \n float myFloatNum = 5.99f;
                \n char myLetter = 'D';
                \n boolean myBool = true;
                \n String myText = "Hello";""",
      """
               \nStrings are used for storing text.
               \n A String variable contains a collection of characters surrounded by double quotes:
               \n  String txt = \"Hello World\";
               \n System.out.println(txt.toUpperCase());   // Outputs \"HELLO WORLD\"
               \n System.out.println(txt.toLowerCase());   // Outputs \"hello world\"
                """,
      """Java User Input
          The Scanner class is used to get user input, and it is found in the java.util package.\n
          To use the Scanner class, create an object of the class and use any of the available methods found in the Scanner class documentation.
         \n In our example, we will use the nextLine() method, which is used to read Strings:
        \n import java.util.Scanner;  // Import the Scanner class
     \n class MyClass {
   \n public static void main(String[] args) {
   \n Scanner myObj = new Scanner(System.in);  // Create a Scanner object
   \n System.out.println("Enter username");
   \n String userName = myObj.nextLine();  // Read user input
   \n  System.out.println("Username is: " + userName);  // Output user input
  }
}
""",
      """\n It is one of the variation of “Arithmetic Operator“.
   \n Increment and Decrement Operators are Unary Operators.
   \n Unary Operator Operates on One Operand.
   \n Increment Operator is Used to Increment Value Stored inside Variable on which it is operating.
   \n Decrement Operator is used to decrement value of Variable by 1 (default).     
   \n ++ Increment operator : increments a value by 1
   \n -- Decrement operator : decrements a value by 1""",
    ];

    var conditionandloop = [
      "Java Conditions and If Statements",
      "Nested if Statements",
      "else if Statements",
      "Logical Operators",
      "The switch Statement",
      "while Loops",
      "for Loops"
    ];
    var conditionandloopvalue = [
      """Java supports the usual logical conditions from mathematics:
    \nLess than: a < b
    \nLess than or equal to: a <= b
    \nGreater than: a > b
    \nGreater than or equal to: a >= b
    \nEqual to a == b
    \nNot Equal to: a != b
    \n Java has the following conditional statements:
    \nUse if to specify a block of code to be executed, if a specified condition is true
    \nUse else to specify a block of code to be executed, if the same condition is false
    \nUse else if to specify a new condition to test, if the first condition is false
    \nUse switch to specify many alternative blocks of code to be executed
    \nThe if Statement
    \nUse the if statement to specify a block of Java code to be executed if a condition is true.
    \nSyntax
    \nif (condition) {
    \n// block of code to be executed if the condition is true
    \n}
    \nExample
    \n  if (20 > 18) {
    \n   System.out.println("20 is greater than 18");
    \n }""",
      """
      \n It is always legal to nest if-else statements which means you can 
      \nuse one if or else if statement inside another if or else if statement.
      \n Syntax
      \n The syntax for a nested if...else is as follows −
      \n 
      \n if(Boolean_expression 1) {
      \n    // Executes when the Boolean expression 1 is true
      \n    if(Boolean_expression 2) {
      \n       // Executes when the Boolean expression 2 is true
      \n    }
      \n }
    """,
      """ \nThe else Statement
    \nUse the else statement to specify a block of code to be executed if the condition is false.
      \n Syntax
      \n if (condition) {
      \n   // block of code to be executed if the condition is true
      \n } else {
      \n   // block of code to be executed if the condition is false
      \n }
    """,
      """\nJava Operators
        \nOperators are used to perform operations on variables and values.
        \nIn the example below, we use the + operator to add together two values:
        \n  +	Addition	Adds together two values	x + y	
        \n  -	Subtraction	Subtracts one value from another	x - y	
        \n  *	Multiplication	Multiplies two values	x * y	
        \n  /	Division	Divides one value by another	x / y	
        \n  %	Modulus	Returns the division remainder	x % y	
        \n  ++	Increment	Increases the value of a variable by 1	++x	
        \n  --	Decrement	Decreases the value of a variable by 1	--x
       """,
      """\nJava Switch Statements
          \n Use the switch statement to select one of many code blocks to be executed.\
          \n Syntax
          \n switch(expression) {
          \n   case x:
          \n     // code block
          \n     break;
          \n   case y:
          \n     // code block
          \n     break;
          \n   default:
          \n     // code block
          \n }
          """,
      """\nJava While Loop
                  \nThe while loop loops through a block of code as long as a specified condition is true:
                  \nSyntax
                  \nwhile (condition) {
                  \n  // code block to be executed
                  \n}
                  \nThe example below uses a do/while loop. The loop will always be executed at least once,
                  \n even if the condition is false, because the code block is executed before the condition is tested:
                  \n Example
                  \n int i = 0;
                  \n do {
                  \n   System.out.println(i);
                  \n   i++;
                  \n }
                  \n while (i < 5);
                  """,
      """\nJava For Loop
                \n When you know exactly how many times you want to loop through a block of code, use the for loop instead of a while loop:
                \n 
                \n Syntax
                \n for (statement 1; statement 2; statement 3) {
                \n   // code block to be executed
                \n  }
                \n Statement 1 is executed (one time) before the execution of the code block.
                \n Statement 2 defines the condition for executing the code block.
                \n Statement 3 is executed (every time) after the code block has been executed.
                \n 
                \n The example below will print the numbers 0 to 4:
                \n 
                \n Example
                \n for (int i = 0; i < 5; i++) {
                \n   System.out.println(i);
                \n }    
                  """
    ];

    var array = ["Elements in Array", "Enhanced for Loop"];
    var arrayvalue = [
      """
    \n Java Arrays
    \n Arrays are used to store multiple values in a single variable, instead of declaring separate variables for each value.
    \n
    \n To declare an array, define the variable type with square brackets:
    \nWe have now declared a variable that holds an array of strings. To insert values to it, 
    \nwe can use an array literal - place the values in a comma-separated list, inside curly braces:
    \nString[] cars = {"Volvo", "BMW", "Ford", "Mazda"};
    \n 
    \n     Access the Elements of an Array
    \n You access an array element by referring to the index number.
    \n 
    \n This statement accesses the value of the first element in cars:
    \n 
    \n Example
    \n String[] cars = {"Volvo", "BMW", "Ford", "Mazda"};
    \n System.out.println(cars[0]);
    \n // Outputs Volvo
    """,
      """Difference between for loop and for-each loop
      \n To know why the for-each loop is preferred over for loop while working with arrays, let's see the following example.
      \n 
      \n Here the example shows how we can iterate through elements of an array using the standard for loop.
      \n 
      \n class ForLoop {
      \n     public static void main(String[] args) {
      \n       
      \n         char[] vowels = {'a', 'e', 'i', 'o', 'u'};
      \n 
      \n         for (int i = 0; i < vowels.length; ++ i) {
      \n             System.out.println(vowels[i]);
      \n         }
      \n     }
      \n }
      \n Output:
      \n 
      \n a
      \n e
      \n i
      \n o
      \n u
      \n Now we will perform the same task using the for-each loop.
      \n 
      \n class AssignmentOperator {
      \n    public static void main(String[] args) {
      \n       
      \n       char[] vowels = {'a', 'e', 'i', 'o', 'u'};
      \n       // foreach loop
      \n       for (char item: vowels) {
      \n          System.out.println(item);
      \n       }
      \n    }
      \n }
      \n Output:
      \n 
      \n a
      \n e
      \n i
      \n o
      \n u
      \n Here, we can see that the output of both the program is the same.
      \n 
      \n When we carefully analyze both the program, we can notice that the for-each loop is easier to write and makes our code more readable. This is the reason it is called enhanced for loop.
      \n 
      \n Hence, it is recommended to use the enhanced for loop over the standard for loop whenever possible.
      \n 
      \n Java for-each loop
      \n Let's first look at the syntax of for each loop:
      \n 
      \n for(data_type item : collections) {
      \n     ...
      \n }
      \n Here,
      \n 
      \n collection - a collection or array that you have to loop through.
      \n item - a single item from the collections.
    """
    ];

    var classesandObject = [
      "Object-Oriented Programming",
      "Creating Classes & Objects",
      "Methods",
      "Defining Attributes",
      "Access Modifiers",
      "Getters and Setters",
      "Constructors",
    ];
    var classesandObjectvalue = [
      """\n Java - What is OOP?
   \n OOP stands for Object-Oriented Programming.
   \n Procedural programming is about writing procedures or methods that perform operations on the data,
   \n while object-oriented programming is about creating objects that contain both data and methods.
   \n Object-oriented programming has several advantages over procedural programming:
   \n OOP is faster and easier to execute
   \n OOP provides a clear structure for the programs
   \n OOP helps to keep the Java code DRY "Don't Repeat Yourself", and makes the code easier to maintain, modify and debug
   \n OOP makes it possible to create full reusable applications with less code and shorter development time.
""",
      """
    \nJava Classes/Objects
    \nJava is an object-oriented programming language.
    \n
    \nEverything in Java is associated with classes and objects, along with its attributes and methods. 
    \nFor example: in real life, a car is an object. The car has attributes, such as weight and color,
    \n and methods, such as drive and brake.
    \nA Class is like an object constructor, or a "blueprint" for creating objects.
    \nCreate a Class
    \nTo create a class, use the keyword class:
    \nMyClass.java
    \nCreate a class named "MyClass" with a variable x:
    \npublic class MyClass {
    \n  int x = 5;
    \n}
    \n Create an Object
    \n In Java, an object is created from a class. We have already created the class named MyClass, so now we can use this to create objects.
    \n 
    \n To create an object of MyClass, specify the class name, followed by the object name, and use the keyword new:
    \n 
    \n Example
    \n Create an object called "myObj" and print the value of x:
    \n 
    \n public class MyClass {
    \n   int x = 5;
    \n 
    \n   public static void main(String[] args) {
    \n     MyClass myObj = new MyClass();
    \n     System.out.println(myObj.x);
    \n   }
    \n }
""",
      """
      \n Java Class Methods
      \n You learned from the Java Methods chapter that methods are declared within a class, and that they are used to perform certain actions:
      \n 
      \n Example
      \n Create a method named myMethod() in MyClass:
      \n 
      \n public class MyClass {
      \n   static void myMethod() {
      \n     System.out.println("Hello World!");
      \n   }
      \n }
      \n 
      \n myMethod() prints a text (the action), when it is called. To call a method, write the method's name followed by two parentheses () and a semicolon;
      \n 
      \n Example
      \n Inside main, call myMethod():
      \n 
      \n public class MyClass {
      \n   static void myMethod() {
      \n     System.out.println("Hello World!");
      \n   }
      \n 
      \n   public static void main(String[] args) {
      \n     myMethod();
      \n   }
      \n }
      \n 
      \n // Outputs "Hello World!"
      \n 
      \n 
      \n """,
      """
      Java Class Attributes
      \n Java Class Attributes
      \n In the previous chapter, we used the term "variable" for x in the example (as shown below). It is actually an attribute of the class. Or you could say that class attributes are variables within a class:
      \n Example
      \n Create a class called "MyClass" with two attributes: x and y:
      \n public class MyClass {
      \n   int x = 5;
      \n   int y = 3;
      \n }
      \n Another term for class attributes is fields.
      \n Accessing Attributes
      \n You can access attributes by creating an object of the class, and by using the dot syntax (.):
      \n The following example will create an object of the MyClass class, with the name myObj. We use the x attribute on the object to print its value:
      \n Example
      \n Create an object called "myObj" and print the value of x:
      \n public class MyClass {
      \n   int x = 5;
      \n   public static void main(String[] args) {
      \n     MyClass myObj = new MyClass();
      \n     System.out.println(myObj.x);
      \n   }
      \n }
      """,
      """
       Modifiers
      \n By now, you are quite familiar with the public keyword that appears in almost all of our examples:
      \n 
      \n public class MyClass
      \n The public keyword is an access modifier, meaning that it is used to set the access level for classes, attributes, methods and constructors.
      \n 
      \n We divide modifiers into two groups:
      \n 
      \n Access Modifiers - controls the access level
      \n Non-Access Modifiers - do not control access level, but provides other functionality
      \nFor attributes, methods and constructors, you can use the one of the following:
      \n
      \nModifier	Description	Try it
      \npublic	The code is accessible for all classes	
      \nprivate	The code is only accessible within the declared class	
      \ndefault	The code is only accessible in the same package. This is used when you don't specify a modifier. You will learn more about packages in the Packages chapter	
      \nprotected	The code is accessible in the same package and subclasses. You will learn more about subclasses and superclasses in the Inheritance chapter
      """,
      """
      Encapsulation
      \n The meaning of Encapsulation, is to make sure that "sensitive" data is hidden from users. To achieve this, you must:
      \n 
      \n declare class variables/attributes as private
      \n provide public get and set methods to access and update the value of a private variable
      \n Get and Set
      \n You learned from the previous chapter that private variables can only be accessed within the same class (an outside class has no access to it). However, it is possible to access them if we provide public get and set methods.
      \n 
      \n The get method returns the variable value, and the set method sets the value.
      \n 
      \n Syntax for both is that they start with either get or set, followed by the name of the variable, with the first letter in upper case:
      \n 
      \n Example
      \n public class Person {
      \n   private String name; // private = restricted access
      \n 
      \n   // Getter
      \n   public String getName() {
      \n     return name;
      \n   }
      \n 
      \n   // Setter
      \n   public void setName(String newName) {
      \n     this.name = newName;
      \n   }
      \n }""",
      """Java Constructors
  \nA constructor in Java is a special method that is used to initialize objects. The constructor is called when an object of a class is created. It can be used to set initial values for object attributes:

\nExample
\nCreate a constructor:
\n
\n// Create a MyClass class
\npublic class MyClass {
\n  int x;  // Create a class attribute
\n
\n  // Create a class constructor for the MyClass class
\n  public MyClass() {
\n    x = 5;  // Set the initial value for the class attribute x
\n  }
\n
\n  public static void main(String[] args) {
\n    MyClass myObj = new MyClass(); // Create an object of class MyClass (This will call the constructor)
\n    System.out.println(myObj.x); // Print the value of x
\n  }
\n}
\n
\n// Outputs 5
      
      
      """


    ];

    for (var i = conceptid; i < javaconcepts.length; i++) {
      await db.savecourseconcepts(
          new CourseConcepts(conceptid++, javaconcepts[i].toString(), 1));
    }
    for (var i = 0; i < basicconcepts.length; i++) {
      await db.saveobjects(new Objects(basicconcepts[i].toString(),
          "description for " + basicconceptsdes[i].toString(), 0));
    }

    for (var i = 0; i < conditionandloop.length; i++) {
      await db.saveobjects(new Objects(conditionandloop[i].toString(),
          "description for " + conditionandloopvalue[i].toString(), 1));
    }
    for (var i = 0; i < array.length; i++) {
      await db.saveobjects(new Objects(array[i].toString(),
          "description for " + arrayvalue[i].toString(), 2));
    }
    for (var i = 0; i < classesandObject.length; i++) {
      await db.saveobjects(new Objects(classesandObject[i].toString(),
          "description for " + classesandObjectvalue[i].toString(), 3));
    }
  }
}
