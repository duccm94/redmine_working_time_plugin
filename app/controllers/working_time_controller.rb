class WorkingTimeController < ApplicationController
  unloadable

  def index
    @project = Project.find params[:project_id]
    @users = @project.users
    start_date = @project.start_date
    end_date = @project.due_date || Date.today
    @period = start_date..end_date
    @table = []
    @users.each do |u|
      row = [u]
      @period.each do |d|
        row << TimeEntry.where(project_id: @project.id, user_id: u.id, spent_on: d.to_s).sum(:hours)
      end
      @table << row
    end
  end
end
