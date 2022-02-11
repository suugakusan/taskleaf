class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)
    if params[:back].present?
      render :new
      return
    end
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end     
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

  def task_params
    params.require(:task).permit(:name,:description)
  end
end
