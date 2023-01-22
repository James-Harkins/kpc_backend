class Api::V1::CoursesController < ApplicationController
  def index
    if params[:api_key] == ENV["API_KEY"]
      courses = Course.all
      render json: CourseSerializer.new(courses), status: 200
    end
  end

  def create
    if params[:api_key] == ENV["API_KEY"]
      course = Course.create!(course_params)
      render json: CourseSerializer.new(course), status: 201
    end
  end

  private

  def course_params
    params.permit(:name, :address, :city, :state, :zipcode)
  end
end
