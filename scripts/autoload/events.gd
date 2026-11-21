extends Node
## Global signal bus (autoload "Events").
## One side emits, the other listens. Screens never reference each other directly.
## Usage: Events.teacher_caught.emit()  /  Events.teacher_caught.connect(_on_teacher_caught)

## Player turned around. facing = GameState.Facing.BOARD or GameState.Facing.POKER.
## Emitted by GameState.set_facing(). Listened by: poker (cheating), board (teacher, thief).
signal facing_changed(facing: int)

## Money under the desk changed. delta is negative when money was spent/stolen.
## Emitted by GameState. Listened by: board (money pile visual), HUD.
signal money_changed(new_amount: int, delta: int, reason: String)

## Teacher reached the desk and caught the player gambling.
## Emitted by: board (teacher). Listened by: poker (abort current hand), game flow.
signal teacher_caught

## Teacher suspicion stage changed: 0 writing, 1 chalk stops, 2 footsteps, 3 caught.
## Emitted by: board (teacher). Listened by: audio.
signal teacher_stage_changed(stage: int)

## A lesson (level) is over. grade = 0..1.
## Emitted by: board (lesson flow). Listened by: game flow, score screen.
signal lesson_ended(grade: float)

## Run is over (failed lesson, bankrupt, last lesson done).
signal game_over(reason: String)
