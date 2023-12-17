class Admins::JobEntriesController < Admins::ApplicationController

  def index
    @q = JobEntry.ransack(params[:q])
    @job_entries = @q.result(distinct: true).page(params[:page])
    session[:job_entries_index_url] = request.url
  end

  private

  def job_entry_params
    params.require(:job_entry).permit(:recruit_type, :name, :name_kana, :phone_number, :email, :birth_date, :sex, :city_name, :address, :status, :prefecture_id).merge(update_by: current_admin.id)
  end
end
