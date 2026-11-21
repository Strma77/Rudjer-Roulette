signal facing_changed(facing: int)        # GameState.Facing.BOARD / POKER
signal money_changed(new_amount: int, delta: int, reason: String)
signal teacher_caught                     # frend emitira, ti slušaš (prekini ruku)
signal teacher_stage_changed(stage: int)  # 0-3, za audio
signal lesson_ended(grade: float)
signal game_over(reason: String)
