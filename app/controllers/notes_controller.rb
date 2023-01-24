class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.restaurant = current_user.restaurant
    @note.save
    authorize @note
    redirect_to '/dashboard'
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
