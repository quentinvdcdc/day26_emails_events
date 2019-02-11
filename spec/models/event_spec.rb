require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @event = FactoryBot.create(:event)
    @user = FactoryBot.create(:user)
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end


    describe "#start_date" do
      it "should not be valid without start_date" do
        bad_event = Event.create(duration: 35, administrator: @user, title: "super event", description: "cool cool cool cool super event", price: 34, location: "Atlanta")
        expect(bad_event).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_event.errors.include?(:start_date)).to eq(true)
      end
    end

    describe "#duration" do
      it "should not be valid without duration being modulo five" do
        invalid_user = FactoryBot.build(:event, duration: 34)
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:duration)).to eq(true)
      end
    end

    describe "#title" do
      it "should not be lower that 5 characters" do
        invalid_user = FactoryBot.build(:event, title: "cool")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:title)).to eq(true)
      end
    end

    describe "#description" do
      it "should not be lower that 20 characters" do
        invalid_user = FactoryBot.build(:event, description: "cool world")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:description)).to eq(true)
      end
    end

    describe "#location" do 
      it "should return a string" do
        expect(@event.location).to be_a(String)
      end
    end

  end

  context "associations" do

    describe "attendances" do
      it "should have_many attendances" do
        attendance = FactoryBot.create(:attendance)
        attendance.update(event: @event)
        expect(@event.attendances.include?(attendance)).to eq(true)
      end
    end

  end



  context "public instance methods" do

    #describe "#full_name" do

    #  it "should return a string" do
    #    expect(@event.full_name).to be_a(String)
    #  end

    #  it "should return the full name" do
    #    user_1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe")
    #    expect(user_1.full_name).to eq("John Doe")
    #    user_2 = User.create(first_name: "Jean-Michel", last_name: "Durant", username: "kikou_du_75")
    #    expect(user_2.full_name).to eq("Jean-Michel Durant")
    #  end
    #end

  end

end