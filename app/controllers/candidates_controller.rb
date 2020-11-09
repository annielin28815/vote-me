class CandidatesController < ApplicationController
  
  before_action :find_candidate,only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end


  def show
  end


  def new
    @candidate = Candidate.new
  end
  

  def create

    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      # flash是一種快閃訊息，只會被印出一次。是常用的提醒功能！
      # flash[:notice] = "Candidate created!"
      redirect_to '/candidates', notice: 'Candidate created!'
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @candidate.update(candidate_params)
      redirect_to '/candidates', notice: 'Candidate updated!'
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to '/candidates', notice: 'Candidate deleted!'
  end

  def vote
    # 順序分別是：抓到、更新(a = a+ 1)、儲存

    # 從候選人的投票紀錄建立一筆資料，建立候選人的投票紀錄、ip位置等
    # 物件的request.remote_ip方法參考自：https://stackoverflow.com/questions/4465476/rails-get-client-ip-address
    @candidate.vote_logs.create(ip_address: request.remote_ip)

    redirect_to '/candidates', notice: 'Candidate voted!'
  end



  # 因為只有在某些方法裡會使用到，不需被外部使用，所以加上private，變成一個私有方法。
  private
   # 清洗：只允許candidate這包裡的name, party, age, politics可以進來。
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end
  

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end

end