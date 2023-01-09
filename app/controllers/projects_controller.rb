class ProjectsController < ApplicationController

    def index
        @projects = current_user.projects
    end

    def new
        @project = Project.new
        @milestone = Milestone.new
    end

    def create
        @project = Project.new(project_params)
        clients = project_params[:user_ids].reject!(&:empty?)
        assign_users_to_projects(@project, clients)
        if @project.save!
            redirect_to root_path
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.update(project_params)
        clients = project_params[:user_ids].reject!(&:empty?)
        update_users_from_projects(@project, clients)
        redirect_to root_path
    end

    private

    def update_users_from_projects(project, clients)
        clients.each do |client|
            UserProject.update(user: User.find(client), project: project)
        end
    end

    def assign_users_to_projects(project, clients)
        user_project = UserProject.create(user: current_user, project: project)
        clients.each do |client|
            UserProject.create(user: User.find(client), project: project)
        end
    end

    def project_params
        params.require(:project).permit(:name, :description, user_ids: []) 
    end
end
