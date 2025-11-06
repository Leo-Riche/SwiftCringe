import SwiftUI
import DesignSystem

struct ProfileView: View {
    @ObservedObject var session: SessionManager
    @StateObject private var viewModel: ProfileViewModel

    @FocusState private var focusedField: String? // Pour gérer le focus visuel

    init(session: SessionManager) {
        self.session = session
        _viewModel = StateObject(wrappedValue: ProfileViewModel(session: session))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Mon profil")
                    .font(.largeTitle)
                    .bold()

                // Photo de profil
                if let imageURL = URL(string: viewModel.photoURL), !viewModel.photoURL.isEmpty {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue.opacity(0.5), lineWidth: 3))
                            .shadow(radius: 5)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 120, height: 120)
                        .shadow(radius: 5)
                }

                VStack(alignment: .leading, spacing: 20) {
                    // Nom
                    CustomTextField(
                        placeholder: "Nom",
                        text: $viewModel.name,
                        highlightColor: .blue,
                        width: 300,
                        isFocused: focusedField == "name"
                    )
                    .focused($focusedField, equals: "name")

                    // Âge
                    CustomTextField(
                        placeholder: "Âge",
                        text: $viewModel.age,
                        highlightColor: .blue,
                        width: 300,
                        isFocused: focusedField == "age"
                    )
                    .focused($focusedField, equals: "age")

                    // Photo
                    CustomTextField(
                        placeholder: "Lien photo",
                        text: $viewModel.photoURL,
                        highlightColor: .blue,
                        width: 300,
                        isFocused: focusedField == "photo"
                    )
                    .focused($focusedField, equals: "photo")

                    // Mot de passe
                    CustomSecureField(
                        placeholder: "Mot de passe",
                        text: $viewModel.password,
                        highlightColor: .blue,
                        width: 300
                    )

                    // Description
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Description")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextEditor(text: $viewModel.description)
                            .frame(height: 100)
                            .padding(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                    }
                    .frame(width: 300)
                }

                Button("Enregistrer les modifications") {
                    viewModel.saveChanges()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)

                if viewModel.showSaveConfirmation {
                    Text("✅ Modifications enregistrées !")
                        .foregroundColor(.green)
                }

                Spacer()
            }
            .padding()
        }
        .scrollDismissesKeyboard(.interactively)
    }
}
