require 'rails_helper'

RSpec.describe 'Contestants Index Page', type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @jay.id, project_id: @boardfit.id)
  end

  it 'lists each contestant and each project theyve been on' do
    visit("/constestants")
    expect(page).to have_content(@jay.name)
    expect(page).to have_content(@gretchen.name)
    within("p##{jay.id}") do
      expect(page).to have_content("Projects: News Chic, Boardfit")
    end
    within("p##{@gretchen.id}") do
      expect(page).to have_content("Projects: News Chic")
    end
  end
end