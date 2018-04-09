//
//  sampleEarlGreyTests.swift
//  sampleEarlGreyTests
//
//  Created by Rakesh on 05/04/18.
//  Copyright © 2018 Rakesh. All rights reserved.
//

import EarlGrey
import XCTest

class sampleEarlGreyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testEmailTextField(){
  EarlGrey.selectElement(with:grey_accessibilityID("EmailTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "Enter your Email")).assert(grey_text("Enter your Email"))
      
    }
    
    func testPasswordTextField(){
    EarlGrey.selectElement(with:grey_accessibilityID("PasswordTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "Enter your Password")).assert(grey_text("Enter your Password"))
    }
    
    func testLoginWithCredentials(){

    EarlGrey.selectElement(with:grey_accessibilityID("EmailTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "testuser@gmail.com"))

    EarlGrey.selectElement(with:grey_accessibilityID("PasswordTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "abc123"))
        
        EarlGrey.selectElement(with: GREYMatchers.matcher(forButtonTitle: "Login")).perform(grey_tap())
        
        EarlGrey.selectElement(with: grey_accessibilityID("settings")).perform(grey_tap())
        
        EarlGrey.selectElement(with: grey_text("Logout")).perform(grey_tap())
        
        EarlGrey.selectElement(with: grey_text("Login")).assert(grey_sufficientlyVisible())
        
    }
    
    func testLoginWithWrongPassword(){
        
    EarlGrey.selectElement(with:grey_accessibilityID("EmailTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "testuser@gmail.com"))
        
    EarlGrey.selectElement(with:grey_accessibilityID("PasswordTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "wrongpassword"))
        
        EarlGrey.selectElement(with: GREYMatchers.matcher(forButtonTitle: "Login")).perform(grey_tap())
        
        EarlGrey.selectElement(with: grey_text("OK")).perform(grey_tap())

    }
    
    func testNavigatingToSignupScreen(){
   
        EarlGrey.selectElement(with: grey_accessibilityID("SignupScreen")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("SignupButton")).assert(grey_sufficientlyVisible())

    EarlGrey.selectElement(with:grey_accessibilityID("SignupEmailTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "Enter your Email")).assert(grey_text("Enter your Email"))
        
    EarlGrey.selectElement(with:grey_accessibilityID("SignupPasswordTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "Enter your Password")).assert(grey_text("Enter your Password"))
        
        EarlGrey.selectElement(with: grey_accessibilityID("LoginScreen")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("LoginButton")).assert(grey_sufficientlyVisible())

    }
    
    func testSignUpWithBadInputData(){
        
        EarlGrey.selectElement(with: grey_accessibilityID("SignupScreen")).perform(grey_tap())
        EarlGrey.selectElement(with: grey_accessibilityID("SignupButton")).assert(grey_sufficientlyVisible())
 
 EarlGrey.selectElement(with:grey_accessibilityID("SignupEmailTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "sampleuser"))
  EarlGrey.selectElement(with:grey_accessibilityID("SignupPasswordTextField")).perform(GREYActions.actionForClearText()).perform(GREYActions.action(forTypeText: "abc123"))
        
    EarlGrey.selectElement(with: grey_accessibilityID("SignupButton")).perform(grey_tap())
        
    EarlGrey.selectElement(with: grey_text("OK")).perform(grey_tap())
    
    EarlGrey.selectElement(with: grey_accessibilityID("LoginScreen")).perform(grey_tap())
    EarlGrey.selectElement(with: grey_accessibilityID("LoginButton")).assert(grey_sufficientlyVisible())
        
    }
    
}
			
