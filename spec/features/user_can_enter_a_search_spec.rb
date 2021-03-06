require 'rails_helper'

 describe 'As a user' do
   context 'I can visit / ' do
     it "and fill in a zip code" do
       visit '/'
       fill_in 'zip_code', with: "80203"
       click_on 'Locate'
     end
   end
   context 'I can search by a zip code' do
     it 'and have stations shown to me' do
       VCR.use_cassette 'features/stations' do
         visit '/'
         fill_in 'zip_code', with: "80203"
         click_on 'Locate'
         expect(page).to have_current_path("/search?utf8=%E2%9C%93&zip_code=80203&commit=Locate")
         expect(page).to have_selector('div.station', count: 10)
         expect(page).to have_content('Fuel Types: ELEC' || 'Fuel Types: LPG')
         expect(page).to_not have_content('CNG')
         expect(page).to have_content('Address: 800 Acoma St')
         expect(page).to have_content('Access times: MO: 12:00am-12:00am; TU: 12:00am-12:00am; WE: 12:00am-12:00am; TH: 12:00am-12:00am; FR: 12:00am-12:00am; SA: 12:00am-12:00am; SU: 12:00am-12:00am')
         expect(page).to have_content('Distance: 0.88883')
       end
     end
   end
 end




 # As a user
 # When I visit "/"
 # And I fill in the search form with 80203
 # And I click "Locate"
 # Then I should be on page "/search" with parameters visible in the url
 # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
 # And the stations should be limited to Electric and Propane
 # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
