require 'rails_helper'

RSpec.describe 'The student show page' do
  before(:each) do
    @student1 = Student.create!(name: 'Harry Potter', age: 11, house: 'Gryffindor')
    @student2 = Student.create!(name: 'Cedric Diggory', age: 14, house: 'Hufflepuff')
    @student3 = Student.create!(name: 'Ron Weasley', age: 11, house: 'Gryffindor')
    @student4 = Student.create!(name: 'Hermoine Granger', age: 11, house: 'Gryffindor')
    @student5 = Student.create!(name: 'Draco Malfoy', age: 11, house: 'Slytherin')
    @student6 = Student.create!(name: 'Pansy Parkinson', age: 11, house: 'Slytherin')

    @course1 = Course.create!(name: 'Potions')
    @course2 = Course.create!(name: 'Defense Against the Dark Arts')
    @course3 = Course.create!(name: 'Charms')
    @course4 = Course.create!(name: 'Transfiguration')
    @course5 = Course.create!(name: 'History of Magic')

    @student_course1 = StudentCourse.create!(student: @student1, course: @course1)
    @student_course2 = StudentCourse.create!(student: @student1, course: @course2)
    @student_course3 = StudentCourse.create!(student: @student2, course: @course1)
    @student_course4 = StudentCourse.create!(student: @student2, course: @course3)
    @student_course5 = StudentCourse.create!(student: @student3, course: @course4)
    @student_course6 = StudentCourse.create!(student: @student4, course: @course5)
    @student_course7 = StudentCourse.create!(student: @student4, course: @course1)
    @student_course8 = StudentCourse.create!(student: @student5, course: @course5)
    @student_course9 = StudentCourse.create!(student: @student5, course: @course4)
    @student_course10 = StudentCourse.create!(student: @student6, course: @course2)
    visit "/students/#{@student1.id}"
  end
  it 'lists all of that students courses and no other courses nor other students' do
    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course2.name)
    expect(page).to_not have_content(@course3.name)
    expect(page).to_not have_content(@course5.name)
    expect(page).to_not have_content(@student2.name)
  end
end
