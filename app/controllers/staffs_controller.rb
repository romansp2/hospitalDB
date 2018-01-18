class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def new
    @page_title = "Добавление сотрудника"
    @staff = Staff.new
    @hospitals = Hospital.all
  end



  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      flash[:notice] = "Сотрудник добавлен"
      redirect_to staffs_index_path

    else
      flash[:alert] = @staff.errors.full_messages
      redirect_to staffs_new_path
    end

  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    flash[:notice] = "Сотрудник удален"
    redirect_to staffs_index_path
  end

  def edit
    @hospitals = Hospital.all
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])

    if @staff.update(staff_params)
      flash[:notice] = "Информация о сотруднике изменена"
      redirect_to staff_path(@staff)
    else
      flash[:alert] = @staff.errors.full_messages
      redirect_to edit_staff_path
    end

  end

  def show
    @staff = Staff.find(params[:id])
    @hospitals = @staff.hospitals
  end
  private

  def staff_params
      params.require(:staff).permit(:sname, :bday, :position)

    end

end
