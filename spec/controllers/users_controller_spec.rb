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
      post :create, params: {user: {username: "Derrick"}}
      expect(assigns(:user).username).to eq "Derrick"
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: user.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update, params: {id: user.id}
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
