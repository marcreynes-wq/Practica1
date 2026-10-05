import 'vehicle.dart';
import 'user.dart';

class Cotxe extends Vehicle {
    int places;
    bool requereixLlicencia;

    Cotxe({
        required String id,
        required int bateriaPercentatge,
        bool enUs = false,
        required double preuPerMinut,
        required this.places,
        required this.requereixLlicencia,
    }) : super(
          id: id,
          bateriaPercentatge: bateriaPercentatge,
          enUs: enUs,
          preuPerMinut: preuPerMinut,
        );

    @override
    double calcularCostReserva(int minuts, User usuari) {
        const double suplementFiltreEcologic = 2.0;

        return (minuts * preuPerMinut) + suplementFiltreEcologic;
    }



}