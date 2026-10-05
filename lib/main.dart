import 'user.dart';
import 'gps_location.dart';
import 'vehicle.dart';
import 'patinet.dart';
import 'cotxe.dart';

void main() {
    // 1. CREACIÓN DE USUARIOS

    User usuarioNormal = User.nou(
        id: 'U001',
        nom: 'Juan Pérez',
        correu: 'juan@email.com'
    );

    User usuarioVIP = User(
        id: 'U002',
        nomComplet: 'Maria García',
        saldo: 50.0,
        correu: 'maria@email.com',
        esVIP: true,
    );

    
    // 2. CREACIÓN DE LA FLOTA
    

    List<Vehicle> flota = [
        Patinet(
        id: 'P001',
        bateriaPercentatge: 85,
        preuPerMinut: 0.20,
        velocitatMaxima: 25,
        ),
        Patinet(
        id: 'P002',
        bateriaPercentatge: 45,
        preuPerMinut: 0.18,
        velocitatMaxima: 25,
        ),
        Patinet(
        id: 'P003',
        bateriaPercentatge: 15,
        preuPerMinut: 0.22,
        velocitatMaxima: 30,
        enUs: true,
        ),
        Cotxe(
        id: 'C001',
        bateriaPercentatge: 70,
        preuPerMinut: 0.35,
        places: 5,
        requereixLlicencia: true,
        ),
        Cotxe(
        id: 'C002',
        bateriaPercentatge: 95,
        preuPerMinut: 0.40,
        places: 5,
        requereixLlicencia: true,
        enUs: true,
        ),
    ];

    // 3. MOSTRAR LA FLOTA

    print('======== FLOTA ECORIDE ========');

    for (Vehicle vehicle in flota) {
        print(
            '${vehicle.id} | '
            'Bateria: ${vehicle.bateriaPercentatge}% | '
            'Estat: ${vehicle.estatBateria()} | '
            'En ús: ${vehicle.enUs}',
        );
    }


    // 4. VEHÍCULOS CON MÁS BATERÍA

     Vehicle vehicleMesBateria = flota.reduce(
        (actual, siguiente) =>
            actual.bateriaPercentatge > siguiente.bateriaPercentatge
                ? actual
                : siguiente,
    );

    print('\n========== VEHÍCULO CON MÁS BATERÍA ==========');
    print(
        'Vehicle: ${vehicleMesBateria.id} '
        '- ${vehicleMesBateria.bateriaPercentatge}%',
    );

    // 5. FILTRAR VEHÍCULOS DISPONIBLES

    List<Vehicle> vehiclesDisponibles = flota
        .where(
            (vehicle) =>
                vehicle.bateriaPercentatge > 20 && !vehicle.enUs,
        )
        .toList();
    
    print('\n======== VEHÍCULOS DISPONIBLES ========');

    for (Vehicle vehicle in vehiclesDisponibles) {
        print(
            '${vehicle.id} - '
            '${vehicle.bateriaPercentatge}% batería',
        );
    }

    // 6. RESERVA DE UN PATINETE

    Patinet patinet = flota.whereType<Patinet>().first;

    double cost = patinet.calcularCostReserva(
        15,
        usuarioVIP,
    );

    print('\n========== RESERVA ==========');
    print('Usuario: ${usuarioVIP.correu}');
    print('VIP: ${usuarioVIP.esVIP}');
    print('Patinete: ${patinet.id}');
    print('Duración: 15 minutos');
    print('Coste: ${cost.toStringAsFixed(2)} €');


    // 7. ACTUALITZAR POSICIÓN GPS

    patinet.actualitzarUbicacio(
        39.7195,
        2.9106,
    );

    // 8. DESTRUCTURACIÓN DEL RECORD

    var (lat, lng) = patinet.obtenirCoordenades();

    print('\n========== POSICIÓN GPS ==========');
    print('Latitud: $lat');
    print('Longitud: $lng');

    // 9. MANEJO DE ERRORES

    print('\n========== MANEJO DE ERRORES ==========');

    try {
        usuarioNormal.recarregarSaldo(-10.0);

        print('Saldo recargado correctamente.');
    } catch (e) {
        print('Error al recargar saldo: $e');
    }

    print('\n========== FIN DEL PROGRAMA ==========');
        





}