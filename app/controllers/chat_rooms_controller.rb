class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
    respond_to do |format|
      format.html
    end
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = "Chat room saved"
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id]).destroy
    flash[:success] = "Chat room is deleted"
    redirect_to chat_rooms_path
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end