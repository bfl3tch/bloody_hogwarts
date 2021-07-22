require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'class methods' do
    before(:each) do
      @course1 = Course.create!(name: 'Potions')
      @course2 = Course.create!(name: 'Defense Against the Dark Arts')
      @course3 = Course.create!(name: 'Charms')
      @course4 = Course.create!(name: 'Transfiguration')
      @course5 = Course.create!(name: 'History of Magic')
    end

    describe "::alphabatize" do
      it 'orders the courses in alphabetical order' do
        expected = [@course3, @course2, @course5, @course1, @course4]
        expect(Course.alphabatize).to eq(expected)
      end
    end
  end

end
