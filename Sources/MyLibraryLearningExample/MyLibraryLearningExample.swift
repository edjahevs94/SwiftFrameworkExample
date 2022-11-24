import SwiftUI

public struct MyLibraryLearningExample {
    
    public struct SynologyImage: View {
        
        @ObservedObject var vm: ViewModel
        
  
        @State var did: String
        @State var sid: String
        @State var path: String
        
        public init(did: String, sid: String, path: String, vm: ViewModel) {
            self._did = State(initialValue: did)
            self._sid = State(initialValue: sid)
            self._path = State(initialValue: path)
            self._vm = ObservedObject(wrappedValue: ViewModel(photoPath: path, did: did, sid: sid))
        }
        
        public var body: some View {
            HStack{
                Image(uiImage: UIImage(data: vm.imageData)!)
            }.padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 2))
        }
    }

    public struct MainTextField: View {

        @ObservedObject var vm: ViewModel
        
        @State var placeholder: String
        @State var did: String
        @State var sid: String
        @State var path: String
        @Binding var text: String
        
        public init(placeholder: String, did: String, sid: String, path: String, text: Binding<String>, vm: ViewModel) {
            self._placeholder = State(initialValue: placeholder)
            self._did = State(initialValue: did)
            self._sid = State(initialValue: sid)
            self._path = State(initialValue: path)
            self._vm = ObservedObject(wrappedValue: ViewModel(photoPath: path, did: did, sid: sid))
            self._text = text
        }
        
        public var body: some View {
            HStack{
                Image(uiImage: UIImage(data: vm.imageData)!)
            }
            HStack {
                Image(systemName: "person").foregroundColor(.blue)
                TextField(placeholder, text: $text)
                    .font(.system(size: 20 ,weight: .bold, design: .default))
                    .foregroundColor(.blue)
            }.padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 2))
        }
    }

}
