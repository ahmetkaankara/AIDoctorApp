import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            Text("IHealth Mate")
                .font(.title)
                .fontWeight(.heavy)
                .kerning(2)
                .foregroundColor(.red)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.messages, id: \.id) { message in
                    ChatCellView(message: message)
                }
                if viewModel.waitingForResponse {
                    TypingIndicatorView()
                }
            }
            HStack {
                ZStack(alignment: .leading) {
                                   TextField("Type a Message...", text: $viewModel.userText)
                                       .foregroundColor(.black) // Metnin rengi siyah olacak
                                       .padding(.horizontal, 15)
                                       .padding(.vertical, 7)
                                       .background(
                                           RoundedRectangle(cornerRadius: 20)
                                               .fill(Color.white) // İçini beyaz yapma
                                               .overlay(
                                                   RoundedRectangle(cornerRadius: 20)
                                                       .stroke(Color.gray, lineWidth: 2) // Gri çizgi ekleme
                                               )
                                       )
                               }
                Button {
                    viewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                }
            }
            .padding(.horizontal)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("doctor-image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ChatView()
}
