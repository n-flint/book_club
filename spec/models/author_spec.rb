require 'rails_helper'

describe Author, type: :model do

  describe "relationships" do
    it {should have_many(:books)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "class methods" do
  end

  describe "instance methods" do
  end
end
