package org.yohta.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.yohta.dao.IUserDao;
import org.yohta.dao.IUserRightDao;
import org.yohta.utils.PrintString;
import org.yohta.utils.VerifyCodeUtils;
import org.yohta.vo.User;
import org.yohta.vo.UserRight;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public class UserAction extends ActionSupport implements ModelDriven<User> {

	public String loginPre() throws Exception {
		
		return "loginPre";
	}

	public String login() throws Exception {
		User u =userDao.findUserByNameAndPwd(user.getUserName(), user.getUserPwd());
		if(u!=null){
			ServletActionContext.getRequest().getSession().setAttribute("user", u);
			
			return "login";
		}				
					
			
		 else {

			return "pwdOrUserError";
		}
	}
	public String bigRight() throws Exception{
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<UserRight> list = userRightDao.findBigRightId(u.getUserId());
		
		//hibernate级连从在时转json异常+config
		/*JsonConfig config = new JsonConfig();
		//过滤关联对象
        config.setJsonPropertyFilter(new PropertyFilter() {
            public boolean apply(Object arg0, String arg1, Object arg2) {
                 if (arg1.equals("user") ||arg1.equals("right")) {
                        return true;
                    } else {
                        return false;
                    }
            }
        });*/
		StringBuffer sb = new StringBuffer();
		sb.append("{\"right\":");
		sb.append("[");
		for(UserRight ur :list){
			sb.append("{");
			sb.append("\"rightId\":"+ur.getRight().getRightId());
			sb.append("},");
		}
		sb.append("]}");
		String str = sb.substring(0, sb.length()-3);
		str += "]}";
		
		PrintString.printStr(str);
		

		return null;
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
		int w = 88, h = 22;
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
	private IUserRightDao userRightDao;
	
	public IUserRightDao getUserRightDao() {
		return userRightDao;
	}

	public void setUserRightDao(IUserRightDao userRightDao) {
		this.userRightDao = userRightDao;
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
}
