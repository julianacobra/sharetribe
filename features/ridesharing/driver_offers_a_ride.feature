Feature: Driver offers a ride
  In order to help others and/or get some gas money with a car ride I'm going to do anyway
  As a driver planning a car ride soon
  I want to publish my planned route and schedule so that others can ask me to pick them up

    Scenario: Offering ridesharing by SMS
      Given I'm planning to drive somewhere
      When I send SMS "tkk taik 14:00" to Kassi
      Then An offer for shared ride from "tkk" to "taik" starting at "14:00" should be added to Kassi
      
    Scenario: Offering ridesharing starting right now by SMS
      Given I'm planning to drive somewhere
      And I want to start about now
      When I send SMS "tkk taik" to Kassi
      Then An offer for shared ride from "tkk" to "taik" starting at current time should be added to Kassi
  
    Scenario: Offering ridesharing from current location by SMS
      Given I'm planning to drive somewhere
      And my phone location can be requested by Kassi
      When I send SMS "hse 9:30" to Kassi
      Then An offer for shared ride from my current location to "hse" starting at "9:30" should be added to Kassi
  
    Scenario: Matching potential passenger is found (phone number)
      Given I have offered a shared ride from "taik" to "tkk" at "13:00"
      And my phone number is in my public profile
      And my phone number is "0501234567"
      And my username is "Simo"
      And the allowed difference in starting times is 15 minutes by default
      When a user "Erkki" adds a request to get a ride from "taik" to "tkk" at "13:15"
      Then user "Erkki" should get an SMS "Simo is driving from taik to tkk at 13:00. You can call him at 0501234567. To pay some gas money to Simo, reply 'SEND Xe' where X is the amount (max.90e)"
        
    
    Scenario: Matching potential passenger is found (phone number not public)
      Given I have offered a shared ride from "taik" to "tkk" at "13:00"
      And my phone number is not in my public profile
      When a user "Erkki" adds a request to get a ride from "taik" to "tkk" at "13:00"
      Then I should get an SMS "Erkki needs a ride from taik to tkk. Reply OK to give him your phone number."
      # Is it clever to have additional cofirmation just to release phone number based on some username.. probably not
      # But how should it be done?
    
    
    
    
    
    