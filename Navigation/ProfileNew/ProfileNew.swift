//
//  ProfileNew.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11/30/23.
//

import SwiftUI

struct ProfileNew: View {
    var body: some View {
        VStack {
            HStack {
                Image("16")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 86, height: 86)
                    .clipShape(Circle())
                VStack {
                    Text("54")
                        .bold()
                    Text("Posts")
                        .padding(.horizontal, 14)
                }
                
                VStack {
                    Text("834")
                        .bold()
                    Text("Followers")
                }
                .padding(.horizontal, 10)
                VStack {
                    Text("162")
                        .bold()
                    Text("Following")
                }
                .padding(.horizontal, 10)
                
            }
            
            VStack(alignment:.leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Kanye West")
                            .bold()
                            .padding(.leading, 10)
                        Text("I am Top G, welcome to my club!")
                            .padding(.leading, 10)
                    }
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.top, 12)
            
            Button() {
                
            } label: {
                Text("Edit Profile")
                    .tint(.black)
                    .frame(maxWidth: .infinity, maxHeight: 29)
            }
//            .border(.gray, width: 1)
//            .clipShape(.capsule)
//            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ProfileNew()
}
