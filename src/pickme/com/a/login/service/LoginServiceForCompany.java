package pickme.com.a.login.service;

import model.CMemberDto;

public interface LoginServiceForCompany {
   public String emailCheck(String email);
   public void signup(CMemberDto member);
   public void emailValidateC(CMemberDto member);
   public CMemberDto updateSession(String email);
}