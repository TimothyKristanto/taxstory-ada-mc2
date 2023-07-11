//
//  ReportAssetMotor.swift
//  TaxStory
//
//  Created by Verrell Sutanto on 10/07/23.
//

import SwiftUI

struct ReportAssetMotorView: View {
    
    @Binding var modalPresentMotor : Bool
    
    @State var isPilihanTahunBenar = false
    @State var isPilihanHargaBenar = false
    
    @State var isPilihanTahun1Selected = false
    @State var isPilihanTahun2Selected = false
    @State var isPilihanHarga1Selected = false
    @State var isPilihanHarga2Selected = false
    @State var isPilihanHarga3Selected = false
    
    @State var result = ""
    
    @Binding var listGambar:[String]
    
    @Binding var modalMotorAppended : Bool
    
    var body: some View {
//        VStack {
            GeometryReader{ geoScreen in
                VStack{
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        Image("ModalMotor")
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
                                        Image("Motor2017")
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
                                        Image("Motor2019")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 11)
                                    .opacity(isPilihanTahun2Selected == true ? 1 : 0.5)
                                    
                                }
                                .offset(x: geoScreen.size.width / 28, y: geoScreen.size.height / 30)
                                
                                HStack{
                                    
                                    Button{
                                        isPilihanHargaBenar = false
                                        isPilihanHarga1Selected = true
                                        isPilihanHarga2Selected = false
                                        isPilihanHarga3Selected = false
                                    }label: {
                                        Image("Motor7jt")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geoScreen.size.width / 9)
                                    .opacity(isPilihanHarga1Selected == true ? 1 : 0.5)
                                    
                                    Button{
                                        isPilihanHargaBenar = true
                                        isPilihanHarga2Selected = true
                                        isPilihanHarga1Selected = false
                                        isPilihanHarga3Selected = false
                                    }label: {
                                        Image("Motor10jt")
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
                                        Image("Motor12jt")
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
                                        modalPresentMotor = false
                                        listGambar.append("ListMotor")
                                        modalMotorAppended = true
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
                                    modalPresentMotor = false
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

struct ReportAssetMotorView_Previews: PreviewProvider {
    static var previews: some View {
        ReportAssetMotorView(modalPresentMotor: .constant(false), listGambar: .constant(["ListMotor"]), modalMotorAppended: .constant(false))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
