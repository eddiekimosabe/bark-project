module DogsHelper

	def dog_ad(dog_iteration) 
		# since iteration starts from 0 we're gonna need the ad to appear at every odd index to have it display after ever 2nd dog image
		image_tag "ad.jpg", class: "dog-ad-image" if dog_iteration.index.odd? && dog_iteration.index != 0
	end

	def dog_like_unlike(dog)
		if current_user
			pre_like = dog.likes.find {|like| like.user_id == current_user.id}
			if pre_like
				link_to 'Unlike', dog_like_path(dog.id, pre_like), method: :delete, remote: true, class: "dog-unlike"
			else
				link_to 'Like', dog_likes_path(dog.id), method: :post, remote: true, class: "dog-like"
			end
		end
	end

	def dog_like_count(dog)
		"#{dog.likes.count} #{(dog.likes.count) == 1 ? 'Like' : 'Likes'}"
	end

	def owner?(dog)
		# if there's someone signed in and dog has an owner and current_user is the dog owner
		# we can probably expand on method to make it not only owner but administrator
		current_user &&  dog.owner && current_user == dog.owner
	end
end
