# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Initial Roles
Role.create(name: 'player')
Role.create(name: 'seller')

# Initial Game Formats
GameFormat.create(name: 'modern')
GameFormat.create(name: 'commander')
GameFormat.create(name: 'oathbreaker')

# Initial Users
User.create_account(email: 'daniel@email.com', nickname: 'daniel', password: '12345678')
User.create_account(email: 'anthony@email.com', nickname: 'anthony', password: '12345678')
User.create_account(email: 'mark@email.com', nickname: 'mark', password: '12345678')
User.create_account(email: 'john@email.com', nickname: 'john', password: '12345678')
User.create_account(email: 'vivian@email.com', nickname: 'vivian', password: '12345678')
User.create_account(email: 'ronaldo@email.com', nickname: 'ronaldo', password: '12345678')

# Initial Decks for Daniel
user = User.find(1)
user.decks.create(
	name: 'golgari aggro', 
	cards: [[15, 'Forest'],[13, 'Swamp'],[4, 'Elvish Pipper'],
					[4, 'Golgari Charm'],[4, 'Murder'],[4, 'Lotus Cobra'],
					[4, 'Tainted Strike'],[4, 'Reanimate Dead'],[4, 'Swamplord'],
					[4, 'Doom Blade'],[4, 'Zombie'],[4, 'Snake']],
	game_format_id: 1)

user.decks.create(
	name: 'simic toxic', 
	cards: [[1, 'Boseiju,Who Ednures'],[3, 'Dreamroot Cascade'],[3, 'Forest'],
					[5, 'Island'],[2, 'Mirrex'],[3, 'Sparas Headquarters'],
					[4, 'Yavimaya Coast'],[4, 'Delver of Secrets'],[4, 'Venerated Rotpriest'],
					[3, 'Stormchaser Drake'],[2, 'Bloated Contaminator'],[1, 'March of Burgeoning Life'],
					[4, 'March of Swirling Mist'],[4, 'Slip Out the Back'],[1, 'Thirsting Roots'],
					[4, 'Timely Interference'],[4, 'Tyvars Stand']],
	game_format_id: 1)

# Initial Deck for Anthony
user2 = User.find(2)
user2.decks.create(
	name: 'soul sisters',
	cards: [[4, 'Flooded Strand'],[16, 'Plains'],[4, 'Path to Exile'],
					[2, 'Gather the Townsfolk'],[4, 'Oblivion Ring'],[4, 'Ajanis Pridemate'],
					[2, 'Archangel of Thune'],[4, 'Champion of the Parish'],[4, 'Fiend Hunter'],
					[4, 'Knight of the White Orchid'],[4, 'Restoration Angel'],[4, 'Soul Warden'],
					[4, 'Soul Attendant']], 
	game_format_id: 1)

# Initial Deck for Mark
user3 = User.find(3)
user3.decks.create(
	name: 'golgari combo', 
	cards: [[4, 'Blooming Marsh'],[4, 'Overgrown Tomb'],[12, 'Forest'],
					[4, 'Elvish Mysthic'],[4, 'Lnowar Elves'],[3, 'Acererak the Archlich'],
					[4, 'Gwenna,Eyes of Gaea'],[3, 'Rhonas the Indomitable'],[4, 'Shakedown Heavy'],
					[4, 'Steel Leaf Champion'],[2, 'Traxos,Scourge of Kroog'],[2, 'Tyvar,Jubilant Brawler'],
					[4, 'Collected Company'],[3, 'Bontus Monument'],[3, 'Relic of Legends']],
	game_format_id: 1)

# Daniel Hosting an Event
user.events.create(
  title: 'Modern Tournament',
  description: 'competitive tourney',
  schedule: 'Wed, 10 May 2023',
  game_format_id: 1)
