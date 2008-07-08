class ChangePasswordsController < ApplicationController
  def index
    @record = User.find(session[:user_id])
    @record.passwd = nil
    params = { :action => 'show' }
    params[:layout] = false if request.xhr?
    respond_to do |format|
      format.js { render :action => 'index.rjs' }
      format.html { render :action => 'index' }
    end
  end
  alias_method :show, :index

  def update
    @record = User.find(session[:user_id])
    respond_to do |format|
      if @record.update_attributes(params[:user])
        format.js { render :action => 'update.rjs' }
        format.xml  { head :ok }
      else
        format.js { render :partial => "shared/errors.rjs" }
        format.xml  { render :xml => @record.errors, :status => :unprocessable_entity }
      end
    end
  end
end