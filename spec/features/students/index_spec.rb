require 'rails_helper'

RSpec.describe 'The students index page' do
  before(:each) do
    @student1 = Student.create!(name: 'Harry Potter', age: 11, house: 'Gryffindor')
    @student2 = Student.create!(name: 'Cedric Diggory', age: 14, house: 'Hufflepuff')
    @student3 = Student.create!(name: 'Ron Weasley', age: 11, house: 'Gryffindor')
    @student4 = Student.create!(name: 'Hermoine Granger', age: 11, house: 'Gryffindor')
    @student5 = Student.create!(name: 'Draco Malfoy', age: 11, house: 'Slytherin')
    @student6 = Student.create!(name: 'Pansy Parkinson', age: 11, house: 'Slytherin')
    visit '/students'
  end

  it 'lists all the students and their attributes' do
    expect(page).to have_content(@student1.name)
    expect(page).to have_content(@student4.age)
    expect(page).to have_content(@student6.house)
  end

  it 'lists the average age of all the students' do
    expect(page).to have_content("Average student age: 13")
  end

  it 'orders the students alphabetically by first name' do
    expect(@student2.name).to appear_before(@student5.name)
    expect(@student5.name).to appear_before(@student1.name)
    expect(@student1.name).to appear_before(@student4.name)
    expect(@student4.name).to appear_before(@student6.name)
    expect(@student6.name).to appear_before(@student3.name)
  end
end
