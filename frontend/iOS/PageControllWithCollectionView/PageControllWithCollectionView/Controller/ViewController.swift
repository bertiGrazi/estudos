//
//  ViewController.swift
//  PageControllWithCollectionView
//
//  Created by Grazi  Berti on 09/12/22.

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let viewModel = NameUserViewModel()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.backgroundColor = .orange
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        
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
    
    let animationView: AnimationView = {
        let animayionView = AnimationView()
        animayionView.translatesAutoresizingMaskIntoConstraints = false
        return animayionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(self.collectionView)
        self.view.addSubview(pageControl)
        self.view.addSubview(animationView)
        
        self.pageControl.numberOfPages = viewModel.fetchNameUserList().count
        self.pageControl.tintColor = .red
        self.pageControl.pageIndicatorTintColor = .black
        self.pageControl.currentPageIndicatorTintColor = .green
        self.pageControl.addTarget(self, action: #selector(tappedPageControll), for: .allEvents)
        
        configConstraints()
        startAnimation()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -600),
            
            self.pageControl.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 20),
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            
            self.animationView.topAnchor.constraint(equalTo: self.pageControl.bottomAnchor, constant: 20),
            self.animationView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 00),
            self.animationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.animationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            self.animationView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.animationView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    fileprivate func startAnimation() {
        let animation = Animation.named("airplane_one")
        animationView.animation = animation
        animationView.frame = self.view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play(
            fromProgress: 0,
            toProgress: 1,
            loopMode: LottieLoopMode.playOnce) { finishedFirtsAnimation in
                if finishedFirtsAnimation {
                    let animationTwo = Animation.named("airplane_two")
                    self.animationView.animation = animationTwo
                    self.animationView.loopMode = .loop
                    self.animationView.play(
                        fromProgress: 0,
                        toProgress: 1,
                        loopMode: LottieLoopMode.playOnce) { finishedSecondAnimation in
                            if finishedSecondAnimation {
                                let animationThree = Animation.named("airplane_three")
                                self.animationView.animation = animationThree
                                self.animationView.loopMode = .playOnce
                                self.animationView.play { finished in
                                    self.startAnimation()
                                }
                            }
                        }
                }
            }
    }
    
    @objc
    func tappedPageControll(_ sender: UIPageControl) {
        self.collectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    /// Método disparado toda vez que acontece o scrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        /// visibleRect = para que a gente consiga trabalhar o estado que ele está (contentOffset)  e ainda pegando o tamanho da nossa collection
        //        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
        //
        //        /// Agora que temos o tamanho vamos trabalhar com a posição que temos
        //        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.maxY)
        //
        //        /// Agora conseguimos pegar a propriedade indexPathForItem onde passamos uma determinada posição para saber quem é nossa célula
        //        let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint)
        //
        //        /// Setando
        //        self.pageControl.currentPage = visibleIndexPath?.row ?? 0
        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
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
