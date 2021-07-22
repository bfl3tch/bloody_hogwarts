class CoursesController < ApplicationController
  def index
    @courses = Course.all.alphabatize
  end
end
