package net.yozo.web.action;

import net.yozo.core.util.DateUtils;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.*;

public abstract class UploadController {
	private static String DEFAULT_CHARSET = "utf-8";
	private ThreadLocal<HttpServletRequest> request = new ThreadLocal<HttpServletRequest>();
	private ThreadLocal<HttpServletResponse> response = new ThreadLocal<HttpServletResponse>();
	private MultipartHttpServletRequest multipartRequest = null;
	private boolean blMultipart = false;

	public final void setServlet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		this.request.set(this.parseMultipart(request));
		response.setCharacterEncoding(DEFAULT_CHARSET);
		this.response.set(response);
	}

	protected final String get(String name, String charset) throws Exception {
		if (StringUtils.isEmpty(request.get().getParameter(name))) {
			return null;
		}
		if ("GET".equalsIgnoreCase(request.get().getMethod())) {

			return new String(request.get().getParameter(name)
					.getBytes("iso8859-1"),
					StringUtils.isEmpty(charset) ? DEFAULT_CHARSET : charset);
		} else {
			request.get().setCharacterEncoding(
					StringUtils.isEmpty(charset) ? DEFAULT_CHARSET : charset);
			return request.get().getParameter(name);
		}
	}

	protected final boolean isMultipart() {
		return blMultipart;
	}

	/**
	 * 分析是否上传文件请求
	 * 
	 * @param request
	 *            as HttpServletRequest
	 * @return HttpServletRequest
	 */
	protected final HttpServletRequest parseMultipart(HttpServletRequest request)
			throws Exception {
		this.blMultipart = ServletFileUpload.isMultipartContent(request);
		request.setCharacterEncoding(DEFAULT_CHARSET);
		if (!this.blMultipart) {
			return request;
		}
		this.multipartRequest = (MultipartHttpServletRequest) request;
		return this.multipartRequest;
	}

	protected final HttpServletRequest getMultipartRequest() {
		return (this.multipartRequest == null) ? this.getRequest()
				: this.multipartRequest;
	}

	/**
	 * 
	 * @return Iterator&lt;Input.name&gt;
	 */
	public final String[] getUploadNames(String prefix) {
		if (!this.blMultipart)
			return null;
		Iterator<String> ite = multipartRequest.getFileNames();// input.name
		List<String> names = new ArrayList<String>();
		String tmpString = null;
		while (ite.hasNext()) {
			tmpString = ite.next();
			if (tmpString.startsWith(prefix))
				names.add(tmpString);
		}
		return names.toArray(new String[names.size()]);
	}

	/**
	 * //根据getUploadNames()的得到文件对象
	 * 
	 * @param fname
	 *            as String
	 * @return MultipartFile
	 */
	public final MultipartFile getUploadFile(String fname) {
		if (!this.blMultipart)
			return null;
		return this.multipartRequest.getFile(fname);
	}

	public final MultipartFile[] getUploadFiles(String fname) {
		if (!this.blMultipart)
			return null;
		return this.multipartRequest.getFiles(fname).toArray(
				new MultipartFile[] {});
	}

	public final List<MultipartFile> getUploadFileList(String fname) {
		if (!this.blMultipart)
			return null;
		return this.multipartRequest.getFiles(fname);
	}

	protected final String getString(String pName) {
		return getParam(request.get(), pName);
	}

	protected final String getString(String pName, String defVal) {
		return getParam(request.get(), pName, defVal);
	}

	private final String getParam(HttpServletRequest pReq, String pName,
                                  String defVal) {
		String tmp = pReq.getParameter(pName);
		return StringUtils.isEmpty(tmp) ? defVal : tmp;
	}

	private final String getParam(HttpServletRequest pReq, String pName) {
		String tmp = "";
		if (StringUtils.isEmpty(pName))
			return tmp;
		tmp = pReq.getParameter(pName);
		return StringUtils.isEmpty(tmp) ? "" : tmp;
	}

	protected final int getInt(String pName) {
		int val = 0;
		String tmp = getParam(request.get(), pName);
		try {
			if (StringUtils.isNotEmpty(tmp))
				val = Integer.parseInt(tmp);
		} catch (Exception e) {
			val = 0;
		}
		return val;
	}

	protected final long getLong(String pName) {
		long val = 0;
		String tmp = getParam(request.get(), pName);
		try {
			if (StringUtils.isNotEmpty(tmp))
				val = Long.parseLong(tmp);
		} catch (Exception e) {
			val = 0;
		}
		return val;
	}

	protected final boolean getBoolean(String pName) {
		String tmp = getParam(request.get(), pName);
		return (tmp.equalsIgnoreCase("true") || tmp.equalsIgnoreCase("y") || tmp
				.equalsIgnoreCase("1"));
	}

	protected final double getDouble(String pName) {
		double val = 0.0d;
		String tmp = getParam(request.get(), pName);
		try {
			if (StringUtils.isNotEmpty(tmp))
				val = Double.parseDouble(tmp);
		} catch (Exception e) {
			val = 0.0d;
		}
		return val;
	}

	protected final float getFloat(String pName) {
		float val = 0.0f;
		String tmp = getParam(request.get(), pName);
		try {
			if (StringUtils.isNotEmpty(tmp))
				val = Float.parseFloat(tmp);
		} catch (Exception e) {
			val = 0.0f;
		}
		return val;
	}

	protected final String[] getArrays(String pName) {
		String[] vals = null;
		vals = request.get().getParameterValues(pName);
		if (null == vals)
			vals = new String[] {};
		return vals;
	}

	protected final PrintWriter getOut() throws Exception {
		return this.response.get().getWriter();
	}

	protected final HttpServletRequest getRequest() {
		return this.request.get();
	}

	protected final HttpServletResponse getResponse() {
		return this.response.get();
	}

	protected final String getIpAddr() {
		String ip = this.getRequest().getHeader("x-forwarded-for");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = this.getRequest().getHeader("Proxy-Client-IP");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = this.getRequest().getHeader("WL-Proxy-Client-IP");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
			ip = this.getRequest().getRemoteAddr();
		return ip;
	}

	protected final String getToken() {
		String token = this.getRequest().getHeader("X-Bdapi-Token");
		return token;
	}

	protected final void saveInfoToSession(String name, Object value) {
		request.get().getSession().setAttribute(name, value);
	}

	protected final void removeInfoToSession(String name) {
		request.get().getSession().removeAttribute(name);
	}

	protected final Object getInfoFromSession(String name) {
		return request.get().getSession().getAttribute(name);
	}

	protected final void write(Object value) throws Exception {
		this.getOut().print(value);
	}

	/**
	 * 保存信息到session中
	 * 
	 * @Title: saveInfoToSession
	 * @Description: TODO
	 * @param @param request
	 * @param @param name
	 * @param @param value
	 * @return void
	 * @throws
	 */
	protected void saveInfoToSession(HttpServletRequest request, String name,
                                     Object value) {
		try {
			request.getSession().setAttribute(name, value);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * 从session获取信息
	 * 
	 * @Title: getInfoFromSession
	 * @Description: TODO
	 * @param @param request
	 * @param @param name
	 * @param @return
	 * @return Object
	 * @throws
	 */
	protected Object getInfoFromSession(HttpServletRequest request, String name) {
		Object ob = new Object();
		try {
			ob = request.getSession().getAttribute(name);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ob;
	}

	/**
	 * 输出信息到控制台
	 * 
	 * @Title: write
	 * @Description: TODO
	 * @param @param response
	 * @param @param value
	 * @return void
	 * @throws
	 */
	protected void write(HttpServletResponse response, Object value) {
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(value);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * 读取用户请求信息
	 * 
	 * @Title: read
	 * @Description: TODO
	 * @param @param request
	 * @param @param charSet
	 * @param @param name
	 * @param @return
	 * @return String
	 * @throws
	 */
	protected String read(HttpServletRequest request, String charSet,
                          String name) {
		try {
			request.setCharacterEncoding(charSet);
			return request.getParameter(name);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 格式化开始和结束日期
	 * 
	 * @Title: formatDate
	 * @Description: TODO
	 * @param @param beginDate
	 * @param @param endDate
	 * @param @param defaultDays 默认的endDate与beginDate的时间日期差
	 * @return void
	 * @throws
	 */
	protected List<String> formatDate(String beginDate, String endDate,
			int defaultDays) throws Exception {
		List<String> dates = new ArrayList<String>();
		if (StringUtils.isEmpty(endDate)) {
			endDate = DateUtils.getDate(new Date(System.currentTimeMillis()));
		}
		if (StringUtils.isEmpty(beginDate)
				|| DateUtils.parseDatetime(beginDate).getTime() > DateUtils
						.parseDatetime(endDate).getTime()) {
			beginDate = DateUtils.getDate(DateUtils.calcDate(DateUtils
					.parseDatetime(endDate), defaultDays >= 0 ? 0 - defaultDays
					: defaultDays));
		}
		dates.add(beginDate);
		dates.add(endDate);
		return dates;
	}

	protected <T> Map<String, Object> getMapArgsFromBean(T bean)
			throws Exception {
		Map<String, Object> args = new HashMap<String, Object>();
		Field[] fields = bean.getClass().getDeclaredFields();
		for (Field field : fields) {
			String name = field.getName();
			if (!"serialVersionUID".equalsIgnoreCase(name)) {
				field.setAccessible(true);
				if (field.get(bean) != null) {
					args.put(name, field.get(bean));
				}
			}
		}
		return args;
	}

	protected final String getUpload_path() {
		StringBuilder sb = new StringBuilder();
		sb.append(this.getRequest().getScheme()).append("://")
				.append(this.getRequest().getServerName()).append(":")
				.append(this.getRequest().getServerPort())
				// .append(ContextUtils.getContextPath())
				.append("/").append("download").append("/");
		return sb.toString();
	}
}
