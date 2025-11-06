import SwiftUI
import DesignSystem

struct ProfileView: View {
    var session: SessionManager
    @State private var viewModel: ProfileViewModel
    @FocusState private var focusedField: String?

    init(session: SessionManager) {
        self.session = session
        _viewModel = State(wrappedValue: ProfileViewModel(session: session))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    if let imageURL = URL(string: viewModel.photoURL), !viewModel.photoURL.isEmpty {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue.opacity(0.4), lineWidth: 4))
                                .shadow(radius: 8)
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .foregroundColor(.gray.opacity(0.6))
                            .shadow(radius: 8)
                    }

                    Text(viewModel.name.isEmpty ? "Utilisateur" : viewModel.name)
                        .font(.title2.bold())
                        .foregroundColor(.primary)

                    Text(session.currentUser?.email ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Informations personnelles")
                        .font(.headline)
                        .padding(.bottom, 5)

                    CustomTextField(
                        placeholder: "Nom",
                        text: $viewModel.name,
                        highlightColor: .blue,
                        width: 320,
                        isFocused: focusedField == "name"
                    )
                    .focused($focusedField, equals: "name")

                    CustomTextField(
                        placeholder: "Âge",
                        text: $viewModel.age,
                        highlightColor: .blue,
                        width: 320,
                        isFocused: focusedField == "age"
                    )
                    .focused($focusedField, equals: "age")

                    CustomTextField(
                        placeholder: "Lien photo",
                        text: $viewModel.photoURL,
                        highlightColor: .blue,
                        width: 320,
                        isFocused: focusedField == "photo"
                    )
                    .focused($focusedField, equals: "photo")

                    CustomSecureField(
                        placeholder: "Mot de passe",
                        text: $viewModel.password,
                        highlightColor: .blue,
                        width: 320
                    )

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Description")
                            .font(.caption)
                            .foregroundColor(.gray)

                        TextEditor(text: $viewModel.description)
                            .frame(height: 100)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.25))
                            )
                    }
                    .frame(width: 320)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                .padding(.horizontal)

                AnimatedLabelButton(
                    title: "Enregistrer les modifications",
                    systemImage: "checkmark.circle.fill",
                    color: .second
                ) {
                    viewModel.saveChanges()
                }

                if viewModel.showSaveConfirmation {
                    HStack(spacing: 6) {
                        Image(systemName: "checkmark.seal.fill")
                        Text("Modifications enregistrées avec succès !")
                    }
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .transition(.opacity)
                }

                Spacer()
            }
            .padding(.bottom, 50)
        }
        .background(Color(.systemGroupedBackground))
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("Mon profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}

