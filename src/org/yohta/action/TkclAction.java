package org.yohta.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.yohta.service.ITkclService;
import org.yohta.utils.PrintString;
import org.yohta.vo.Clerk;
import org.yohta.vo.TkCl;

import com.opensymphony.xwork2.ActionSupport;

public class TkclAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public String list() throws Exception {
	
		List<TkCl> list = new ArrayList<TkCl>();
		//获取考卷详细信息通过考生id
		int clerkId = clerk.getClerkId();
		list = (List<TkCl>) tkclService.findTkClByClerkId(clerkId);
		if (list != null) {
			JSONArray json = JSONArray.fromObject(list);
			PrintString.printStr(json.toString());
		}
		
		return null;
	}

	private Clerk clerk;
	private ITkclService tkclService;


	public void setTkclService(ITkclService tkclService) {
		this.tkclService = tkclService;
	}


	public Clerk getClerk() {
		return clerk;
	}


	public void setClerk(Clerk clerk) {
		this.clerk = clerk;
	}


}
