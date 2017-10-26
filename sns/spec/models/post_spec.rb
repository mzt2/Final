require 'rails_helper'

describe "#liked_by(user)" do

  context "when the post has been liked by user" do
    it "selects the post like" do
      user = create(:user)
      post = create(:post)
      post_like = create(:post_like, user_id: user.id, post_id: post.id)
      expect(post.liked_by(user)).to eq post_like
    end
  end

  context "when the post has not been liked by user" do
    it "cannot find the post like" do
      user = create(:user)
      post = create(:post)
      expect(post.liked_by(user)).to eq nil
    end
  end

end

describe ".on_timeline(user)" do

  context "with my posts" do
    it "shows on time line" do
      user = create(:user)
      post = create(:post, user_id: user.id)
      expect(Post.on_timeline(user)).to eq [post]
    end
  end

  context "with followee's posts" do
    it "shows on time line with privacy[0]" do
      followee = create(:user)
      follower = create(:user)
      relationship = create(:relationship, followee: followee, follower: follower)
      post = create(:post, user_id: followee.id)
      expect(Post.on_timeline(follower)).to eq [post]
    end
    it "shows on time line with privacy[1]" do
      followee = create(:user)
      follower = create(:user)
      relationship = create(:relationship, followee: followee, follower: follower)
      post = create(:post, user_id: followee.id, privacy: 1)
      expect(Post.on_timeline(follower)).to eq [post]
    end
    it "doesn't show on time line with privacy[2]" do
      followee = create(:user)
      follower = create(:user)
      relationship = create(:relationship, followee: followee, follower: follower)
      post = create(:post, user_id: followee.id, privacy: 2)
      expect(Post.on_timeline(follower)).to eq []
    end
  end

  context "with others' posts" do
    it "doesn't show on timeline" do
      user = create(:user)
      foreigner = create(:user)
      post = create(:post, user_id: foreigner.id)
      expect(Post.on_timeline(user)).to eq []
    end
  end

  it "shows my posts and followee's posts with privacy[0,1] and doesn't show other posts"do
    user = create(:user)
    followee = create(:user)
    foreigner = create(:user)
    relationship = create(:relationship, followee: followee, follower: user)
    post1 = create(:post, user_id: user.id, privacy: 0)
    post2 = create(:post, user_id: user.id, privacy: 1)
    post3 = create(:post, user_id: user.id, privacy: 2)
    post4 = create(:post, user_id: followee.id, privacy: 0)
    post5 = create(:post, user_id: followee.id, privacy: 1)
    post6 = create(:post, user_id: followee.id, privacy: 2)
    post7 = create(:post, user_id: foreigner.id, privacy: 0)
    post8 = create(:post, user_id: foreigner.id, privacy: 1)
    post9 = create(:post, user_id: foreigner.id, privacy: 2)
    expect(Post.on_timeline(user).to_a).to eq [post1, post2, post3, post4, post5]
  end

end
