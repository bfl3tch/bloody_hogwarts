require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    @student1 = Student.create!(name: 'Harry Potter', age: 10, house: 'Gryffindor')
    @student2 = Student.create!(name: 'Cedric Diggory', age: 14, house: 'Hufflepuff')
    @student3 = Student.create!(name: 'Ron Weasley', age: 12, house: 'Gryffindor')
    @student4 = Student.create!(name: 'Hermoine Granger', age: 12, house: 'Gryffindor')
    @student5 = Student.create!(name: 'Draco Malfoy', age: 11, house: 'Slytherin')
    @student6 = Student.create!(name: 'Pansy Parkinson', age: 11, house: 'Slytherin')
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    describe '::average_age' do
      it 'determines the average age of all the students' do
        expect(Student.average_age).to eq(13)
      end
    end
  end
end
