class SessionsController < ApplicationController

    def new 
        binding.pry 
        if logged_in? 
            redirect_to root_path 
        end 
    end 

    def create 
        if params[:name].blank?
            redirect_to login_path 
        else 
            session[:name] = params[:name]
            redirect_to root_path 
        end 
    end 

    def destroy 
        session.delete :name 
        redirect_to login_path 
    end 

    private 

    def logged_in? 
        session[:name].nil?
    end 
end
