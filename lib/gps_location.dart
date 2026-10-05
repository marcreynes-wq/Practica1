mixin GPSLocation {
    double latitud = 0.0;
    double longitud = 0.0;

    void actualitzarUbicacio(double lat, double lng) {
        latitud = lat;
        longitud = lng;
    }

    (double lat, double lng) obtenirCoordenades() {
        return (latitud, longitud);
    }
}
/* Destructuracion del record
var (lat, lng) = patient.obtenirCoordenades();
print('Latitud: $lat');
print('Longitud: $lng');
*/