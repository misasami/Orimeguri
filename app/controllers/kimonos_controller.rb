class KimonosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:search].nil? || params[:search].empty?
      @kimonos = Kimono.all
    else
      search = params[:search]
      genre = params[:genre] # 追加: ジャンルの取得
      @kimonos = Kimono.joins(:user).where("kimonos.about LIKE ? OR kimonos.name LIKE ?", "%#{search}%", "%#{search}%")
      @kimonos = @kimonos.where(genre: genre) if genre.present? # 追加: ジャンルが指定されていれば絞り込む
    end
  end

  def new
    @kimonos = Kimono.new
  end

  def create
    @kimonos = Kimono.new(kimono_params)
    @kimonos.user_id = current_user.id
    if @kimonos.save
      redirect_to kimonos_path
    else
      render :new
    end
  end

  def show
    @kimonos = Kimono.find(params[:id])
  end

  private

  def kimono_params
    params.require(:kimono).permit(:name, :about, :genre, :image :body,:lat,:lng)
  end

  def bookmark
  end

end

