package operations;
import java.sql.*;
import connection.DbConnection;
import modelGetSet.*;

public class PassRegOper {
	private Connection con;
	private PreparedStatement ps;

	public PassRegOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewPassReg(PassReg passr) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into PassengerReg(airline_code, pname, gender, age, passportno) value(?,?,?,?,?)");
			ps.setString(1, passr.getAirline_code());
			ps.setString(2, passr.getPname());
			ps.setString(3, passr.getGender());
			ps.setInt(4, passr.getAge());
			ps.setString(5, passr.getPassportno());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}

	public ResultSet ShowAllPassRegDetail() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from PassengerReg order by p_id desc limit 2");
			rs = ps.executeQuery();
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}
	
	public ResultSet ShowSelectPassRegDetail(PassReg passr) {
		ResultSet rs = null;
		try {
			/*select * from PassengerReg where airline_code="6E";
			 select * from PassengerReg where airline_code=? order by p_id desc limit 2* /
			 select * from passengerReg where airline_code='AI2' && insert_time >= (select max(insert_time) from passengerReg);
			 select * from PassengerReg where airline_code=? && p_id>(select max(p_id) from passengerReg where p_id <> (select max(p_id) from passengerReg))
			 */
			ps = con.prepareStatement("select * from passengerReg where airline_code=? && insert_time >= (select max(insert_time) - interval 30 second from passengerReg)");
			ps.setString(1, passr.getAirline_code());
			rs = ps.executeQuery();
		} 
		catch (Exception ex) 
		{
			rs = null;
		}
		return rs;
	}
}
