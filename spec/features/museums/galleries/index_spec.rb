require 'rails_helper'

RSpec.describe "Musesums Gallery index" do
  # User Story 10, Parent Child Index Link

  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page 
  # ('/parents/:id/child_table_name')

  it "can show all the galleries for a given museum" do
    museum_1 = Museum.create!(name: "Museum of Modern Art", number_of_galleries: 10, open_to_public: true)
    gallery_1 = museum_1.galleries.create!(name: "Cats", item_name: "Jenny Any Dots", year: 1978, on_loan: false )
    gallery_2 = museum_1.galleries.create!(name: "Bugs", item_name: "Big ass spider", year: 2021, on_loan: true)
    
    visit "/museum/#{museum_1.id}"
    expect(page).to have_link("Gallery View")
    click_link "Gallery View"

    expect(current_path).to eq("/museum/#{museum_1.id}/galleries")
  end
end
