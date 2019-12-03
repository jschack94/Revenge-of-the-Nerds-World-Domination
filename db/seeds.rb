#player_id, npc_id, player_win, match_id
battles_list = [
    [1, 1, NULL, 1],
    [1, 2, NULL, 1],
    [1, 3, NULL, 1]
]

# battle_1, battle_2, battle_3, battle_4, battle_5
matches_list = [
    [NULL, NULL, NULL, NULL, NULL],
    [NULL, NULL, NULL, NULL, NULL],
    [NULL, NULL, NULL, NULL, NULL]
] # Maybe add an id to match the boss/villain at that level per match (set of battles)

# Npc.create(name: "blop", species: "unshaped", npc_species_id: 1 )
# name, species, npc_species_id
npc_list = [
    ["Chad", "Bully", 1],
    ["Mrs. Karen", "Teacher", 2]
    ["'Mom'", "Evil Step-Mother", 3]
]

# Npc_specie.create(hp: 10, iq: , str:, lk:, npc_attack:, npc_defense: , ult:  )
#hp, iq, str, lk, npc_attack, npc_defense, ult
npc_species_list = [
    [8, 2, 10, 4, "Wedgie", "'It's just a joke, bro'", " "],
    [10, 10, 4, 2, "Ruler Smack", "'Well I never'", "Detention!"],
    [12, 6, 5, 8, "Chancla!", "'Because I said so!'", "Bring me your manager!"]
] #[24, 26, 34]

# attack, defense, wildcard, player_id
player_moves_list = [
    ["Lab Expiriment", "Fetal Position", "I'm rubber, and you're glue!"]
]

# name, hp, iq, str, lk
player_list = [
    [NULL, 8, 9, 4, 3]
] #[24] + 8 = [32] (plus one per boss defeated) Consider adding species column that says NERD









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