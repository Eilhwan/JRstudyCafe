package com.tj.test01.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tj.test01.dto.B;
@Repository
public class BDaoImpl implements BDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<B> list(B b) {
		return sessionTemplate.selectList("list", b);
	}
	@Override
	public int cnt(B b) {
		return sessionTemplate.selectOne("cnt", b);
	}
	@Override
	public int write(B b) {
		return sessionTemplate.insert("write", b);
	}
	@Override
	public B detail(int bno) {
		return sessionTemplate.selectOne("detail", bno);
	}
	@Override
	public int update(B b) {
		System.out.println("DAO 수정할 b : "+b);
		return sessionTemplate.update("update", b);
	}
	@Override
	public int delete(int bno) {
		return sessionTemplate.delete("delete", bno);
	}
}