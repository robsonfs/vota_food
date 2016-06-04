require 'rails_helper'

RSpec.feature "Restaurante management", type: :feature do
	scenario "adds a new restaurante" do
		visit root_path
		expect{
			click_link 'Restaurantes'
			click_link 'New'
			fill_in 'Nome', with: 'Ponto da Picanha'
			fill_in 'Especialidade', with: 'Churrasco'
			click_button 'Create Restaurante'
		}.to change(Restaurante, :count).by(1)
		expect(page).to have_current_path(restaurante_path(Restaurante.last))
		expect(page).to have_content("Restaurante was successfully created.")
		end

    # scenario "adds a new cliente" do
  	# 	visit clientes_path
  	# 	expect{
  	# 		click_link 'Clientes'
  	# 		click_link 'New'
  	# 		fill_in 'Nome', with: 'Ponto da Picanha'
  	# 		fill_in 'Especialidade', with: 'Churrasco'
  	# 		click_button 'Create Restaurante'
  	# 	}.to change(Restaurante, :count).by(1)
  	# 	expect(page).to have_current_path(restaurante_path(Restaurante.last))
  	# 	expect(page).to have_content("Restaurante was successfully created.")
  	# 	end
	end
