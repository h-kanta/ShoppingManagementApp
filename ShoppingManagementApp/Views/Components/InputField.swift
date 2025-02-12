//
//  InputField.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/02/03.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    var placeholder: String
    var isNumberPadField: Bool = false
    
    var body: some View {
        VStack {
            if isNumberPadField {
                TextField(placeholder, text: $text)
                    .defaultTextFieldStyle(isNumberPad: isNumberPadField)
            } else {
                TextField(placeholder, text: $text)
                    .defaultTextFieldStyle(isNumberPad: isNumberPadField)
            }
        }
    }
}

#Preview {
    InputField(text: .constant(""), placeholder: "入力してください")
        .fullScreenBackground(.back)
}
