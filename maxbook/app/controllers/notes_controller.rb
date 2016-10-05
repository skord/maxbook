class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person
  def index
    @new_note = @person.notes.new
    @notes = @person.notes.order('created_at DESC')
  end

  def create
    if @person.notes.create!(note_params)
      redirect_to person_notes_path
    end
  end

  def destroy
    if @person.notes.find(params[:id]).destroy
      redirect_to person_notes_path
    end
  end

  private

  def set_person
    @person = current_user.people.find(params[:person_id])
  end

  def note_params
    params.require(:note).permit(:note)
  end
end
