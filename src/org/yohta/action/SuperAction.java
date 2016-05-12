package org.yohta.action;

import java.lang.reflect.ParameterizedType;

import org.yohta.utils.PageResult;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * action对分页和对象传值的优化
 * @author yuanbao
 *
 * @param <T>
 */
public abstract class SuperAction<T> extends ActionSupport implements ModelDriven<T> {
	T model =null;
	Class cla = null;
	public SuperAction(){
		//泛型T 当子类实例化时得到具体的泛型T
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		cla = (Class) pt.getActualTypeArguments()[0];
		try {
			model = (T) cla.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public T getModel() {
		return model;
	}
	/**
	 * 分页
	 */
	protected PageResult pageResult = new PageResult();

	public PageResult getPageResult() {
		return pageResult;
	}

	public void setPageResult(PageResult pageResult) {
		this.pageResult = pageResult;
	}
}
