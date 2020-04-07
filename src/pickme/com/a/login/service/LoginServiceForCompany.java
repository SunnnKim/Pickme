package pickme.com.a.login.service;

import model.AMemberDto;

public interface LoginServiceForCompany {
   public String emailCheck(String email);
   public void signup(AMemberDto member);
}