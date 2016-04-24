json.array!(@services) do |service|
  json.extract! service, :id, :title, :title_seo, :price, :due_date, :youtube_url, :category, :sub_category, :description, :refund, :status
  json.url service_url(service, format: :json)
end
