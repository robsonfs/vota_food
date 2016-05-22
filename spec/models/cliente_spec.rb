require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it "Is valid with a nome and data_nascimento" do
    expect(FactoryGirl.build(:cliente)).to be_valid
  end
  it "Is invalid witout a nome" do
    cliente = FactoryGirl.build(:cliente, nome: nil)
    cliente.valid?
    expect(cliente.errors[:nome]).to include("deve ser preenchido")
  end
  it "Is invalid witout a data_nasimento"
  it "Invalid when data_nascimento is before 31/12/1999"
  it "Is valid when data_nascimento is after 31/12/1999"

  describe "It can filter name by letter" do
    before :each do
      @robson = Cliente.create(
        nome: "Robson", data_nascimento: Data.new(2016,1,1)
      )
      @marian = Cliente.create(
        nome: "Maria", data_nascimento: Data.new(2016,1,5)
      )
      @marcelo = Cliente.create(
        nome: "Marcelo", data_nascimento: Data.new(2016,4,1)
      )
    end

    context "matching letter" do
      it "returns array of results thath match" do
        expect(Cliente.filtra_por_letra("R")).to eq [@robson]
      end
    end

    context "non matching letter" do
      it "omit results that don’t match" do
        expect(Cliente.filtra_por_letra("M")).not_to include @robson
      end
    end
  end
end
