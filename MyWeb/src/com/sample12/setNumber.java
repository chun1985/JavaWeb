
package com.sample12;

import java.sql.*;

public class setNumber {
	private String[] number = new String[8];

	public String[] getNumber() {
		return number;
	}

	public void readNumForDB(String userTime) throws Exception {
		String url = "jdbc:sqlserver://VMSQL:7531;databaseName=javaDB", user = "java", pw = "java", sql = "";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		// 載入驅動程式
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		// 連線
		con = DriverManager.getConnection(url, user, pw);
		stmt = con.createStatement();
		sql = ("select * from 統一發票 where 期別 = " + userTime);
		rs = stmt.executeQuery(sql);
		rs.next();

		number[0] = rs.getString("第一組號碼");
		number[1] = rs.getString("第二組號碼");
		number[2] = rs.getString("第三組號碼");
		number[3] = rs.getString("特別獎號碼");
		number[4] = rs.getString("特獎號碼");
		number[5] = rs.getString("六獎號碼一");
		number[6] = rs.getString("六獎號碼二");
		number[7] = rs.getString("六獎號碼三");
	}
}
