class Article < ActiveRecord::Base
  belongs_to :category, required: true
  attr_accessor :title, :body

  validates :title, presence: true
  validates :body, presence: true
  validates :category, null: false
  before_create :create_mongo_collections

  def fetch_mongo
    self.title = Content.find(title_oid).body
    self.body = Content.find(body_oid).body
  end

  private

  def create_mongo_collections
    self.title_oid = Content.create!(body: title, type: 'article_title').id
    self.body_oid = Content.create!(body: body, type: 'article_body').id
  end
end
