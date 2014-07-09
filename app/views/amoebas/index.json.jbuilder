json.array!(@amoebas) do |amoeba|
  json.extract! amoeba, :id, :name, :generation, :talent_id
  json.url amoeba_url(amoeba, format: :json)
end
