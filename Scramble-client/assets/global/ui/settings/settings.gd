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

# Serves as the interface to the settings UI for other nodes.

extends Control

signal settings_hidden

func show_settings():
    self._play_animation("blend_in")


func hide_settings():
    self._play_animation("blend_out")


func _play_animation(animation_name):
    get_node("AnimationPlayer").play(animation_name)