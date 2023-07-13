require "rails_helper"

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe "Museums Index Page", type: :feature do
  it "can see all museums names" do
    museum_1 = Museum.create!(name: "Museum of Modern Art", number_of_galleries: 10, open_to_public: true)
    museum_2 = Museum.create!(name: "Museum of Natural History", number_of_galleries: 20, open_to_public: true)
    museum_3 = Museum.create!(name: "Museum of Science", number_of_galleries: 30, open_to_public: true)

    visit "/museums"

    expect(page).to have_content(museum_1.name)
    expect(page).to have_content(museum_2.name)
    expect(page).to have_content(museum_3.name)
  end

  it "can see all museums number of galleries" do
    museum_1 = Museum.create!(name: "Museum of Modern Art", number_of_galleries: 10, open_to_public: true)
    museum_2 = Museum.create!(name: "Museum of Natural History", number_of_galleries: 20, open_to_public: true)
    museum_3 = Museum.create!(name: "Museum of Science", number_of_galleries: 30, open_to_public: true)

    visit "/museums"

    expect(page).to have_content(museum_1.number_of_galleries)
    expect(page).to have_content(museum_2.number_of_galleries)
    expect(page).to have_content(museum_3.number_of_galleries)
  end
#   As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  
  it "can see the museums in order of most recently created first" do
    museum_1 = Museum.create!(name: "Museum of Modern Art", number_of_galleries: 10, open_to_public: true)
    museum_2 = Museum.create!(name: "Museum of Natural History", number_of_galleries: 20, open_to_public: true)
    museum_3 = Museum.create!(name: "Museum of Science", number_of_galleries: 30, open_to_public: true)
    
    visit "/museums"

    expect(page.text.index(museum_3.name)).to be < page.text.index(museum_2.name)
    expect(page.text.index(museum_2.name)).to be < page.text.index(museum_1.name)
  end

end
