import SwiftUI

struct MascotaEsado: View {
    @Environment(ControladorGeneral.self) var mascota

    // Propiedad calculada para resolver el nombre de la imagen según el estado
    private var nombreImagen: String {
        switch mascota.estado {
        case .Neutro:
            return "EstadoBNeutral"
        case .Hambriento:
            return "EstadoBHambriento"
        case .Inanicion:
            return "EstadoBAburrido"
        case .Muerto:
            return "EstadoBAsquiado"
        case .Adormilado:
            return "EstadoBSueno"
        case .Comiendo:
            return "EstadoBHambriento"
        case .Enojado:
            return "EstadoBEnojado"
        case .Feliz:
            return "EstadoBFeliz"
        default:
            return "EstadoBNeutral"
        }
    }

    var body: some View {
        Image(nombreImagen)
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 160)
            .padding()
            .animation(.easeInOut(duration: 0.2), value: mascota.estado)
    }
}

#Preview {
    MascotaEsado()
        .environment(ControladorGeneral())
}
