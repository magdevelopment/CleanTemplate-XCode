//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_productName: identifier___ViewController: UIViewController, CustomViewLoadable {

    typealias Screen = ___VARIABLE_productName: identifier___Screen
    
	var presenter: ___VARIABLE_productName:identifier___Presenter!

    override func loadView() {
        view = Screen()
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        presenter.onViewDidDetach()
    }
}

extension ___VARIABLE_productName: identifier___ViewController: ___VARIABLE_productName:identifier___View {

}
