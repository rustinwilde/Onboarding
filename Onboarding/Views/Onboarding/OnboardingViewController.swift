//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Rustin Wilde on 08.03.23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let slider = OnboardingCVCell()
    
    var slides : [OnboardingSlide] = []
    
    
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Got It!", for: .normal)
                nextBtn.backgroundColor = UIColor(red: 51/255, green: 178/255, blue: 73/255, alpha: 1.0)
            } else {
                nextBtn.setTitle("Next", for: .normal)
                nextBtn.backgroundColor = .systemBlue
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.titleLabel?.text = "Next"
        
        
        
        slides = [
//        OnboardingSlide(title: "Order Your Food",
//                        details: "Now you can order food any time right from your phone.",
//                        image: UIImage(named: "pic1")!),
//        OnboardingSlide(title: "Fast Delivery",
//                        details: "We will deliver any order within 30 minutes",
//                        image: UIImage(named: "pic2")!),
//        OnboardingSlide(title: "Customer Satisfaction",
//                        details: "Our customers rely on us and highly recommend our services to their friends",
//                        image: UIImage(named: "pic3")!)
            .init(title: "Order Your Food", details: "Now you can order food any time right from your phone.", image: UIImage(named: "pic1")!),
            .init(title: "Fast Delivery", details: "We will deliver any order within 30 minutes", image: UIImage(named: "pic2")!),
            .init(title: "Customer Satisfaction", details: "Our customers rely on us and highly recommend our services to their friends", image: UIImage(named: "pic3")!)
        ]
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = layout
    }
    
    override func viewDidLayoutSubviews() {
        nextBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
//        if currentPage == slides.count - 1 {
//            print("Go to the next screen")
//        } else {
//            currentPage += 1
//            print("CURRENT PAGE \(currentPage)")
//            let indexPath = IndexPath(item: currentPage, section: 0)
//            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            nextBtn.backgroundColor = .blue
//        }
        
        pageControl.currentPage = currentPage

        if currentPage == slides.count - 1 {
        print("Go to the next screen")
            
        } else {
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.backgroundColor = .systemBlue
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally,
        animated: true)
            print("SLIDES: \(slides.count)")
            print("CURRENT PAGE \(currentPage)")
            print("indexPath \(indexPath.item)")
        }
    }
    
    

}



extension OnboardingViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCVCell", for: indexPath) as! OnboardingCVCell
        cell.setup(slides[indexPath.row])
        cell.sliderImage.frame = CGRect(x: 60, y: 115, width: 260, height: 280)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,
                      height: collectionView.frame.size.height)
         }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
        
        print(currentPage)
        
        }
    
    
    
}



