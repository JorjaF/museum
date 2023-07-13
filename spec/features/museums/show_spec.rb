require 'rails_helper'

#   As a visitor
# When I visit a museum/1
# I see a count of the number of galleries children associated with this museum

RSpec.describe "Museums Show Page", type: :feature do

  it "can show the number of galleries for each museum" do
    museum_1 = Museum.create!(name: "Museum of Modern Art", number_of_galleries: 10, open_to_public: true)
    museum_2 = Museum.create!(name: "Museum of Natural History", number_of_galleries: 20, open_to_public: true)
    museum_3 = Museum.create!(name: "Museum of Science", number_of_galleries: 30, open_to_public: true)

    visit "/museum/#{museum_1.id}"

    expect(page).to have_content("Number of Galleries: #{museum_1.number_of_galleries}")
  end
end
