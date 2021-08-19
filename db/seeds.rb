# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new(":spinner Cadastrando moedas... ", format: :classic)
spinner.auto_spin

coins =	[
	  { 
	  	description: "Bitcoin",
	  	acronym: "BTC",
	  	url_image: "https://w7.pngwing.com/pngs/450/133/png-transparent-bitcoin-cryptocurrency-virtual-currency-decal-blockchain-info-bitcoin-text-trademark-logo.png"
	  },
	  { 
	  	description: "Ethereum",
	  	acronym: "ETH",
	  	url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
	  },
	  { 
	  	description: "Dash",
	  	acronym: "DASH",
	  	url_image: "https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png"
	  }
	]

coins.each do |coin|
	Coin.find_or_create_by!(coin)
end

spinner.success("Moedas cadastradas com sucesso!")