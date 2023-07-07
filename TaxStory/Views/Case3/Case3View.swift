//
//  Case2View.swift
//  TaxStory
//
//  Created by Timothy on 21/06/23.
//

import SwiftUI

struct Case3View: View
{
    @State var page: String = "pilihFormSPT"
    
    var body: some View
    {
        if page == "pilihFormSPT"
        {
            ChooseFormView(page: $page)
        }else if page == "mintaBuktiPotong"
        {
            RequestWitholdingTaxCertificateView(page: $page)
        }else if page == "isiBuktiPotong"
        {
            FillForm(ViewModel: AnswerViewModel())
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
