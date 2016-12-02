require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

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
    xit "returns the new template" do
      get :create
      expect(response).to render_template("create")
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
