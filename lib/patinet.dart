import 'vehicle.dart';
import 'user.dart';

class Patinet extends Vehicle {
    int velocitatMaxima;

    Patinet ({
        required String id,
        required int bateriaPercentatge,
        bool enUs = false,
        required double preuPerMinut,
        required this.velocitatMaxima,
    })  : super(
            id: id,
            bateriaPercentatge: bateriaPercentatge,
            enUs: enUs,
            preuPerMinut: preuPerMinut,
            );
    @override
    double calcularCostReserva(int minuts, User usuari) {
        double cost = minuts * preuPerMinut;

        if (usuari.esVIP) {
            cost = cost * 0.90;
        }

        return cost;
    }
}