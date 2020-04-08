package pickme.com.a.login.service;

import model.AMemberDto;

public interface LoginService {
   public String emailCheck(String email);
   public void signup(AMemberDto member);
   public void emailValidateA(AMemberDto member);
   public AMemberDto updateSession(String email);
}