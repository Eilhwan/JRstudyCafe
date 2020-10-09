package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Room;

@Repository
public class RoomDaoImpl implements RoomDao {
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public Room room_detail(int r_no) {
		return template.selectOne("room_detail", r_no);
	}

	@Override
	public List<Room> room_list(Room room) {
		return template.selectList("room_list", room);
	}

	@Override
	public int room_cnt() {
		return template.selectOne("room_cnt");
	}

	@Override
	public int room_register(Room room) {
		return template.insert("room_register", room);
	}

	@Override
	public int room_option_register(Room room) {
		return template.insert("room_option_register", room);
	}

	@Override
	public int room_modify(Room room) {
		return template.update("room_modify", room);
	}

	@Override
	public int room_option_modify(Room room) {
		return template.update("room_option_modify", room);
	}

	@Override
	public int room_delete(int r_no) {
		return template.update("room_delete", r_no);
	}
	@Override
	   public List<Room> room_booklist() {
	      
	      return template.selectList("room_booklist");
	   }

}
