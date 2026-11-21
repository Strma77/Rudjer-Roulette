extends Node
## Shared game state (autoload "GameState"). The single source of truth both screens read/write.
## Register AFTER "Events" in Project Settings > Globals > Autoload.

enum Facing { BOARD, POKER }

const CONFIG_PATH := "res://config/game_config.tres"

## All tunable numbers. Everyone reads them as GameState.config.<field>.
var config: GameConfig

## Which way the player is looking. Change ONLY via set_facing().
var facing: Facing = Facing.BOARD
## Seconds since the last turn. Drives cheating, teacher suspicion and thief chances.
var seconds_facing_current: float = 0.0

## Money under the desk = player's poker stack. Change ONLY via add_money()/spend_money().
var money: int = 0
## Lesson grade 0..1 (board side fills it).
var grade: float = 0.0
var score: int = 0
## Free "copy from neighbour" uses, earned by catching the thief.
var free_copy_tokens: int = 0
## 0..1, chance the informant tells the truth (poker side fills it).
var informant_trust: float = 0.0


func _ready() -> void:
	if ResourceLoader.exists(CONFIG_PATH):
		config = load(CONFIG_PATH) as GameConfig
	if config == null:
		push_warning("GameState: %s missing, using default GameConfig values." % CONFIG_PATH)
		config = GameConfig.new()
	reset_run()


func _process(delta: float) -> void:
	seconds_facing_current += delta


## Start a fresh run with values from config.
func reset_run() -> void:
	money = config.starting_money
	grade = 0.0
	score = 0
	free_copy_tokens = 0
	informant_trust = config.informant_start_trust
	facing = Facing.BOARD
	seconds_facing_current = 0.0
	Events.money_changed.emit(money, 0, "reset")


func set_facing(new_facing: Facing) -> void:
	if new_facing == facing:
		return
	facing = new_facing
	seconds_facing_current = 0.0
	Events.facing_changed.emit(facing)


func is_facing_poker() -> bool:
	return facing == Facing.POKER


func add_money(amount: int, reason: String) -> void:
	assert(amount >= 0, "add_money: amount must be >= 0, use spend_money to remove")
	if amount == 0:
		return
	money += amount
	Events.money_changed.emit(money, amount, reason)


## Returns false (and changes nothing) if there isn't enough money.
func spend_money(amount: int, reason: String) -> bool:
	assert(amount >= 0, "spend_money: amount must be >= 0")
	if amount > money:
		return false
	if amount == 0:
		return true
	money -= amount
	Events.money_changed.emit(money, -amount, reason)
	return true


## Takes as much as possible up to amount (thief, teacher confiscation). Returns how much was taken.
func take_money(amount: int, reason: String) -> int:
	assert(amount >= 0, "take_money: amount must be >= 0")
	var taken: int = mini(amount, money)
	if taken > 0:
		money -= taken
		Events.money_changed.emit(money, -taken, reason)
	return taken
