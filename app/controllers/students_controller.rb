class StudentsController < ApplicationController
  def index
    @students = Student.all.alphabatize
    
  end

  def show
    @student = Student.find(params[:id])
  end
end
