class_name GameConfig
extends Resource
## All tunable numbers in the game. Values live in res://config/game_config.tres
## (designer edits them in the Inspector). Code reads them via GameState.config.<field>.
## Rule: never hardcode a gameplay number in a script — add a field here.

@export_group("Okret (Tab)")
## Trajanje okreta kamere u sekundama. Igrač ovo radi stotine puta — drži kratko.
@export_range(0.1, 0.8, 0.05) var turn_duration: float = 0.3

@export_group("Novac")
## Početni novac pod klupom (= poker stack).
@export var starting_money: int = 100

@export_group("Poker (fixed limit)")
@export var small_blind: int = 1
@export var big_blind: int = 2class_name GameConfig
extends Resource
## All tunable numbers in the game. Values live in res://config/game_config.tres
## (designer edits them in the Inspector). Code reads them via GameState.config.<field>.
## Rule: never hardcode a gameplay number in a script — add a field here.

@export_group("Okret (Tab)")
## Trajanje okreta kamere u sekundama. Igrač ovo radi stotine puta — drži kratko.
@export_range(0.1, 0.8, 0.05) var turn_duration: float = 0.3

@export_group("Novac")
## Početni novac pod klupom (= poker stack).
@export var starting_money: int = 100

@export_group("Poker (fixed limit)")
@export var small_blind: int = 1
@export var big_blind: int = 2
## Bet/raise na preflopu i flopu.
@export var small_bet: int = 2
## Bet/raise na turnu i riveru.
@export var big_bet: int = 4
## Max broj beta po streetu (big blind se računa kao prvi preflop).
@export var max_bets_per_street: int = 4
## Pauza prije nego bot odigra (da izgleda ljudski).
@export_range(0.0, 3.0, 0.1) var bot_think_seconds: float = 0.8

@export_group("Varanje protivnika")
## Koliko sekundi igrač mora gledati ploču prije nego protivnik smije varati.
@export var cheat_min_turned_away_seconds: float = 2.0
## Šansa po sekundi okrenutosti da protivnik pokuša varati.
@export_range(0.0, 1.0, 0.01) var cheat_chance_per_second: float = 0.15
@export var max_cheats_per_hand: int = 1
## Koliko se špil pomakne nakon varanja (metri).
@export var deck_tell_offset: float = 0.02
## Nijansa špila nakon varanja. Alpha = jačina.
@export var deck_tell_tint: Color = Color(0.9, 0.85, 0.7, 0.15)

@export_group("Optužba LAŽ!")
## Bonus bodovi kad uhvatiš varanje (plus cijeli pot).
@export var accuse_correct_bonus: int = 25
## Kriva optužba: gubiš pot + ovoliko.
@export var accuse_wrong_penalty: int = 10

@export_group("Informant")
## Početni trust (0-1) = šansa da govori istinu.
@export_range(0.0, 1.0, 0.05) var informant_start_trust: float = 0.5
@export_range(0.0, 0.5, 0.05) var informant_trust_per_gift: float = 0.1
@export var informant_gift_cost: int = 15
## Šansa da informant nešto kaže tijekom ruke.
@export_range(0.0, 1.0, 0.05) var informant_talk_chance_per_hand: float = 0.4

@export_group("Profesorica")
## Rast sumnje po sekundi dok gledaš poker.
@export var teacher_suspicion_per_second: float = 0.12
## Pad sumnje po sekundi dok gledaš ploču.
@export var teacher_suspicion_decay_per_second: float = 0.2
## Pragovi faza 1, 2, 3 (3 = uhvaćen).
@export var teacher_stage_thresholds: Array[float] = [0.35, 0.65, 1.0]
## Gubitak ocjene kad te uhvati (0-1).
@export_range(0.0, 1.0, 0.05) var teacher_caught_grade_penalty: float = 0.2
## Dio novca koji zaplijeni (0-1).
@export_range(0.0, 1.0, 0.05) var teacher_caught_money_confiscation: float = 0.3

@export_group("Prepisivanje")
## Sekunde prije nego se tekst na ploči promijeni.
@export var board_text_duration: float = 25.0
@export var board_texts_per_lesson: int = 4
## Minimalna ocjena za prolaz (0-1).
@export_range(0.0, 1.0, 0.05) var passing_grade: float = 0.5
## c = č = ć itd.
@export var lenient_diacritics: bool = true
## Cijena da ti kolega da prepisati propušteni tekst.
@export var copy_from_neighbour_cost: int = 10

