class NotesController < ApplicationController
  before_action :set_restaurant
  def create
    @note = Note.new(note_params)
    @note.restaurant = @restaurant
    @note.save
    authorize @note
    redirect_to '/dashboard/#notes'
  end

  def destroy
    @note = Note.find(params[:id])
    if @note
      @note.destroy
      authorize @note
      redirect_to '/dashboard/#notes'
    else
      render(redirect_to '/dashboard/#notes')
    end
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurant
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
