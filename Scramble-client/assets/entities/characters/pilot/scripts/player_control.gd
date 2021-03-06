# Scramble
# Copyright (C) 2018  ScrambleSim and contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

extends Node

const MAX_WALK_SPEED = 1.5
const MAX_RUN_SPEED = 4.5

func _ready():
    if not get_parent().is_posessed:
        var pitch = $"../Pitch"
        pitch.queue_free()
        self.queue_free()

    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
    self.move(delta)
    self.look(delta)


func move(_delta):
    var p = self.get_parent()
    var forward =  p.global_transform.basis.z * PropertyManager.player_move_FB * -1
    var sideways = p.global_transform.basis.x * PropertyManager.player_move_LR * -1
    var move_vel = (forward + sideways)
    move_vel = move_vel.normalized()
    
    var speed = MAX_WALK_SPEED
    if (PropertyManager.player_run):
        speed = MAX_RUN_SPEED
    
    p.move_and_slide(move_vel * speed, Vector3(0, 1, 0))
    
    if PropertyManager.player_run:
        $"../WalkAnimation".set_animation(PropertyManager.player_move_FB * -1)
    else:
        $"../WalkAnimation".set_animation((PropertyManager.player_move_FB * -1) - 1)


func look(delta):
    var pitch = $"../Pitch"
    pitch.rotate_x(PropertyManager.look_vertical * delta * (-1.0))
    var yaw = self.get_parent()
    yaw.rotate_y(PropertyManager.look_horizontal * delta)


# TODO remove if input manager supports mouse events
func _input(event):
    if event is InputEventMouseMotion:
        var pitch = $"../Pitch"
        pitch.rotate_x(event.relative.y * 0.003)
        var yaw = self.get_parent()
        yaw.rotate_y(event.relative.x * 0.003 * (-1.0))
