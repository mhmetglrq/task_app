//
//  CheckBox.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isOn: Bool
    var borderColor: Color = .blue
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.15)) {
                isOn.toggle()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(isOn ? borderColor : Color.gray.opacity(0.6), lineWidth: 2)
                    .frame(width: 24, height: 24)
                
                if isOn {
                    Image(systemName: "checkmark")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(borderColor)
                }
            }
        }
        .buttonStyle(.plain) // mavi highlight vs. olmasın
    }
}

