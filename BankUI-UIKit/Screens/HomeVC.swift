//
//  HomeVC.swift
//  BankUI-UIKit
//
//  Created by Inyene Etoedia on 09/09/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private let mainVstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill 
       // stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.backgroundColor = .lightGray
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureConstraint()

    }
    
    func setupView(){
        let name = NameViewWithNotification()
        let balance = BalanceView()
        let optionView = OptionView()
        let quickTrx = QuickTransaction()

  
        mainVstack.addArrangedSubview(name)
        mainVstack.addArrangedSubview(SpacerView(height: 20))
        mainVstack.addArrangedSubview(balance)
        mainVstack.addArrangedSubview(SpacerView(height: 15))
        mainVstack.addArrangedSubview(optionView)
        mainVstack.addArrangedSubview(SpacerView(height: 35))
        mainVstack.addArrangedSubview(quickTrx)
        
        view.addSubview(mainVstack)
    }
    
    func configureConstraint(){
        NSLayoutConstraint.activate([
            
            mainVstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainVstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
           // mainVstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainVstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            
        ])
    }
    


}


#Preview {
    HomeVC()
}


class OptionView: UIView {
    
    private let mainHstack : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
         stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let transferHstack : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        //stack.distribution = .fillEqually
        stack.backgroundColor = . green
        stack.layer.borderWidth = 1.0
        stack.layer.cornerRadius = 22
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let requestHstack : UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.backgroundColor = . green
        stack.layer.borderWidth = 1.0
        stack.layer.cornerRadius = 22
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let transferIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: images.send))
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let requestIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: images.receive))
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        let transfer = TextLabel(labelText: "Transfer", size: 19, labelColor: .black, weight: .light)
        let request = TextLabel(labelText: "Request", size: 19, labelColor: .black, weight: .light)
        
        transferHstack.addArrangedSubview(transferIcon)
        transferHstack.addArrangedSubview(transfer)
        
        requestHstack.addArrangedSubview(requestIcon)
        requestHstack.addArrangedSubview(request)
        
        mainHstack.addArrangedSubview(transferHstack)
        mainHstack.addArrangedSubview(requestHstack)
        
        addSubview(mainHstack)
        
    }
    
    func configureView(){
        
        NSLayoutConstraint.activate([
            mainHstack.topAnchor.constraint(equalTo: topAnchor),
            mainHstack.bottomAnchor.constraint(equalTo: bottomAnchor),
           // mainHstack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainHstack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainHstack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

class BalanceView: UIView {
    
    private let mainVstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let hstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let icon: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "eye"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let balanceLabel : UILabel = {
        let label  = UILabel()
        label.text = "$30000"
        label.textColor = .black
        label.font = .systemFont(ofSize: 42, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var obscureBalance = false
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView(){
        
        let label = TextLabel(labelText: "Current Balance", size: 12, labelColor: .black, weight: .regular)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleVisbility))
        
        icon.addGestureRecognizer(tapGesture)
        
        hstack.addArrangedSubview(label)
        hstack.addArrangedSubview(icon)
        
        mainVstack.addArrangedSubview(hstack)
        mainVstack.addArrangedSubview(balanceLabel)
        
        addSubview(mainVstack)
    }
    
    
    func configureView(){
        NSLayoutConstraint.activate([
            
            mainVstack.topAnchor.constraint(equalTo: topAnchor),
            mainVstack.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainVstack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainVstack.trailingAnchor.constraint(equalTo: trailingAnchor)
          
        ])
    }
    
    
   @objc func toggleVisbility(){
        obscureBalance.toggle()
        icon.image = UIImage(systemName: obscureBalance ? "eye.slash" : "eye")
       balanceLabel.text = obscureBalance ? "$******" : "$3000"
    }
    
    
}


class NameViewWithNotification: UIView {
    
    private let hstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let LabelVstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let avatar: UIImageView = {
        let image = UIImageView(image: UIImage(named: images.avatar))
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let notificationBell: UIImageView = {
        let image = UIImageView(image: UIImage(named: images.notificationBell))
        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        configureConstraint()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
       
        let welcome = TextLabel(labelText: "Welcome", size: 14, labelColor: .black, weight: .light)
        let name = TextLabel(labelText: "Adewale Ahmed", size: 15, labelColor: .black, weight: .medium)
        
        LabelVstack.addArrangedSubview(welcome)
        LabelVstack.addArrangedSubview(name)
        
        hstack.addArrangedSubview(avatar)
        hstack.addArrangedSubview(LabelVstack)
        hstack.addArrangedSubview(spacer)
        hstack.addArrangedSubview(notificationBell)
        
        
        addSubview(hstack)
        
    }
    
    func configureConstraint(){
        NSLayoutConstraint.activate([
            hstack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hstack.trailingAnchor.constraint(equalTo: trailingAnchor),
            hstack.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            hstack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    
}




class QuickTransaction: UIView {
    
    private let beneficiaryStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let vstack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
       // stack.distribution = .fillEqually
        //stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let hstack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
       // stack.spacing = 12
        stack.distribution = .equalSpacing
        //stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let plusIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "plus.circle"))
        icon.contentMode = .scaleAspectFit
        icon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor).isActive = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let textLabel: UILabel = {
       let label = UILabel()
        label.text = "Beneficiaries"
        label.font = .systemFont(ofSize: 15, weight: .light)

        return label
    }()
    
    private let viewAllLabel: UILabel = {
       let label = UILabel()
        label.text = "View All"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        configureView()
    }
    
    let beneficiary = BeneficiariesDTO.allBeneficiaries().prefix(4)
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        beneficiaryStack.addArrangedSubview(plusIcon)
        for res in beneficiary {
            /*
             let label = PaddedLabel()
             label.text = res.
             label.font = .systemFont(ofSize: 30, weight: .bold)
             label.textColor = .black
             label.textAlignment = .center
             label.backgroundColor = .green
             label.translatesAutoresizingMaskIntoConstraints = false
             label.textInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
            // Use Auto Layout to keep width and height equal for a circular shape
            label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true

            // Round the corners to make it a circle
            label.layer.cornerRadius = 25 // half of height (74 / 2)
            label.layer.masksToBounds = true
             
            */

            
            let avatar = UIImageView(image: UIImage(named: res.image))
            avatar.contentMode = .scaleAspectFit
            avatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
            avatar.widthAnchor.constraint(equalTo: avatar.heightAnchor).isActive = true
            avatar.translatesAutoresizingMaskIntoConstraints = false
            
             let username = UILabel()
            username.text = res.name.components(separatedBy: " ").first ?? ""
            username.font = .systemFont(ofSize: 13, weight: .regular)
            username.translatesAutoresizingMaskIntoConstraints = false
              
            let vstack = UIStackView(arrangedSubviews: [avatar, username])
            vstack.axis = .vertical
            vstack.alignment = .center
            vstack.translatesAutoresizingMaskIntoConstraints = false

            
            beneficiaryStack.addArrangedSubview(vstack)
        }
        
        let spacerView = UIView()
           spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
           spacerView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        hstack.addArrangedSubview(textLabel)
        hstack.addArrangedSubview(viewAllLabel)
        
        beneficiaryStack.addArrangedSubview(spacerView)
       
        vstack.addArrangedSubview(hstack)
        vstack.addArrangedSubview(beneficiaryStack)
        addSubview(vstack)
        
    }
    
    func configureView() {
        NSLayoutConstraint.activate([
            vstack.topAnchor.constraint(equalTo: topAnchor),
            vstack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
//            hstack.leadingAnchor.constraint(equalTo: leadingAnchor),
//            hstack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            beneficiaryStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            beneficiaryStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    

    
    
}

class PaddedLabel: UILabel {
    var textInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let width = originalContentSize.width + textInsets.left + textInsets.right
        let height = originalContentSize.height + textInsets.top + textInsets.bottom
        return CGSize(width: width, height: height)
    }
    
    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: textInsets)
        super.drawText(in: insetRect)
    }
}

extension QuickTransaction : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuickTXCell
        
        return cell
    }
    
    
}



class QuickTXCell: UITableViewCell {
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "David"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView(){
        addSubview(label)
    }
    
    
    func configureView(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}








