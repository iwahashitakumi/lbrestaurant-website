class Admins::JobEntriesController < Admins::ApplicationController

  def index
    @q = JobEntry.ransack(params[:q])
    @job_entries = @q.result(distinct: true).page(params[:page])
    @search_residence_scope = :prefecture_name_or_city_name_or_address_cont
    session[:job_entries_index_url] = request.url
  end

  def show
    @job_entries_index_url = session[:job_entries_index_url]
    @job_entry = JobEntry.find(params[:id])
  end

  def update
    @job_entries_index_url = session[:job_entries_index_url]
    @job_entry = JobEntry.find(params[:id])
    begin
      @job_entry.update!(job_entry_params)
      redirect_to @job_entries_index_url, notice: "#{@job_entry.name}の対応状況を変更しました"
    rescue
      flash.now[:alert] = "#{@job_entry.name}の対応状況を変更できませんでした"
      render 'show'
    end
  end

  private

  def job_entry_params
    params.require(:job_entry).permit(:recruit_type, :name, :name_kana, :phone_number, :email, :birth_date, :sex, :city_name, :address, :status, :prefecture_id).merge(update_by: current_admin.id)
  end
end
