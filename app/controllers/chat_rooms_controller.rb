class ChatRoomsController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user)
    @chat_rooms = ChatRoom.all
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

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @chat_rooms = ChatRoom.all
    @users = User.all.where.not(id: current_user)
    @message = Message.new
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