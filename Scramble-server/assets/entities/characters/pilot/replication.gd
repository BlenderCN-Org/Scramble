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

# Handles replication logic for pilot nodes

extends Node

const SCENE_PATH = '/assets/entities/characters/pilot/spawn.gd'

onready var mp = get_node('/root/Scramble/Multiplayer')


# Replicates this node on a specific client
func replicate(client_id):
    var spawn_info = {
        client_id: client_id,
        scene_path: SCENE_PATH,
        posessed: true,
        position: self.transform.position
    }

    self.mp.spawn_entity_remote(spawn_info)
