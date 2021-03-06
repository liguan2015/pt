package com.pt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * @author Gavin
 * @date 创建时间：2017年11月30日 上午11:03:38
 * 
 */
public class IndexController extends Controller {

	@ActionKey("/")
	public void index() {
		getSession().setAttribute("token", UUID.randomUUID().toString());
		renderJsp("/login-phone.jsp");
	}

	@ActionKey("/login")
	public void login() throws Exception {
		if (checkToken()) {
			String mobile = getPara("mobile");
			String password = getPara("password");
			String url = "http://183.6.161.195:9000/api/Auth/GetMobileToken?mobile=" + mobile + "&password=" + password
					+ "&" + getSignStr("website_9A39C2A8", "1B4245E3-B1F1-4F76-9D43-2856FB9DBE31");
			renderJson(responseToJsonByGet(url));
		} else {

		}
	}

	@ActionKey("/regist")
	public void regist() throws Exception {
		if (checkToken()) {
			String name = null;
			String password = getPara("password");
			String smscode = getPara("smscode");
			String mobile = getPara("mobile");
			String certno = getPara("certno");
			name = mobile;
			Map<String, String> para = new HashMap<String, String>();
			para.put("name", name);
			para.put("password", password);
			para.put("smscode", smscode);
			para.put("mobile", mobile);
			if (certno!=null) {
				para.put("certno", certno);
			}
			String url = "http://183.6.161.195:9000/api/Subscriber/AddByMobile?"
					+ getSignStr("website_9A39C2A8", "1B4245E3-B1F1-4F76-9D43-2856FB9DBE31");
			renderJson(responseToJsonByPost(url, para));
		}
	}

	@ActionKey("/getCode")
	public void getCode() throws Exception {
		if (checkToken()) {
			String url = "http://183.6.161.195:9000/api/Subscriber/SendSms?"
					+ getSignStr("website_9A39C2A8", "1B4245E3-B1F1-4F76-9D43-2856FB9DBE31");
			String type = getPara("typeid");
			String mobile = getPara("mobile");
			Map<String, String> para = new HashMap<String, String>();
			para.put("mobile", mobile);
			para.put("type", type);
			responseToJsonByPost(url, para);
		} else {
			System.out.println("error");
		}
	}

	@ActionKey("/resetPsd")
	public void resetPsd() throws Exception {
		if (checkToken()) {
			String mobile = getPara("mobile");
			String password = getPara("password");
			String smscode = getPara("smscode");
			String url = "http://183.6.161.195:9000/api/Subscriber/ResetPassword?"
					+ getSignStr("website_9A39C2A8", "1B4245E3-B1F1-4F76-9D43-2856FB9DBE31");
			Map<String, String> map = new HashMap<String, String>();
			map.put("mobile", mobile);
			map.put("password", password);
			map.put("smscode", smscode);
			renderJson(responseToJsonByPost(url, map));
		}
	}

	public boolean checkToken() {
		boolean result = false;
		String clientToken = getPara("token");
		Object serverToken = getSession().getAttribute("token");
		System.out.println("clientToken:" + clientToken);
		System.out.println("serverToken:" + serverToken);
		if (clientToken == null) {
			return result;
		}
		if (serverToken == null) {
			return result;
		}
		if (clientToken.equals(serverToken.toString().trim())) {
			// getSession().removeAttribute("token");
			result = true;
		}
		return result;
	}

	public String getSignStr(String appid, String appSecret) throws Exception {
		String signature = "";
		String timestamp = String.valueOf(new Date().getTime() / 1000);
		String nonce = String.valueOf(Math.random());

		List<String> sa = new ArrayList<String>();
		sa.add(nonce);
		sa.add(appSecret);
		sa.add(timestamp);

		Collections.sort(sa);
		String sar = "";
		for (String s : sa) {
			sar += s;
		}

		signature = DigestUtils.sha1Hex(sar);

		return "signature=" + signature + "&timestamp=" + timestamp + "&nonce=" + nonce + "&appid=" + appid;
	}

	public String responseToJsonByGet(String url) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(url);
		System.out.println("向URL:" + url + "，发送get请求");

		CloseableHttpResponse response1 = null;
		HttpEntity entity1 = null;
		String result = "";
		try {
			response1 = httpclient.execute(httpGet);
			entity1 = response1.getEntity();
			result = EntityUtils.toString(entity1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				response1.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("接口返回的数据：" + result);
		return result;
	}

	public String responseToJsonByPost(String url, Map<String, String> map) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		System.out.println("向URL:" + url + "，发送post请求");
		for (String str : map.keySet()) {
			nvps.add(new BasicNameValuePair(str, map.get(str)));
			System.out.println("post请求的参数：" + str + ":" + map.get(str));
		}
		CloseableHttpResponse response2 = null;
		HttpEntity entity2 = null;
		String result = "";
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(nvps));
			response2 = httpclient.execute(httpPost);
			entity2 = response2.getEntity();
			result = EntityUtils.toString(entity2);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				response2.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("接口返回的数据：" + result);
		return result;
	}
}
