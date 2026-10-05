class User {
    //Atributos privados
    final String _id;
    final String _nomComplet;
    double _saldo;

    //Atributos públicos
    String correu;
    bool esVIP;

    //Constructor nombrado
    User.nou({
        required this._id,
        required String nom,
        required this.correu,
    })  : _nomComplet = nom,
        _saldo = 0.0,
        esVIP = false;
    
    //Constructor completo
    User({
        required this._id,
        required String nomComplet,
        required this._saldo,
        required this.correu,
        this.esVIP = false,
    })  : _nomComplet = nomComplet;

    //Getter de id
    String get id => _id;

    //Getter de saldo
    double get saldo => _saldo;

    //Recargar saldo
    void recarregarSaldo(double quantitat) {
        if (quantitat <= 0) {
            throw ArgumentError('La quantitat ha de ser superior a 0');
        }

        _saldo += quantitat;
    }
        

}