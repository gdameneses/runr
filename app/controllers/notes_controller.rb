class NotesController < ApplicationController
  before_action :set_restaurant
  def create
    @note = Note.new(note_params)
    @note.restaurant = @restaurant
    @note.save
    authorize @note
    redirect_to dashboard_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    authorize @note
    render 'pages/dashboard'
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurant
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
