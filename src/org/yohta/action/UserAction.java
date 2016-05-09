package org.yohta.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IUserDao;
import org.yohta.utils.PrintString;
import org.yohta.utils.VerifyCodeUtils;
import org.yohta.vo.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	public String loginPre() throws Exception {
		return "loginPre";
	}

	public String login() throws Exception {
		if (userDao.findUserByNameAndPwd(user.getUserName(), user.getUserPwd())) {
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
			return "login";
		} else {

			return "pwdOrUserError";
		}
	}

	/**
	 * 生成图片验证码
	 * 
	 * @return
	 * @throws Exception
	 */
	public String imgCode() throws Exception {
		ServletActionContext.getResponse().setHeader("Pragma", "No-cache");
		ServletActionContext.getResponse().setHeader("Cache-Control", "no-cache");
		ServletActionContext.getResponse().setDateHeader("Expires", -1);
		// 设置浏览器以图片格式显示
		ServletActionContext.getResponse().setContentType("image/jpeg");
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		// 存入会话session
		HttpSession session = ServletActionContext.getRequest().getSession(true);
		session.setAttribute("img", verifyCode);
		// 生成图片
		int w = 88, h = 38;
		VerifyCodeUtils.outputImage(w, h, ServletActionContext.getResponse().getOutputStream(), verifyCode);
		return null;
	}

	/**
	 * 判断输入验证码是否一致
	 * 
	 * @return
	 * @throws Exception
	 */
	public String isImgCode() {
		String img = (String) ServletActionContext.getRequest().getSession().getAttribute("img");
		if (imgCode != null && imgCode.toUpperCase().equals(img)) {
			PrintString.printStr("success");
		} else {
			PrintString.printStr("fail");
		}
		return null;
	}

	@Override
	public User getModel() {
		return user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private User user = new User();
	//验证码
	private String imgCode;

	public String getImgCode() {
		return imgCode;
	}

	public void setImgCode(String imgCode) {
		this.imgCode = imgCode;
	}

	// 注入userDao
	private IUserDao userDao;

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
}
