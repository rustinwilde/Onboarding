//
//  OnboardingCVCell.swift
//  Onboarding
//
//  Created by Rustin Wilde on 10.03.23.
//

import UIKit

class OnboardingCVCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImage: UIImageView!
    
    @IBOutlet weak var sliderTitleLbl: UILabel!
    
    @IBOutlet weak var sliderDetailLbl: UILabel!
    
    func setup (_ slide: OnboardingSlide) {
        sliderImage.image = slide.image
        sliderTitleLbl.text = slide.title
        sliderDetailLbl.text = slide.details
    }
    
}





