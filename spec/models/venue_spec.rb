require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe ".validate" do
    it "should present a name, full_address and region_id" do
      FactoryGirl.build(:venue, :name => "", :full_address => "", :region_id => "").should_not be_valid
    end
  end
end
