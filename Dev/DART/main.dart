void main() {
  // print('hello world!');

  // ex 1
  // var ex1a = 'Je vous salues !';
  // String ex1b = 'Je vous salues !';
  // var ex1c;
  // ex1c = 'Je vous salues';

  // ex 2
  // var prenom = 'bob';
  // print('je vous salues ' + prenom);

  // ex 3
  // var prenom = 'bob';
  // print('Je vous salues ${prenom} !');

  // ex 4
  // var n1 = '50';
  // var n2 = 24;
  // print(int.parse(n1) + n2);

  // ex 5
  // var prenom = 'Jean';
  // var longueurSuffisante = prenom.length > 3;
  // print(longueurSuffisante);

  // ex 6-7-8
  // var age = -19;
  // if (age < 18 && age > 0)
  //   print('Vous êtes mineur');
  // else if (age >= 18)
  //   print('Vous êtes majeur');
  // else
  //   print('Age non conforme');

  // ex 9
  // var age = 19;
  // age < 18 ? print('Vous êtes mineur') : print('Vous êtes majeur');

  // ex 10
  // var codePostal = 5;
  // switch (codePostal) {
  //   case 75:
  //     print('Paris');
  //     break;
  //   case 93:
  //     print('Seine Saint Denis');
  //     break;
  //   default:
  //     print('J\'ai la flemme');
  //     break;
  // }

  // ex 11 -> 18
  // var myArr = ['Pomme', 'Abricot', 'Banane', 'Fraise', 42];
  // myArr[1] = 'Poire';
  // myArr.add('Framboise');
  // myArr.removeAt(myArr.length - 1);
  // print(myArr[myArr.length - 1]);
  // print(myArr[4]);
  // var j = 0;
  // while (j < myArr.length) {
  //   print(myArr[j]);
  //   j++;
  // }
  // ;
  // for (var i = 0; i < myArr.length; i++) print(myArr[i]);
  // myArr.forEach((element) {
  //   print(element);
  // });

  // ex 19
  // var myArr2 = [1, 2, 3, 4, 5];
  // myArr2.forEach((element) {
  //   print(element * 10);
  // });
  // var arrMap = myArr2.map((e) => e *= 10).toList();

  // print(arrMap);

  // ex 20
  // var myArr3 = new Map();
  // myArr3[0] = 0;
  // myArr3[1] = 1;
  // myArr3.forEach((key, value) {
  //   print(value);
  // });

  // ex 21
  var myArr = ['Pomme', 'Abricot', 'Banane', 'Fraise', 42];
  myArr = myArr.whereType<String>().toList();
  print(myArr);

  // ex 22-24
  // var mess = 'Hello world ';
  // var prenom = 'bob';
  // var salutations = (mess, prenom) => print(mess + prenom);
  // salutations(mess, prenom);

  // ex 25
}
