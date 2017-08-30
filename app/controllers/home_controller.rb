class HomeController < ApplicationController
    def index
    end
    
    def create
        # @post 는 db의 일부분, @를 사용해서 전역변수로 만들어 준것임
        @post = Post.new
        @post.title = params[:title_of_post] # post의 title이라는 공간에 name이 title_of_post로 지정되어있는 것을 저장하겠다.
        @post.content = params[:content_of_post]
        @post.save
        redirect_to '/home/read'
    end
    
    def read # read란 메소드 안에는 post에 대한 정보 다 가지고 있음
        @post = Post.all #post라는 db에서 전부다 가져와라 
    end
    
    def update
        @post = Post.find(params[:id])
    end
    
    def delete
        @post = Post.find(params[:id])
        # id 값을 찾아가지구 post에다 넣어줘라
        @post.destroy
        # 삭제할 때 
        redirect_to :back
    end
    
    def edit
        @post = Post.find(params[:id])
        @post.title = params[:title_of_post]
        @post.content = params[:content_of_post]
        @post.save
        
        redirect_to '/home/read'
    end
end

# 메서드는 한개당 한개의 기능을 하는데 edit이랑 update에 둘다 만들어 줬을까 find id를 !
# 글 목록 -> 수정 btn ( id를 가지고서 넘어감 def update를 해가지고 ) ->  update.html -> 수정된 정보들을 저장하는 역할 을 하는 edit으로 넘어감
