//
//  CardView.swift
//  TaskMamoon
//
//  Created by murad adnan on 23/09/2022.
//

import Foundation
import SwiftUI
import PhotosUI


struct CardView: View {
    
    @State var question = ""
    @State private var description: String = ""
    
    @State var selectedItem: [PhotosPickerItem] = []
    @State var selectedImageData: [Data] = []
    @State var valuuu: Int = 0

    
    var body: some View {
        
        //Question
        VStack(spacing:10) {
            HStack(spacing:10) {
                Text(question).foregroundColor(Color.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 300,alignment: .leading)
                Spacer()
                ZStack {
                Button(action: {
                    //                      print("Pause")
                }, label: {
                    Text("Yes")
                        .foregroundColor(Color.black)
                        .frame(width: 50, height: 30)
                        .background(  RoundedCornersShape(corners: [.topLeft, .bottomLeft], radius: 6)
                            .fill(Color(UIColor.systemGray4)))


                    
                }).offset(x: -40, y: 0)
                Button(action: {
                    //                      print("Pause")
                }, label: {
                    Text("No")
                        .foregroundColor(Color.black)
                        .frame(width: 50, height: 30)
                        .background(RoundedCornersShape(corners: [ .bottomRight,.topRight], radius: 6)
                            .fill(Color(UIColor.systemGray4)))
                       
                    
                }).offset(x: 10, y: 0)
                    
                
            }
            }
            
            
            VStack{
                //Description
                VStack {
                    TextField("Description", text: $description)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                .frame(
                    height: 100,
                    alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1))
                .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                
                HStack{
                    VStack {
                        //                    Image("camera.fill")
                        Image("ic_camera")
                            .foregroundColor(Color.gray)
                        
                    }
                    .padding()
                    .frame(
                        height: 100,
                        alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1))
                    .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                    
            
                    
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            VStack {
                                Image("ic_folder")
                                    .foregroundColor(Color.gray)
                            }
                            .padding()
                            .frame(
                                height: 100,
                                alignment: .leading)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1))
                            .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                            
                        }
                        .onChange(of: selectedItem) { newItems in
                            Task {
                                
                                for newItem in newItems {
                                    Task {
                                        if let data = try? await newItem.loadTransferable(type: Data.self) {
                                            selectedImageData.append(data)
                                           
                                        }
                                    }
                                }
                                selectedItem=[]
                            }
                            
                        }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(selectedImageData, id: \.self) { photoData in
                              
                                if let image = UIImage(data: photoData) {
                                                  Image(uiImage: image)
                                                      .resizable()
                                                      .scaledToFit()
                                                      .padding(-4)
                                                      .frame(height: 100)
                                }
                                
                            }
                      
                        }
                    }
                }
                
            }

            
        }  .background(Color.white)
            .frame(height: 50)
                .padding(.trailing, 15)
                .padding(.leading, 10)
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(question: "123")
    }
}
