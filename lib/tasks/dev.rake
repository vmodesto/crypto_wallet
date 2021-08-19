namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  	if Rails.env.development?
  		show_spinner("Apagando banco de dados...") { %x(rails db:drop) }
  		show_spinner("Criando banco de dados...") { %x(rails db:create) }


  		show_spinner("Migrando banco de dados...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
  		%x(rails dev:add_coins)
  	else
  		puts "Você não está em ambiente de desenvolvimento"
  	end
  end

  desc "Criar moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas... ") do
      coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://w7.pngwing.com/pngs/450/133/png-transparent-bitcoin-cryptocurrency-virtual-currency-decal-blockchain-info-bitcoin-text-trademark-logo.png",
            mining_type: MiningType.find_by(acronym: 'PoW')
          },
          {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
            mining_type: MiningType.all.sample
          },
          {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png",
            mining_type: MiningType.all.sample
          }
        ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastrar tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração... ") do

      mining_types = [
        {
          description: "Proof of work",
          acronym: "PoW"
        },
        {
          description: "Proof of Stake",
          acronym: "PoS"
        },
        {
          description: "Proof of capacity",
          acronym: "PoC"
        }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new(":spinner #{msg_start}", format: :classic)
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
