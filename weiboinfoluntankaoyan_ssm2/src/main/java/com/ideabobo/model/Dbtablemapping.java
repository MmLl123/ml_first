package com.ideabobo.model;
import com.alibaba.fastjson.JSON;
public class Dbtablemapping {
	public static Object parseStringModel(String value, String table) {
		Object object = null;
		switch (table) {
			case "wct_bill": object = JSON.parseObject(value, Bill.class); break;
			case "wct_blog": object = JSON.parseObject(value, Blog.class); break;
			case "wct_choose": object = JSON.parseObject(value, Choose.class); break;
			case "wct_daka": object = JSON.parseObject(value, Daka.class); break;
			case "wct_message": object = JSON.parseObject(value, Message.class); break;
			case "wct_notice": object = JSON.parseObject(value, Notice.class); break;
			case "wct_posts": object = JSON.parseObject(value, Posts.class); break;
			case "wct_replay": object = JSON.parseObject(value, Replay.class); break;
			case "wct_tiaokuan": object = JSON.parseObject(value, Tiaokuan.class); break;
			case "wct_turl": object = JSON.parseObject(value, Turl.class); break;
			case "wct_type": object = JSON.parseObject(value, Type.class); break;
			case "wct_user": object = JSON.parseObject(value, User.class); break;
		}
		return object;
}
public static Object getModelByTable(String table) {
	Object object = null;
	switch (table) {
			case "wct_bill": object = new Bill(); break;
			case "wct_blog": object = new Blog(); break;
			case "wct_choose": object = new Choose(); break;
			case "wct_daka": object = new Daka(); break;
			case "wct_message": object = new Message(); break;
			case "wct_notice": object = new Notice(); break;
			case "wct_posts": object = new Posts(); break;
			case "wct_replay": object = new Replay(); break;
			case "wct_tiaokuan": object = new Tiaokuan(); break;
			case "wct_turl": object = new Turl(); break;
			case "wct_type": object = new Type(); break;
			case "wct_user": object = new User(); break;
		}
		return object;
	}
}
