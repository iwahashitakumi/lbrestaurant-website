class Admins::JobEntriesController < Admins::ApplicationController


  private

  def job_entry_params
    params.require(:job_entry).permit(:recruit_type, :name, :name_kana, :phone_number, :email, :birth_date, :sex, :city_name, :address, :status, :prefecture_id).merge(update_by: current_admin.id)
  end
end
