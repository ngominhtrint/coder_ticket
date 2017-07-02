require 'rails_helper'

RSpec.describe "routing to /", type: 'routing' do
  it "should go to home#index" do
    expect(get: "/").to route_to(controller: "events", action: "index")
  end
end