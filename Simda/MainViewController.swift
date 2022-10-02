//
//  MainViewController.swift
//  Simda
//
//  Created by 전지민 on 2022/10/02.
//

import UIKit
class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var todaySeedCard: TodaySeedCard!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        todaySeedCard.layer.cornerRadius = 20
        todaySeedCard.setup()
    }
    
    @IBAction func pageValueDidChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(row: pageControl.currentPage, section: 0)
        let animated: Bool = {
            guard #available(iOS 14.0, *) else { return true}
            return pageControl.interactionState != .continuous
        }()
        
        collectionView.scrollToItem(at: indexPath, at: .left, animated: animated)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let width = scrollView.frame.width - (scrollView.contentInset.left * 2)
//        let index = scrollView.contentOffset.x / width
//        let roundedIndex = round(index)
//        self.pageControl?.currentPage = Int(roundedIndex)
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = 6
        
        pageControl.numberOfPages = count
        pageControl.isHidden = !(count > 1)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeedCell", for: indexPath) as! SeedCell
        
        cell.layer.cornerRadius = 10
        cell.keyword1.clipsToBounds = true
        cell.keyword1.layer.cornerRadius = 14
        cell.keyword2.clipsToBounds = true
        cell.keyword2.layer.cornerRadius = 14
        cell.keyword3.clipsToBounds = true
        cell.keyword3.layer.cornerRadius = 14
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 327, height: 140)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = 327 + 8
        let index = round(scrolledOffsetX / CGFloat(cellWidth))
        targetContentOffset.pointee = CGPoint(x: index * CGFloat(cellWidth) - scrollView.contentInset.left, y: scrollView.contentInset.top)
        self.pageControl?.currentPage = Int(index)
    }
}
