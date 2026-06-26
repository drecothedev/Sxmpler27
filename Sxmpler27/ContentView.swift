import SwiftUI
import Playgrounds

@main struct MyApp: App {
    @State var session = Session()
    
    var body: some Scene {
        WindowGroup {
            if #available(macOS 27.0, *) {
                switch session.uploadStatus {
                case .empty:
                    UploadView(session: session)
                case .selected:
                    SelectedView(session: session) 
                case .analyzing:
                    AnalyzingView(session: session)
                case .uploading:
                    UploadView(session: session)
                case .failed:
                    FailedView(session: session)
                case .completed:
                    CompletedView(session: session)
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

@available(macOS 27.0, *)
struct ContentView: View {
    let session = Session()
    var body: some View {
        Button("Click me to run results") {
            Task {
                do {
                    try await session.analyzeSession()
                } catch let error {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    if #available(macOS 27.0, *) {
        ContentView()
    } else {
        // Fallback on earlier versions
    }
}

#Playground {
    _ = 1 + 2
}
