; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
Name = "AI0"
Command = a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
Time = 0
[Command]
Name = "AI1"
Command = b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b
Time = 0
[Command]
Name = "AI2"
Command = c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
Time = 0
[Command]
Name = "AI3"
Command = x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
Time = 0
[Command]
Name = "AI4"
Command = y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
Time = 0
[Command]
Name = "AI5"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI6"
Command = s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
Time = 0
[Command]
Name = "AI7"
Command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F
Time = 0
[Command]
Name = "AI8"
Command = D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D
Time = 0
[Command]
Name = "AI9"
Command = B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B
Time = 0
[Command]
Name = "AI10"
Command = U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U
Time = 0
[Command]
Name = "AI11"
Command = a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
Time = 0
[Command]
Name = "AI12"
Command = c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
Time = 0
[Command]
Name = "AI13"
Command = x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
Time = 0
[Command]
Name = "AI14"
Command = y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
Time = 0
[Command]
Name = "AI15"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI16"
Command = s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
Time = 0
[Command]
Name = "AI17"
Command = a,B,c,x,y,z,s,B,D,F,U,a,b,c,x,y,z,s,s
Time = 0
[Command]
Name = "AI18"
Command = a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
Time = 0
[Command]
Name = "AI19"
Command = b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b
Time = 0
[Command]
Name = "AI20"
Command = c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
Time = 0
[Command]
Name = "AI21"
Command = x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
Time = 0
[Command]
Name = "AI22"
Command = y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
Time = 0
[Command]
Name = "AI23"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI24"
Command = s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
Time = 0
[Command]
Name = "AI25"
Command = F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F,F
Time = 0
[Command]
Name = "AI26"
Command = D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D
Time = 0
[Command]
Name = "AI27"
Command = B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B
Time = 0
[Command]
Name = "AI28"
Command = U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U,U
Time = 0
[Command]
Name = "AI29"
Command = a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a
Time = 0
[Command]
Name = "AI30"
Command = c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c
Time = 0
[Command]
Name = "AI31"
Command = x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
Time = 0
[Command]
Name = "AI32"
Command = y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y,y
Time = 0
[Command]
Name = "AI33"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI34"
Command = s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s
Time = 0
[Command]
Name = "AI35"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI36"
Command = z,z,z,z,z,z,a,a,a,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI37"
Command = z,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,z,z,z
Time = 0
[Command]
Name = "AI38"
Command = z,z,z,z,z,a,a,a,z,z,z,z,z,a,a,a,z,z,z
Time = 0
[Command]
Name = "AI39"
Command = z,z,z,z,z,a,a,a,z,z,z,z,z,z,a,a,z,z,z
Time = 0
[Command]
Name = "AI40"
Command = z,z,z,z,a,a,a,z,z,z,z,a,z,z,a,a,z,z,z
Time = 0
[Command]
Name = "AI41"
Command = z,z,z,a,z,z,z,z,z,z,z,z,z,a,a,z,z,z,z
Time = 0
[Command]
Name = "AI42"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI43"
Command = z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,z,a,a,z
Time = 0
[Command]
Name = "AI44"
Command = z,z,a,a,a,a,z,z,z,z,z,z,z,z,z,a,a,a,z
Time = 0
[Command]
Name = "AI45"
Command = z,z,z,z,z,z,a,a,z,z,z,z,z,a,a,a,a,z,z
Time = 0
[Command]
Name = "AI46"
Command = z,z,z,z,z,z,z,z,a,a,a,a,a,a,z,z,z,z,z
Time = 0
[Command]
Name = "AI47"
Command = z,z,z,a,a,a,a,z,z,z,z,z,z,z,z,z,z,z,z
Time = 0
[Command]
Name = "AI48"
Command = z,z,z,z,z,a,a,a,z,z,z,a,a,a,z,z,a,z,a
Time = 0
[Command]
Name = "AI49"
Command = z,z,z,z,a,a,a,z,z,z,z,z,a,a,a,z,z,z,z
Time = 0
[Command]
Name = "AI50"
Command = z,z,z,a,a,z,z,z,z,z,z,z,z,z,a,a,z,z,z
Time = 0


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "Recovery S";Required (do not remove)
command = b+c
time = 1

[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = z+x+y
time = 1

[Command]
name = "BEstamina"
command = a+b+c
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
;---UMINEKO COMANDS------------------------------------------------------------

[Command]
name = "meta"
command = z
time = 1

[command]
name = "meta"
command = a+b+c
time = 6

;-| Special Motions |------------------------------------------------------
[command]
name = "AIR_AT_A"
command = D,DF,a
time = 15

[command]
name = "AIR_AT_B"
command = D,DF,b
time = 15

[command]
name = "AIR_AT_C"
command = D,DF,c
time = 15

[command]
name = "AIR_AT_Y"
command = D,DF,y
time = 15

[command]
name = "AIR_AT_Z"
command = D,DF,z
time = 15

[command]
name = "AIR_AT_X"
command = D,DF,x
time = 15

[command]
name = "SuperBall"
command = D,DF,F,a
time = 15

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

[state -1, Sand Kunai]
type = changestate
Triggerall = power >= 1000
triggerall = statetype = S
triggerall = ctrl
trigger1 = command = "SuperBall"
value = 1000
ctrl = 0

[state -1, Sand Kunai]
type = changestate
Triggerall = power >= 1000
triggerall = statetype = A
triggerall = ctrl
trigger1 = command = "AIR_AT_A"
trigger2 = command = "AIR_AT_B"
trigger3 = command = "AIR_AT_C"
trigger4 = command = "AIR_AT_Y"
trigger5 = command = "AIR_AT_X"
trigger6 = command = "AIR_AT_Z"
value = 1100
ctrl = 0
;===========================================================================
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------

[State -1, Estamina]
Type = ChangeState
TriggerAll = Var(51) = 10000
triggerAll = statetype = S
triggerAll = ctrl = 1
Trigger1  = Command = "BEstamina"
value = 3999

;---------------------------------------------------------------------------
;taunt
[state -1, Light Attack2]
type = changestate
triggerall = command ="start"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 195
;---------------------------------------------------------------------------
;Light Attack2
[state -1, Light Attack2]
type = changestate
triggerall = command = "down_b"
triggerall = command ="holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
value = 200
;---------------------------------------------------------------------------
;Medium Attack
[state -1, Medium Attack]
type = changestate
triggerall = command = "b"
triggerall = command !="holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 200
;---------------------------------------------------------------------------
;HeavyAttack
[state -1, Heavy Attack]
type = changestate
triggerall = command = "c"
triggerall = command !="holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 202
;---------------------------------------------------------------------------
;Light Attack
[state -1, Light Attack]
type = changestate
triggerall = command = "down_a"
triggerall = command ="holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
value = 200
;---------------------------------------------------------------------------
;Sand Kunai
[state -1, Sand Kunai]
type = changestate
triggerall = command = "a"
triggerall = command !="holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 202
;---------------------------------------------------------------------------
;Sand Kunai
[state -1, Sand Kunai]
type = changestate
triggerall = command = "x"
triggerall = command !="holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 200
;---------------------------------------------------------------------------
;Sand Kunai
[state -1, Sand Kunai]
type = changestate
triggerall = command = "y"
triggerall = command !="holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 200
;---------------------------------------------------------------------------
;Sand Kunai
[state -1, Sand Kunai]
type = changestate
triggerall = command = "z"
triggerall = command !="holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
value = 200
