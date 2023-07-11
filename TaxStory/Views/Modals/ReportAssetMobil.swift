//
//  ReportAssetMobil.swift
//  TaxStory
//
//  Created by Verrell Sutanto on 10/07/23.
//

import SwiftUI

struct ReportAssetMobilView: View {
    
    @Binding var modalPresentMobil : Bool
    
    @State var isPilihanTahunBenar = false
    @State var isPilihanHargaBenar = false
    
    @State var isPilihanTahun1Selected = false
    @State var isPilihanTahun2Selected = false
    @State var isPilihanHarga1Selected = false
    @State var isPilihanHarga2Selected = false
    @State var isPilihanHarga3Selected = false
    
    @State var result = ""
    
    @Binding var listGambar:[String]
    
    @Binding var modalMobilAppended : Bool
    
    var body: some View {
//        VStack {
            GeometryReader{ geoScreen in
                VStack{
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        Image("ModalMobil")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geoScreen.size.width * 0.7, height: geoScreen.size.height * 0.7)
                            .overlay{
                                
                                HStack{
                                    
                                    Button{
                                        isPilihanTahunBenar = false
                                        isPilihanTahun1Selected = true
                                        isPilihanTahun2Selected = false
                                    }label: {
                                        Image("Mobil2018")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 11)
                                    .opacity(isPilihanTahun1Selected == true ? 1 : 0.5)
                                    
                                    Button{
                                        isPilihanTahunBenar = true
                                        isPilihanTahun2Selected = true
                                        isPilihanTahun1Selected = false

                                    }label: {
                                        Image("Mobil2023")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 11)
                                    .opacity(isPilihanTahun2Selected == true ? 1 : 0.5)
                                    
                                }
                                .offset(x: geoScreen.size.width / 28, y: geoScreen.size.height / 30)
                                
                                HStack{
                                    
                                    Button{
                                        isPilihanHargaBenar = true
                                        isPilihanHarga1Selected = true
                                        isPilihanHarga2Selected = false
                                        isPilihanHarga3Selected = false
                                    }label: {
                                        Image("Mobil800jt")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 9)
                                    .opacity(isPilihanHarga1Selected == true ? 1 : 0.5)
                                    
                                    Button{
                                        isPilihanHargaBenar = false
                                        isPilihanHarga2Selected = true
                                        isPilihanHarga1Selected = false
                                        isPilihanHarga3Selected = false
                                    }label: {
                                        Image("Mobil900jt")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 9)
                                    .opacity(isPilihanHarga2Selected == true ? 1 : 0.5)
                                    
                                    Button{
                                        isPilihanHargaBenar = false
                                        isPilihanHarga3Selected = true
                                        isPilihanHarga1Selected = false
                                        isPilihanHarga2Selected = false
                                    }label: {
                                        Image("Mobil1M")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 9)
                                    .opacity(isPilihanHarga3Selected == true ? 1 : 0.5)
                                    
                                }
                                .offset(x: geoScreen.size.width / 8.9, y: geoScreen.size.height / 6.8)
                                
                                HStack{
                                    Button{
//                                        if isPilihanTahunBenar == true && isPilihanHargaBenar == true{
//                                            result = "Yey Anda Benar"
//                                        }else{
//                                            result = "Coba dibaca lagi ya deskripsinya"
//                                        }
                                        modalPresentMobil = false
                                        listGambar.append("ListMobil")
                                        modalMobilAppended = true
                                    }label: {
                                        Image("ButtonPlus")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 22)
                                    .disabled(!isPilihanTahunBenar || !isPilihanHargaBenar)
                                    .opacity(!isPilihanTahunBenar || !isPilihanHargaBenar ? 0 : 1)
                                }
                                .offset(x: geoScreen.size.width / 3.5, y: geoScreen.size.height / 4.5)
                                
//                                Text("Result \(result)")
//                                    .foregroundColor(.red)
//                                    .offset(x: geoScreen.size.width / 10, y: geoScreen.size.height / 4.7)
                                
                            }
                            .overlay{
                                Button {
                                    print("close")
                                    modalPresentMobil = false
                                } label: {
                                    Image("Close")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geoScreen.size.width * 0.06, height: geoScreen.size.height * 0.06)
                                    
                                }
                                .offset(x: geoScreen.size.width * 0.35, y: -geoScreen.size.height * 0.32)
                            }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            
//        }
//        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.6)
//        .ignoresSafeArea()
    }
}

struct ReportAssetMobilView_Previews: PreviewProvider {
    static var previews: some View {
        ReportAssetMobilView(modalPresentMobil: .constant(false), listGambar: .constant(["ListMobil"]), modalMobilAppended: .constant(false))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
