package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Room;

public interface RoomDao {
	public Room room_detail(int r_no);
	public List<Room> room_list(Room room);
	public int room_cnt();
	public int room_register(Room room);
	public int room_option_register(Room room);
	public int room_modify(Room room);
	public int room_option_modify(Room room);
	public int room_delete(int r_no);
	public List<Room> room_booklist();
	
}
