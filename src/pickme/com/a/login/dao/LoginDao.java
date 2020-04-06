package pickme.com.a.login.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import model.AMemberDto;

@Component
public class LoginDao {

   private JdbcTemplate jdbcTemplate;
   
   @Autowired
   public void setDataSource(DataSource dataSrc) {
      this.jdbcTemplate = new JdbcTemplate(dataSrc);
   }
   
   public AMemberDto getMemberByEmail (String email) {
      
      AMemberDto memberCheck = new AMemberDto();
      try {
         memberCheck = (AMemberDto) jdbcTemplate.queryForObject(
               "select * from a_member where email = ?",
               new Object[] { email },
               new RowMapper<Object>() {
                  
                  @Override
                  public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                     // TODO Auto-generated method stub
                     System.out.println("mapping...");
                     
                     AMemberDto member = new AMemberDto();
                     member.setEmail(rs.getString("email"));
                     member.setPassword(rs.getString("password"));
                     return member;
                  }
               }
            );
      } catch (Exception e) {
         memberCheck = null;
      }
      return memberCheck;
   }
   public String emailCheck(String email) {
      String result = "";
      try {
         result = jdbcTemplate.queryForObject("select email from a_member where email = ?", new Object[] { email }, String.class);
      } catch (Exception e) {
         result = "";
      }
      return result;
   }
   @Transactional
   public void signup(AMemberDto member) {
      try {
         System.out.println(member.toString());
         jdbcTemplate.update("insert into a_member (email, pwd, name) values (?, ?, ?)", new Object[] { member.getEmail(), member.getPassword(), member.getName() });
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
}