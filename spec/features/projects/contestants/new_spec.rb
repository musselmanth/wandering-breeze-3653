require 'rails_helper'

RSpec.describe 'Projects Contestants New Page' do

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
  end

  it 'can add a new contestant' do
    visit ("/projects/#{@news_chic.id}")
    expect(page).to have_content("Number of Contestants: 1")

    click_button("Add Contestant")
    expect(current_path).to eq("/projects/#{@news_chic.id}/contestants/new")
    
    fill_in(:contestant_id, with: "#{@gretchen.id}")
    click_button("Submit")

    expect(current_path).to eq("/projects/#{@news_chic.id}")
    expect(page).to have_content("Number of Contestants: 2")

    visit("/contestants")
    within("p##{@gretchen.id}") do
      expect(page).to have_content("Projects: #{@news_chic.name}")
    end
  end

end