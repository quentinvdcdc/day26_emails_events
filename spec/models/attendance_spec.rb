require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end

    describe "#stripe_customer_id" do 
      it "should return a string" do
        expect(@attendance.stripe_customer_id).to be_a(String)
      end
    end

  end

end