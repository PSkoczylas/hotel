require 'rails_helper'

describe RoomsController do
  render_views
  
  let!(:user) { create(:user) }
  let!(:room1) { create(:room, room_number: 1) }
  let!(:room2) { create(:room, room_number: 2, quantity_of_beds: 3) }
  let!(:room3) { create(:room, room_number: 3, floor: 2) }
  let!(:room4) { create(:room, room_number: 10, floor: 3) }


  before(:each) do
    sign_in user
  end


  describe "GET #index" do
    it "respnds successfuly HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "loads all of the posts into @rooms" do
      get :index 
      assigns(:rooms).should eq([room1, room2, room3, room4])
    end
  end


  describe "GET #new" do
    it "responds successfuly HTTP 200 status code" do
      get :new, format: :html
      response.status.should eq(200)
    end
  end

  describe "DELETE #destroy" do
    it "responds successfuly HTTP 200 status code" do
      delete :destroy, format: :html, params: { id: room3.id }
      response.status.should eq(302)
    end

    it "deletes given element" do
      get :index
      assigns(:rooms).should eq([room1, room2, room3, room4])
      delete :destroy, format: :html, params: { id: room2.id }
      get :index
      assigns(:rooms).should eq([room1, room3, room4])
    end
  end

  describe "GET #edit" do
    it "responds successfuly HTTP 200 status code" do
      get :edit, format: :html, params: { id: room1.id }
      response.status.should eq(200)
    end
  end
end
