class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @teacher = Teacher.find(params[:teacher_id])
  end

  # GET /students/1
  # GET /students/1.json
  def show
    
    @teacher = Teacher.find(params[:teacher_id])
    @logs = @student.logs.order("created_at DESC").all
  end

  # GET /students/new
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.new
  end

  # GET /students/1/edit
  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to teacher_student_path(@teacher, @student), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
    
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to teacher_student_path(@teacher, @student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @student.destroy
    respond_to do |format|
      format.html { redirect_to teacher_path(@teacher), notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :teacher_id)
    end
end
