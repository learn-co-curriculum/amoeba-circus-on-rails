json.array!(@acts) do |act|
  json.extract! act, :id, :name, :time, :date
  json.url act_url(act, format: :json)
end
