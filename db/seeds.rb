ActiveRecord::Base.logger = Logger.new(STDOUT)

#player_id, npc_id, player_win, match_id
battles_list = [
    [1, 1, nil, 1],
    [1, 2, nil, 1],
    [1, 3, nil, 1]
]
battles_list.each do |player_id, npc_id, player_win, match_id|
    Battle.create(player_id: player_id, npc_id: npc_id, player_win: player_win, match_id: match_id)
end

# battle_1, battle_2, battle_3, battle_4, battle_5
matches_list = [
    [nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil]
] # Maybe add an id to match the boss/villain at that level per match (set of battles)
matches_list.each do |battle_1, battle_2, battle_3, battle_4, battle_5|
    Match.create(battle_1: battle_1, battle_2: battle_2, battle_3: battle_3, battle_4: battle_4, battle_5: battle_5)
end

# Npc.create(name: "blop", species: "unshaped", npc_species_id: 1 )
# name, species, npc_species_id
npc_list = [
    ["Chad", "Bully", 1],
    ["Mrs. Karen", "Teacher", 2],
    ["'Mom'", "Evil Step-Mother", 3]
]
npc_list.each do |name, species, npc_species_id|
    Npc.create(name: name, species: species, npc_species_id: npc_species_id)
end

# Npc_specie.create(hp: 10, iq: , str:, lk:, npc_attack:, npc_defense: , ult:  )
#hp, iq, str, lk, npc_attack, npc_defense, ult
npc_species_list = [
    [8, 2, 10, 4, "Wedgie", "'It's just a joke, bro'", " "],
    [10, 10, 4, 2, "Ruler Smack", "'Well I never'", "Detention!"],
    [12, 6, 5, 8, "Chancla!", "'Because I said so!'", "Bring me your manager!"]
] #[24, 26, 34]
npc_species_list.each do |hp, iq, str, lk, npc_attack, npc_defense, ult|
    NpcSpecie.create(hp: hp, iq: iq, str: str, lk: lk, npc_attack: npc_attack, npc_defense: npc_defense, ult: ult)
end

# attack, defense, wildcard, player_id
player_moves_list = [
    ["Lab Expiriment", "Fetal Position", "I'm rubber, and you're glue!"]
]
player_moves_list.each do |attack, defense, wildcard, player_id|
    PlayerMove.create(attack: attack, defense: defense, wildcard: wildcard, player_id: player_id)
end

# name, species, hp, iq, str, lk
player_list = [
    [nil,"NERD", 8, 9, 4, 3]
] #[24] + 8 = [32] (plus one per boss defeated) Consider adding species column that says NERD
player_list.each do |name, species, hp, iq, str, lk|
    Player.create(name: name, species: species, hp: hp, iq: iq, str: str, lk: lk)
end


# country_list = [
#     [ "Germany", 81831000 ],
#     [ "France", 65447374 ],
#     [ "Belgium", 10839905 ],
#     [ "Netherlands", 16680000 ]
#   ]


# Country.create(name: 'Germany', population: 81831000)
# Country.create(name: 'France', population: 65447374)
# Country.create(name: 'Belgium', population: 10839905)
# Country.create(name: 'Netherlands', population: 16680000)