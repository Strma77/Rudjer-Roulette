enum Facing { BOARD, POKER }
var facing: Facing
var money: int                  # = hrpa pod klupom = tvoj poker stack
var grade: float                # 0..1, frend puni
var score: int
var free_copy_tokens: int       # frend puni kad uhvati lopova
var informant_trust: float      # ti puniš
var seconds_facing_current: float   # koliko dugo gleda u trenutni smjer (cheater + profesorica + lopov)

func add_money(amount: int, reason: String) -> void
func spend_money(amount: int, reason: String) -> bool   # false ako nema dovoljno
func set_facing(new_facing: Facing) -> void
func reset_run() -> void
