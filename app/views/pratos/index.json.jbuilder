json.array!(@pratos) do |prato|
  json.extract! prato, :id, :nome, :restaurante_id
  json.url prato_url(prato, format: :json)
end
