module UsersHelper
    def user_has_no_posts
        @user = User.find(params[:id])
        
        if @user.posts.count == 0
            return true
        else 
            return false
        end
    end
    
    def user_has_no_comments
        @user = User.find(params[:id])
        
        if @user.comments.count == 0
            return true
        else 
            return false
        end
    end
    
    def user_favorites(user)
        Favorite.where(user_id: user.id)
    end
end
