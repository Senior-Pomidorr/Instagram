//
//  EditButton.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11/30/23.
//

import SwiftUI

struct EditProfileButton: View {
    var body: some View {
        Button() {
            
        } label: {
            Text("Edit Profile")
                .fontWeight(.semibold)
                .tint(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 29)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(.gray.opacity(0.4), lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    EditProfileButton()
}
