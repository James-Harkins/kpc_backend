class Api::V1::CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: CourseSerializer.new(courses), status: 200
  end

  def create
    course = Course.create!(course_params)
    render json: CourseSerializer.new(course), status: 201
  end

  private

  def course_params
    params.permit(:name, :address, :city, :state, :zipcode)
  end
end
