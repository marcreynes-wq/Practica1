import 'package:flutter_application_4/user.dart';

import 'gps_location.dart';

abstract class Vehicle with GPSLocation {
    String id;
    int bateriaPercentatge;
    bool enUs;
    double preuPerMinut;

    Vehicle({
        required this.id,
        required this.bateriaPercentatge,
        this.enUs = false,
        required this.preuPerMinut,
    });

    String estatBateria() {
        return switch (bateriaPercentatge) {
            >= 80 => 'Alta',
            >= 20 => 'Mitjana',
            _ => 'Crítica (Requirexi càrrega)',
        };
    }

     double calcularCostReserva(int minuts, User user);
}