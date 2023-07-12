//
//  FillForm.swift
//  TaxStory
//
//  Created by Alex Lim on 27/06/23.
//

import SwiftUI

struct FillForm: View
{
	@StateObject var ViewModel : AnswerViewModel
	@State private var currentImageIndex = 0
	@State private var selectedButton = 1
	@State var dragAmount = CGSize.zero
	@Binding var page: String
	
	@State var showMapModal = false
	
	var body: some View
	{
		GeometryReader
		{ geometry in
			ZStack
			{
				Image("formSPTdanBuktiPotong-10")
					.resizable()
					.scaledToFill()
					.overlay{
						VStack{
							HStack{
								Button{
									// munculin dialog, trus balik ke main map
									showMapModal = true
								}label: {
									Image("Map")
										.resizable()
										.scaledToFit()
								}
								.fullScreenCover(isPresented: $showMapModal, content: {
									WarningMapModal(showMapModal: $showMapModal, page: $page)
								})
								.frame(width: geometry.size.width / 18)
								
								Spacer()
								
								Button{
									// kasi hint minigames ini suruh ngapain
								}label: {
									Image("Hint")
										.resizable()
										.scaledToFit()
								}
								.frame(width: geometry.size.width / 18)
							}
							.padding(.leading, geometry.size.width / 18)
							.padding(.trailing, geometry.size.width / 15)
							.padding(.top, geometry.size.height / 11)
							
							Spacer()
						}
					}
				// task list
				VStack
				{
					HStack
					{
						VStack
						{
							Image("Quest")
								.resizable()
								.scaledToFit()
								.frame(width: geometry.size.width / 5.8)
						}
						.overlay(
							VStack
							{
								Text("Quest")
									.font(.title2)
									.bold()
									.foregroundColor(.white)
									.padding(.top, geometry.size.height / 110)
								Spacer()
								VStack(alignment: .leading)
								{
									HStack
									{
										Image(systemName: "checkmark.circle.fill")
											.foregroundColor(Color("Dark Brown"))
										
										Text("Pilih form")
											.font(.title2)
											.foregroundColor(Color("Dark Brown"))
									}
									HStack
									{
										Image(systemName: "checkmark.circle.fill")
											.foregroundColor(Color("Dark Brown"))
										
										Text("Minta bukti potong")
											.font(.title2)
											.foregroundColor(Color("Dark Brown"))
									}
									HStack
									{
										Image(systemName: "circle.fill")
											.foregroundColor(Color("Dark Brown"))
										
										Text("Isi formulir")
											.font(.title2)
											.foregroundColor(Color("Dark Brown"))
									}
									HStack
									{
										Image(systemName: "circle")
											.foregroundColor(Color("Dark Brown"))
										
										Text("Lapor Harta")
											.font(.title2)
											.foregroundColor(Color("Dark Brown"))
									}
									
									HStack {
										Image(systemName: "circle")
											.foregroundColor(Color("Dark Brown"))
										
										Text("PTKP")
											.font(.title2)
											.foregroundColor(Color("Dark Brown"))
									}
									HStack
									{
										Image(systemName: "circle")
											.foregroundColor(Color("Dark Brown"))
										
										Text("Result")
											.font(.title2)
											.foregroundColor(Color("Dark Brown"))
									}
								}
								.padding(.horizontal, geometry.size.width / 55)
								.padding(.top, geometry.size.height / 40)
								
								Spacer()
							}
						)
						.padding(.leading, geometry.size.width / 18)
						.padding(.top, geometry.size.height / 6)
						Spacer()
					}
					Spacer()
				}
			}
			// SPTForm
			VStack
			{
				VStack
				{
					Image("formSPTdanBuktiPotong-07")
						.resizable()
						.scaledToFit()
						.frame(width: geometry.size.width / 3.6)
						.padding(.leading, geometry.size.width / 4.2)
						.padding(.top, geometry.size.height / 7)
					
				}
				Spacer()
			}
			
			//DataBuktiPotong
			VStack
			{
				ZStack
				{
					Image(selectedImageName())
						.resizable()
						.scaledToFit()
						.frame(width: geometry.size.width / 2.1)
						.padding(.leading, geometry.size.width / 2.2)
						.offset(y: geometry.size.height / 20)
						.offset(x: ViewModel.animateWrongText ? -30 : 0)
					VStack()
					{
						VStack()
						{
							Drop(ViewModel: ViewModel, page: $page)
								.offset(x: geometry.size.height / 2.13)
								.offset(y: geometry.size.height / 3.21)
							Drag(ViewModel: ViewModel, pageForm: $selectedButton)
								.offset(x: geometry.size.height / 1.12)
								.offset(y: -geometry.size.height / 6.7)
								.offset(x: ViewModel.animateWrongText ? -30 : 0)
						}
						Spacer()
					}
					//these long if code is for positioning and adjusting the area of invincible button to change picture.
					if selectedButton == 1
					{
						Button(action: {selectedButton = 1})
						{
							Text("")
								.frame(width: 50, height: 100)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.75)
						.offset(y: -geometry.size.height / 4.59) //3.95 = 0,64
						
						Button(action: {selectedButton = 2})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 7.29)
						Button(action: {selectedButton = 3})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 13)
						Button(action: {selectedButton = 4})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 58.94)
						Button(action: {selectedButton = 5})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: geometry.size.height / 22.34)
					}
					else if selectedButton == 2
					{
						Button(action: {selectedButton = 1})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.77)
						.offset(y: -geometry.size.height / 4.15)
						Button(action: {selectedButton = 2})
						{
							Text("")
								.frame(width: 50, height: 100)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.75)
						.offset(y: -geometry.size.height / 6.28)
						Button(action: {selectedButton = 3})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 13)
						Button(action: {selectedButton = 4})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 60.3)
						Button(action: {selectedButton = 5})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: geometry.size.height / 22.7)
					}
					else if selectedButton == 3
					{
						Button(action: {selectedButton = 1})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.77)
						.offset(y: -geometry.size.height / 4.18)
						Button(action: {selectedButton = 2})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.765)
						.offset(y: -geometry.size.height / 5.59)
						Button(action: {selectedButton = 3})
						{
							Text("")
								.frame(width: 50, height: 100)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.74)
						.offset(y: -geometry.size.height / 10.3)
						Button(action: {selectedButton = 4})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 70.3)
						Button(action: {selectedButton = 5})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: geometry.size.height / 22.7)
					}
					else if selectedButton == 4
					{
						Button(action: {selectedButton = 1})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
							
						}
						.offset(x: geometry.size.height / 1.77)
						.offset(y: -geometry.size.height / 4.1)
						Button(action: {selectedButton = 2})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.765)
						.offset(y: -geometry.size.height / 5.49)
						Button(action: {selectedButton = 3})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.765)
						.offset(y: -geometry.size.height / 8.24)
						Button(action: {selectedButton = 4})
						{
							Text("")
								.frame(width: 50, height: 100)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.76)
						.offset(y: -geometry.size.height / 25.65)
						Button(action: {selectedButton = 5})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.768)
						.offset(y: geometry.size.height / 23.7)
					}
					else
					{
						Button(action: {selectedButton = 1})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.77)
						.offset(y: -geometry.size.height / 4.1)
						Button(action: {selectedButton = 2})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.765)
						.offset(y: -geometry.size.height / 5.49)
						Button(action: {selectedButton = 3})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.765)
						.offset(y: -geometry.size.height / 8.2)
						Button(action: {selectedButton = 4})
						{
							Text("")
								.frame(width: 30, height: 60)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.765)
						.offset(y: -geometry.size.height / 16.85)
						Button(action: {selectedButton = 5})
						{
							Text("")
								.frame(width: 50, height: 100)
								.foregroundColor(Color.black)
								.clipShape(Rectangle())
						}
						.offset(x: geometry.size.height / 1.758)
						.offset(y: geometry.size.height / 45.7)
					}
				}
				.padding()
				.onAppear
				{
					ViewModel.makeGrid()
				}
				.environmentObject(ViewModel)
			}
			VStack
			{
				// guide text
				Spacer()
				HStack
				{
					Image("bayu-pilih-form")
						.resizable()
						.scaledToFit()
						.frame(width: geometry.size.width / 7)
						.offset(y: -geometry.size.height / 35.85)
						.offset(x: geometry.size.height / 25.55)
					Image("formSPTdanBuktiPotong-08")
						.resizable()
						.scaledToFit()
						.padding(.top, geometry.size.height / 30)
						.offset(y: -geometry.size.height / 1000.85)
						.offset(x: geometry.size.height / 200.55)
						.frame(width: geometry.size.width / 2.61)
						.overlay(
							Text("Yuk bantu Bayu mengisi formulir bukti potong!")
								.font(.system(size: geometry.size.width / 65, design: .rounded))
								.foregroundColor(Color("Dark Brown"))
								.bold()
								.padding(.horizontal, geometry.size.width / 21)
								.padding(.top, geometry.size.height / 550)
						)
				}
			}
			.padding(.bottom, geometry.size.height / 12.2)
			.padding(.trailing, geometry.size.width / 1)
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
		}
		.ignoresSafeArea()
	}
	
	// Function to determine the image name based on the selected button
	private func selectedImageName() -> String
	{
		switch selectedButton
		{
			case 1:
				return "BuktiPotong1"
			case 2:
				return "BuktiPotong2"
			case 3:
				return "BuktiPotong3"
			case 4:
				return "BuktiPotong4Revisi"
			case 5:
				return "BuktiPotong5a"
			default:
				return ""
		}
	}
}

struct FillForm_Previews: PreviewProvider
{
	static var previews: some View
	{
		FillForm(ViewModel: AnswerViewModel(), page: .constant("isiBuktiPotong"))
			.previewDevice("iPad Pro (12.9-inch) (6th generation)")
			.previewInterfaceOrientation(.landscapeLeft)
	}
}

