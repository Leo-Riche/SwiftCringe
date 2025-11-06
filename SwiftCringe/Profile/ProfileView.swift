import SwiftUI


struct ProfileView: View {
    var session: SessionManager
    @State private var viewModel: ProfileViewModel

    init(session: SessionManager) {
        self.session = session
        _viewModel = State(wrappedValue: ProfileViewModel(session: session))
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Mon profil")
                .font(.largeTitle)
                .bold()

            if let imageURL = URL(string: viewModel.photoURL), !viewModel.photoURL.isEmpty {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 120, height: 120)
            }

            VStack(alignment: .leading, spacing: 12) {
                TextField("Nom", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)

                TextField("Âge", text: $viewModel.age)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)

                TextField("Lien photo", text: $viewModel.photoURL)
                    .textFieldStyle(.roundedBorder)

                SecureField("Mot de passe", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)

                TextEditor(text: $viewModel.description)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3))
                    )
            }
            .padding()

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
}
