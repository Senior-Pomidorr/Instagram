//
//  ProfileListButtons.swift
//  Navigation
//
//  Created by Daniil Kulikovskiy on 12/2/23.
//

import SwiftUI

struct ProfileListButtons: View {
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    private let columnsOne: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    @State private var isEnabledButtonOne = true
    
    var body: some View {
            HStack(alignment: .center) {
                Button {
                    isEnabledButtonOne = true
                    print("isEnabledButtonOne \(isEnabledButtonOne)")
                } label: {
                    VStack(spacing: 13) {
                        Spacer()
                        Image(isEnabledButtonOne == true ? "ShapeOn" : "ShapeOff")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 23)
                        //                        Spacer()
                        
                        if isEnabledButtonOne {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.black)
                        } else {
                            Rectangle()
                            .frame(height: 0)
                            .foregroundColor(Color.black)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    isEnabledButtonOne = false
                    print("isEnabledButtonOne \(isEnabledButtonOne)")
                } label: {
                    VStack(spacing: 13) {
                        Spacer()
                        Image(isEnabledButtonOne == false ? "Shape2On" : "Shape2Off")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 23)
                            .overlay(Divider().foregroundStyle(Color.black), alignment: .bottom)
                        if !isEnabledButtonOne {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.black)
                        } else {
                            Rectangle()
                                .frame(height: 0)
                                .foregroundColor(Color.black)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
            }
            .frame(height: 44)
            
                if isEnabledButtonOne  {
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
                } else {
                    ScrollView {
                        LazyVGrid(columns: columnsOne, spacing: 1) {
                            ForEach(photoCels, id: \.image) { post in
                                GeometryReader { geometry in
                                    Image(post.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: geometry.size.width)
                                        .clipped()
                                }
                                .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
    }
}

#Preview {
    ProfileListButtons()
}
