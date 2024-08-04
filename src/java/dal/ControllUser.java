/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Role;
import model.User;

public class ControllUser extends DBContext {

    public List<User> getList(int[] ar, int sortCondition, int page, int pageSize, String key) {
        String sql = "select * from [User] where 1=1";
        //filter
        if (ar != null) {
            if (ar[0] != -1) {
                sql += "and userGender=" + ar[0];
            }
            if (ar[1] != -1) {
                sql += " and userRole=" + ar[1];
            }
            if (ar[2] != -1) {
                sql += " and uStatusID=" + ar[2];
            }
        }
        if (key != null || key!="") {
            sql += " and userName like ?";
        }
        //for sort
        if (sortCondition == 1) {
            sql += " order by userID asc, fullName asc, userGender asc, userEmail asc, userPhone asc, userRole asc, uStatusID asc";
        } else if (sortCondition == 2) {
            sql += " order by userID desc, fullName desc, userGender desc, userEmail desc, userPhone desc, userRole desc, uStatusID desc";
        }
        //pagging
        sql += " offset (?-1)*? row fetch next ? rows only";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            st.setInt(2, page);
            st.setInt(3, pageSize);
            st.setInt(4, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = getRoleWithID(rs.getInt(11));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> forGetList(int[] ar, int sortCondition, String key) {
        String sql = "select * from [User] where 1=1";
        //filter
        if (ar != null) {
            if (ar[0] != -1) {
                sql += "and userGender=" + ar[0];
            }
            if (ar[1] != -1) {
                sql += " and userRole=" + ar[1];
            }
            if (ar[2] != -1) {
                sql += " and uStatusID=" + ar[2];
            }
        }
        if (key != null) {
            sql += " and userName like ?";
        }
        //for sort
        if (sortCondition == 1) {
            sql += " order by userID asc, fullName asc, userGender asc, userEmail asc, userPhone asc, userRole asc, uStatusID asc";
        } else if (sortCondition == 2) {
            sql += " order by userID desc, fullName desc, userGender desc, userEmail desc, userPhone desc, userRole desc, uStatusID desc";
        }
        //pagging

        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {              
                Role x = getRoleWithID(rs.getInt(11));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getUserWithCondition(int[] ar) {
        String sql = "select * from [User] where 1=1";
        if (ar != null) {
            if (ar[0] != -1) {
                sql += " and userGender=" + ar[0];
            }
            if (ar[1] != -1) {
                sql += " and userRole=" + ar[1];
            }
            if (ar[2] != -1) {
                sql += " and uStatusID=" + ar[2];
            }
        }
//        sql+= " order by  userID asc offset (?-1)*? row fetch next ? rows only"; 
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = getRoleWithID(rs.getInt(11));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //id, fullname, gender, email, mobile, role, status
    public List<User> sortUser(int n, int page, int pageSize) {
        //truyen array nua ket hop vua filter vua sort
        String sql = "select * from [User]";
        if (n == 1) {
            sql += " order by userID desc, fullName desc, userGender desc, userEmail desc, userPhone desc, userRole desc, uStatusID desc";
        } else if (n == 2) {
            sql += " order by userID asc, fullName asc, userGender asc, userEmail asc, userPhone asc, userRole asc, uStatusID asc";
        }
        sql += " offset (?-1)*? row fetch next ? rows only";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, pageSize);
            st.setInt(3, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = getRoleWithID(rs.getInt(11));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getAllWithPagging(int page, int pageSize) {
        String sql = "select * from [User] order by  userID asc offset (?-1)*? row fetch next ? rows only";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, pageSize);
            st.setInt(3, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = getRoleWithID(rs.getInt(11));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUser(int id) {
        try {
            String sql = "select *from [User] where userID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = getRoleWithID(rs.getInt(11));
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //select count(*) from [User]
    public int amountUser(List<User> list) {
        int x = 0;
        for (int i = 0; i < list.size(); i++) {
            x++;
        }
        return x;
    }

    public Role getRoleWithID(int id) {
        try {
            String sql = "select * from [Role]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = new Role(rs.getInt(1), rs.getString(2));
                if (x.getRoleID() == id) {
                    return x;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getListByKey(String key) {
        String sql = "select * from [User] where userName like ?";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = getRoleWithID(rs.getInt(11));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), rs.getString(9), rs.getString(10), x, rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Role> getRole() {
        String sql = "select * from [Role]";
        List<Role> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addUser(User x) {
        String sql = "insert into [User] values (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getName());
            st.setString(2, x.getPass());
            st.setString(3, x.getFullname());
            st.setString(4, x.getAvatar());
            st.setString(5, x.getAddress());
            st.setString(6, x.getDob());
            st.setBoolean(7, x.isGender());
            st.setString(8, x.getEmail());
            st.setString(9, x.getPhone());
            st.setInt(10, x.getRole().getRoleID());
            st.setInt(11, x.getUstatusId());
            st.executeUpdate();
            System.out.println("OK");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateUser(int id, int role, int status) {
        String sql = "update [User]\n"
                + "set userRole=?,uStatusID=?\n"
                + "where userID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            st.setInt(2, status);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkUser(String x) {
        String sql = "select * from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString(2).equals(x)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(User user, String usrename, String code) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "phungduchai2001@gmail.com";
        String password = "yaaahkccgvrotcld";

        try {

            // your host email smtp server details
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject("Admin of website...have add new account for you");

            //set message text
            mess.setText("Registered successfully.Please login with this: \nUsername:" + usrename + "\nPassword:" + code + "\nAfter logging in, you should change your password for safety");
            //send the message
            Transport.send(mess);

            test = true;
            System.out.println("Oke");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    //for test
    public static void main(String[] args) {
        ControllUser d = new ControllUser();
        int ar[] = {-1, 1, -1};
        List<User> list = d.getList(ar, 1, 1, 3, null);
        d.addUser(new User("taikhoan", "mkahau", "tayduki", "", "Nogko", "20010506", true, "hahaha@gmail.com", "0213", new Role(1, ""), 1));
//        d.sendEmail(new User("", "", "", "", "", "", true, "hahaha@gmail.com", "0213", new Role(1, ""), 1), "haha", "123324234");
        
    }
}
