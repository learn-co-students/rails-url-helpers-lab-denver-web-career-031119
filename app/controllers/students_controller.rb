class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
    status = Student.find(params[:id]).active
    if status
      @active_status = 'active'
    else
      @active_status = 'inactive'
    end
  end

  def activate
    @student = Student.find(params[:id])
     if @student.active
       @student.update(:active => false)
     else
       @student.update(:active => true)
     end
    redirect_to student_path(@student), status: 301
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
