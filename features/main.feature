Feature: Main app
   abil to upload spreadsheet
   App will read uploaded spreadsheet
   Each pallet will have 10-60 items on it. The app will aggregate pallets by pallet Id and then call the Amazon api to obtain the retail value of the pallet. The API calls should be made with batches of items. One call per item is not acceptable due to my usage limits.
   An html based report will show the following
   Pallet id, item id, description, Amazon value
    ---- total pallet value
   repeat for each pallet

  Scenario: User upload spreadsheet  and it use amazon api to get info
    When user upload spreadsheet
    Then App will create item for 1st row of Spreadsheet
    And  App will create item for last row of Spreadsheet
    Then App will get info from Amazon api
    Then App will show html report  with Pallet id, item id, description, Amazon value ---- total pallet value
    Then Repeat for each pallet
    