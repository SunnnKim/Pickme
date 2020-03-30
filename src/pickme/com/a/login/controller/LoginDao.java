package pickme.com.a.login.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.User;

@Repository
public class LoginDao {

	private JdbcTemplate jdbcTemplate;
	@Autowired
	public void setDataSource(DataSource dataSrc) {
		this.jdbcTemplate = new JdbcTemplate(dataSrc);
	}
	
	public User login (String id) {
		
		User userCheck = new User();
		try {
			userCheck = (User) jdbcTemplate.queryForObject(
					"select * from users where id = ?",
					new Object[] { id },
					new RowMapper<Object>() {
						
						@Override
						public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
							// TODO Auto-generated method stub
							System.out.println("mapping...");
							
							User user = new User();
							user.setId(rs.getString("id"));
							user.setPassword(rs.getString("password"));
							return user;
						}
					}
				);
		} catch (Exception e) {
			userCheck = null;
		}
		return userCheck;
	}
	public String idCheck(String id) {
		String result = "";
		try {
			result = jdbcTemplate.queryForObject("select id from users where id = ?", new Object[] { id }, String.class);
		} catch (Exception e) {
			result = "";
		}
		return result;
	}
	@Transactional
	public void signup(User user) {
		try {
			jdbcTemplate.queryForObject("insert into users (id, password) values (?, ?)", new Object[] { user.getId(), user.getPassword() }, User.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
