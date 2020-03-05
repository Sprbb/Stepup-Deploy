Feature: A RA manages tokens tokens registered in the selfservice portal
  In order to manage tokens
  As a RA
  I must be able to manage second factor tokens in RA

  Scenario: Provision an institution and a user to promote later on by an authorized institution
    Given institution "institution-a.example.com" can "select_raa" from institution "institution-a.example.com"
      And institution "institution-a.example.com" can "use_ra" from institution "institution-a.example.com"
      And institution "institution-d.example.com" can "use_raa" from institution "institution-a.example.com"

      And institution "institution-f.example.com" can "select_raa" from institution "institution-f.example.com"
      And institution "institution-f.example.com" can "use_ra" from institution "institution-a.example.com"
      And institution "institution-f.example.com" can "use_ra" from institution "institution-b.example.com"
      And institution "institution-f.example.com" can "use_ra" from institution "institution-f.example.com"
      And institution "institution-f.example.com" can "use_raa" from institution "institution-a.example.com"
      And institution "institution-f.example.com" can "use_raa" from institution "institution-f.example.com"

      And institution "institution-d.example.com" can "select_raa" from institution "institution-a.example.com"
      And institution "institution-d.example.com" can "select_raa" from institution "institution-b.example.com"

      And a user "joe-a-raa institution-a" identified by "urn:collab:person:institution-a.example.com:joe-a-raa" from institution "institution-a.example.com"
    And the user "urn:collab:person:institution-a.example.com:joe-a-raa" has a vetted "yubikey"
    And the user "urn:collab:person:institution-a.example.com:joe-a-raa" has the role "raa" for institution "institution-a.example.com"

      And a user "jane-d-raa institution-d.nl" identified by "urn:collab:person:institution-d.example.com:jane-d-raa" from institution "institution-d.example.com"
      And the user "urn:collab:person:institution-d.example.com:jane-d-raa" has a vetted "yubikey"


  Scenario: RAA from other institution can view the tokens page
    Given I am logged in into the ra portal as "joe-a-raa" with a "yubikey" token
  When I visit the RA Management page
    Then I should see the following candidates:
    | name | institution |
