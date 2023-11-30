//
//  ProfileNew.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 11/30/23.
//

import SwiftUI

struct ProfileNew: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
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
                            Text("Yezzy is here, welcome!")
                                .padding(.leading, 10)
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 10)
                .padding(.top, 12)
                
                EditButton()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(photoCels, id: \.image) { post in
                            Image(post.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                        }
                    }
                }
            }
        }
        .navigationTitle("Kanye_w")
        
    }
}

#Preview {
    ProfileNew()
}
