package com.jr.studycafe.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.Room;

public interface RoomService {
	public Room room_detail(int r_no);
	public List<Room> room_list(String pageNum);
	public int room_cnt();
	public int room_register(Room room, MultipartHttpServletRequest mRequest);
	public int room_option_register(Room room);
	public int room_modify(Room room, MultipartHttpServletRequest mRequest);
	public int room_option_modify(Room room);
	public int room_delete(int r_no);
	public List<Room> room_booklist();
}
