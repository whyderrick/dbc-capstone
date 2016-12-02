require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
let!(:group) { Group.create!(name: "darren", location: "Oakland") }

  describe "GET #index" do
    it "returns the index template" do 
      get :index 
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "returns the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #create" do
    it "returns new username" do
      post :create,  params: {group: {location: "Burlingame"}}
      expect(assigns(:group).location).to eq "Burlingame"
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show,  params: {id: group.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    xit "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
