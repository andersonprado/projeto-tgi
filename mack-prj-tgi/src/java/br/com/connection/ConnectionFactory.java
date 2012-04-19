package br.com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public Connection getConnection() {
		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager
					.getConnection("jdbc:sqlite:tgi-prj.sqlite");
			return conn;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

/*	public Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/projeto", "root",
					"administrador");
			return conn;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}   */
}