@export_group("Kolega lopov")
## Šansa po sekundi dok gledaš poker da uzme novce.
@export_range(0.0, 1.0, 0.01) var thief_chance_per_second: float = 0.05
## Koliki dio novca uzme (0-1).
@export_range(0.0, 1.0, 0.05) var thief_steal_fraction: float = 0.1
## Sekunde da ga uhvatiš nakon što se okreneš.
@export var thief_catch_window_seconds: float = 1.5

@export_group("Bodovanje")
## Bonus = ocjena (0-1) * ovaj broj.
@export var grade_bonus_multiplier: int = 100
## Bet/raise na preflopu i flopu.
@export var small_bet: int = 2
## Bet/raise na turnu i riveru.
@export var big_bet: int = 4
## Max broj beta po streetu (big blind se računa kao prvi preflop).
@export var max_bets_per_street: int = 4
## Pauza prije nego bot odigra (da izgleda ljudski).
@export_range(0.0, 3.0, 0.1) var bot_think_seconds: float = 0.8

@export_group("Varanje protivnika")
## Koliko sekundi igrač mora gledati ploču prije nego protivnik smije varati.
@export var cheat_min_turned_away_seconds: float = 2.0
## Šansa po sekundi okrenutosti da protivnik pokuša varati.
@export_range(0.0, 1.0, 0.01) var cheat_chance_per_second: float = 0.15
@export var max_cheats_per_hand: int = 1
## Koliko se špil pomakne nakon varanja (metri).
@export var deck_tell_offset: float = 0.02
## Nijansa špila nakon varanja. Alpha = jačina.
@export var deck_tell_tint: Color = Color(0.9, 0.85, 0.7, 0.15)

@export_group("Optužba LAŽ!")
## Bonus bodovi kad uhvatiš varanje (plus cijeli pot).
@export var accuse_correct_bonus: int = 25
## Kriva optužba: gubiš pot + ovoliko.
@export var accuse_wrong_penalty: int = 10

@export_group("Informant")
## Početni trust (0-1) = šansa da govori istinu.
@export_range(0.0, 1.0, 0.05) var informant_start_trust: float = 0.5
@export_range(0.0, 0.5, 0.05) var informant_trust_per_gift: float = 0.1
@export var informant_gift_cost: int = 15
## Šansa da informant nešto kaže tijekom ruke.
@export_range(0.0, 1.0, 0.05) var informant_talk_chance_per_hand: float = 0.4

@export_group("Profesorica")
## Rast sumnje po sekundi dok gledaš poker.
@export var teacher_suspicion_per_second: float = 0.12
## Pad sumnje po sekundi dok gledaš ploču.
@export var teacher_suspicion_decay_per_second: float = 0.2
## Pragovi faza 1, 2, 3 (3 = uhvaćen).
@export var teacher_stage_thresholds: Array[float] = [0.35, 0.65, 1.0]
## Gubitak ocjene kad te uhvati (0-1).
@export_range(0.0, 1.0, 0.05) var teacher_caught_grade_penalty: float = 0.2
## Dio novca koji zaplijeni (0-1).
@export_range(0.0, 1.0, 0.05) var teacher_caught_money_confiscation: float = 0.3

@export_group("Prepisivanje")
## Sekunde prije nego se tekst na ploči promijeni.
@export var board_text_duration: float = 25.0
@export var board_texts_per_lesson: int = 4
## Minimalna ocjena za prolaz (0-1).
@export_range(0.0, 1.0, 0.05) var passing_grade: float = 0.5
## c = č = ć itd.
@export var lenient_diacritics: bool = true
## Cijena da ti kolega da prepisati propušteni tekst.
@export var copy_from_neighbour_cost: int = 10

@export_group("Kolega lopov")
## Šansa po sekundi dok gledaš poker da uzme novce.
@export_range(0.0, 1.0, 0.01) var thief_chance_per_second: float = 0.05
## Koliki dio novca uzme (0-1).
@export_range(0.0, 1.0, 0.05) var thief_steal_fraction: float = 0.1
## Sekunde da ga uhvatiš nakon što se okreneš.
@export var thief_catch_window_seconds: float = 1.5

@export_group("Bodovanje")
## Bonus = ocjena (0-1) * ovaj broj.
@export var grade_bonus_multiplier: int = 100
