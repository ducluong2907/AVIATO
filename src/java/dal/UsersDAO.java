/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author HP
 */
public class UsersDAO extends DBContext {

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User U = new User();
                U.setEmail(rs.getString(9));
                U.setId(rs.getInt(1));
                U.setPass(rs.getString(3));
                U.setName(rs.getString(2));
                list.add(U);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }
     public List<User> pagingOrders(int index) {
        List<User> list = new ArrayList<>();
        String query = "select * from [user] where userRole = 5 order by userID offset ? rows fetch next 5 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User U = new User();
                U.setId(rs.getInt(1));
                U.setFullname(rs.getString(4));
                U.setGender(true);
                U.setEmail(rs.getString(9));
                U.setPhone(rs.getString(10));
                list.add(U);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public List<User> sortCustomer(String sort) {
        List<User> list = new ArrayList<>();
        PreparedStatement st = null;
        ResultSet rs = null;
        String query1 = "select * from [User] where userRole = 5 order by fullName";
        String query2 = "select * from [User] where userRole = 5 order by userEmail";
        String query3 = "select * from [User] where userRole = 5 order by userPhone";
        try {
            if (sort.equalsIgnoreCase("1")) {
                st = connection.prepareStatement(query1);
                rs = st.executeQuery();
            }
            if (sort.equalsIgnoreCase("2")) {
                st = connection.prepareStatement(query2);
                rs = st.executeQuery();
            }
            if (sort.equalsIgnoreCase("3")) {
                st = connection.prepareStatement(query3);
                rs = st.executeQuery();
            }
            while (rs.next()) {
                User U = new User();
                U.setId(rs.getInt(1));
                U.setFullname(rs.getString(4));
                U.setGender(true);
                U.setEmail(rs.getString(9));
                U.setPhone(rs.getString(10));
                U.setUstatusId(rs.getInt(12));
                list.add(U);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalUser() {
        String query = "select count(*) from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public List<User> filterbyStatus(String status) {
        List<User> list = new ArrayList<>();
        String query = "select * from [User] where userRole = 5 and [uStatusID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User U = new User();
                U.setId(rs.getInt(1));
                U.setFullname(rs.getString(4));
                U.setGender(true);
                U.setEmail(rs.getString(9));
                U.setPhone(rs.getString(10));
                list.add(U);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public List<User> searchbyName(String name) {
        List<User> list = new ArrayList<>();
        String query = "select * from [User] where userRole = 5 and fullName like '%" + name + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User U = new User();
                U.setId(rs.getInt(1));
                U.setFullname(rs.getString(4));
                U.setGender(true);
                U.setEmail(rs.getString(9));
                U.setPhone(rs.getString(10));
                list.add(U);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public void insert(User U) {
        String sql = "insert into [user](userName,userPass,fullName,userAvatar,userAdress,userBirth,userGender,userEmail,userPhone,userRole,uStatusID) values ('anonymous','123',?,'user.jpg',?,getDate(), '1',?,?,5,1)";
        try {
            int result = 0;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, U.getFullname());
            st.setString(2, U.getAddress());
            st.setString(3, U.getEmail());
            st.setString(4, U.getPhone());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
     public void update(User U,String id) {
        String sql = "update [User] set fullName = ? ,userAdress = ?,userEmail = ?,userPhone = ? where userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, U.getFullname());
            st.setString(2, U.getAddress());
            st.setString(3, U.getEmail());
            st.setString(4, U.getPhone());
            st.setString(5, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
public List<User> getUserD() {
        List<User> list = new ArrayList<>();
        String sql = "select top 3 * from [user] order by userID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User U = new User();
                U.setId(rs.getInt(1));
                U.setFullname(rs.getString(4));
                U.setGender(true);
                U.setEmail(rs.getString(9));
                U.setPhone(rs.getString(10));
                list.add(U);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }
    public User getUser(int id) {
        User U = new User();
        String sql = "select top(1) * from [user] where userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                U = new User();
                U.setEmail(rs.getString(9));
                U.setId(rs.getInt(1));
                U.setPass(rs.getString(3));
                U.setName(rs.getString(4));
                U.setGender(rs.getBoolean(8));
                U.setPhone(rs.getString(10));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return U;
    }

    public void resetPassword(String pass, String email) {
        String sql = "update [User] set userPass = ? where userEmail = ?";
        try {
            int result = 0;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        UsersDAO dao = new UsersDAO();
//        List<User> list = dao.getAll();
//        for (User users : list) {
//            System.out.println(users);
//        }
        dao.resetPassword("123", "dungndhe150788@fpt.edu.vn");
    }
}
