//
//  Case2View.swift
//  TaxStory
//
//  Created by Timothy on 21/06/23.
//

import SwiftUI

struct Case3View: View
{
    @State var page: String = "visualNovel6"
    
    var body: some View
    {
        if page == "pilihFormSPT" {
            ChooseFormView(page: $page)
        } else if page == "mintaBuktiPotong" {
            RequestWitholdingTaxCertificateView(page: $page)
        } else if page == "isiBuktiPotong" {
			FillForm(ViewModel: AnswerViewModel(), page: $page)
		} else if page == "mapCase" {
			ContentView(page: page)
		} else if page == "laporHarta" {
			ReportAssetView(page: $page)
		} else if page == "pilihPTKP" {
			ChoosePTKPView(page: $page)
		} else if page == "visualNovel6"{
			VisualNovel(visualNovelSceneCount: 6, page: $page)
		} else if page == "visualNovel8" {
			VisualNovel(visualNovelSceneCount: 8, page: $page)
		} else if page == "visualNovel11" {
			VisualNovel(visualNovelSceneCount: 11, page: $page)
		} else if page == "visualNovel14" {
			VisualNovel(visualNovelSceneCount: 14, page: $page)
		} else if page == "visualNovel17" {
			VisualNovel(visualNovelSceneCount: 17, page: $page)
		} else if page == "result" {
			Result(page: $page)
		}
    }
}

struct Case3View_Previews: PreviewProvider
{
    static var previews: some View
    {
        Case3View()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
