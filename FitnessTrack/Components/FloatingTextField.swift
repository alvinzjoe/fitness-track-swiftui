//
//  FloatingTextField.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 08/02/24.
//

import SwiftUI

struct FloatingTextField: View {
    @Binding var fieldValue: String
    @State var fieldLabel: String
    @State var isSecurityField: Bool = false
    @FocusState var focused: Bool
    var body: some View {
        let isActive = focused || fieldValue.count > 0
        ZStack(alignment: .leading) {
            Text("\(fieldLabel)")
                .foregroundColor(!isActive ? Color(.placeholderText) : .accentColor)
                .offset(y: !isActive ? -4: -25)
                .scaleEffect(!isActive ? 1 : 0.8, anchor: .leading)
            VStack {
                if(!isSecurityField) {
                    TextField("\(fieldLabel)", text: $fieldValue)
                        .textInputAutocapitalization(.never)
                } else {
                    SecureField("\(fieldLabel)", text: $fieldValue)
                        .textInputAutocapitalization(.never)
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray400)
            }
        }
        .animation(.easeOut, value: isActive)
        .padding(.top, 15)
    }
}


#Preview {
    FloatingTextField(fieldValue: .constant(""), fieldLabel: "Label")
}
