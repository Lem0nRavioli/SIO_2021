void main() {
  print('helo');
}

class Personne {
  String prenom, nom;
  final String _rib, _sexe;
  final int _age;
  List<Voiture> voitures;
  List<Moto>? motos;

  Personne(this.prenom, this.nom, this._rib, this._sexe, this._age,
      this.voitures, this.motos);

  get Age => _age;
  get Sexe => _sexe;
}

class Homme extends Personne {
  Homme(String prenom, String nom, String _rib, String _sexe, int _age,
      List<Voiture> voitures, List<Moto> motos)
      : super(prenom, nom, _rib, 'M', _age, voitures, motos);
}

class Femme extends Personne {
  Femme(String prenom, String nom, String _rib, String _sexe, int _age,
      List<Voiture> voitures, List<Moto> motos)
      : super(prenom, nom, _rib, 'F', _age, voitures, motos);
}

class Voiture {
  String marque, modele;

  Voiture(this.marque, this.modele);

  bool roule() {
    return true;
  }
}

class Moto {
  String marque, modele;

  Moto(this.marque, this.modele);

  bool roule() {
    return true;
  }
}
