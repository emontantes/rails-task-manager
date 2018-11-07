class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def create
    # POST /tasks
    # Create a task in the DB
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def new
    # GET /tasks/new
    # Render a form
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    # GET /tasks/:id/edit
    # Render a form for edditing
    @task = Task.find(params[:id])
  end

  def update
    # PATCH /tasks/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # DELETE /tasks/:id
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@tasks)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
