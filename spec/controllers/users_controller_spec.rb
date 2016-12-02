require 'rails_helper'

RSpec.describe UsersController, type: :controller do
let!(:user) { User.create!(username: "darren", email: "darren@darren.com", password: "password",) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns new username" do
      post :create, {user: {username: "Derrick"}}
      expect(assigns(:user).username).to eq "Derrick"
    end
  end

  describe "GET #show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    xit "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    xit "returns http success" do
      get :update
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
