class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @student = Student.find(params[:student_id])
    @teacher = Teacher.find(@student.teacher_id)
    @log = @student.logs.find(params[:id])
  end

  # GET /logs/new
  def new
    @student = Student.find(params[:student_id])
    @log = @student.logs.new
  end

  # GET /logs/1/edit
  def edit
    @student = Student.find(params[:student_id])
    @log = @student.logs.find(params[:id])
  end

  # POST /logs
  # POST /logs.json
  def create
    @student = Student.find(params[:student_id])
    @log = @student.logs.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to teacher_student_path(@student.teacher_id, @student), notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    @student = Student.find(params[:student_id])
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to student_log_path(@student, @log), notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @student = Student.find(params[:student_id])
    @teacher = Teacher.find(@student.teacher_id)
    @log.destroy
    respond_to do |format|
      format.html { redirect_to teacher_student_path(@teacher, @student), notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:teacher_id, :studentId, :comment)
    end
end
