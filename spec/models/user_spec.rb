require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do 
      it "should return a string" do
        expect(@user.email).to be_a(String)
      end
    end

    describe "#encrypted_password" do 
      it "should return a string" do
        expect(@user.encrypted_password).to be_a(String)
      end
    end

    describe "#first_name" do 
      it "should return a string" do
        expect(@user.first_name).to be_a(String)
      end
    end

    describe "#last_name" do 
      it "should return a string" do
        expect(@user.last_name).to be_a(String)
      end
    end

    describe "#description" do 
      it "should return a string" do
        expect(@user.description).to be_a(String)
      end
    end

  end

  context "associations" do

    describe "attendances" do
      it { should have_many(:attended_events).through(:attendances) } #shoulda-gem needed
      #it "should have_many attendances" do
      #  attendance = FactoryBot.create(:attendance)
      #  attendance.update(attendee: @user)
      #  expect(@user.attendances.include?(attendance)).to eq(true)
      #end
    end

    describe "events" do
      it "should have_many events" do
        event = FactoryBot.create(:event)
        event.update(administrator: @user)
        expect(@user.administrated_events.include?(event)).to eq(true)
      end
    end

  end

end