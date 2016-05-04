package org.yohta.utils;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;
/**
 * 向打印字符串
 * @author yuanbao
 *
 */
public class PrintString {
	public static void printStr(String str) {
		ServletActionContext.getResponse().setContentType("text/html");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		try {
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.println(str);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
}
