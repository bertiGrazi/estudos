//
//  ViewController.swift
//  PageControllWithCollectionView
//
//  Created by Grazi  Berti on 09/12/22.

import UIKit

class ViewController: UIViewController {
    
    let viewModel = NameUserViewModel()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.backgroundColor = .orange
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: view.frame.width, height: 100)
    
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(self.collectionView)
        self.view.addSubview(pageControl)
        
        self.pageControl.numberOfPages = viewModel.fetchNameUserList().count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = .red
        self.pageControl.pageIndicatorTintColor = .black
        self.pageControl.currentPageIndicatorTintColor = .green
        self.pageControl.addTarget(self, action: #selector(tappedPageControll), for: .allEvents)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -600),
            
            self.pageControl.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 20),
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
        ])
    }
    
    @objc
    func tappedPageControll(_ sender: UIPageControl) {
        self.collectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.fetchNameUserList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {  return UICollectionViewCell() }
        cell.configCell(data: viewModel.fetchNameUserList()[indexPath.row])
        return cell
    }
}
