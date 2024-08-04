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
import model.Blog;
import model.CategoryBlog;
import model.Role;
import model.User;

/**
 *
 * @author hophu
 */
public class AdminDAO extends DBContext {

    public static void main(String[] args) {
        AdminDAO d = new AdminDAO();
//User u = d.getUserByID(3);
//        System.out.println(u.getFullname());
        User u = new User(3, "user", "123", "Van Lam", "asdfasdf", "Lao Cai", "1997-02-03", false, "Lamdv@gmail.com", "0316842144", new Role(2, ""), 1);
        d.update(u);

//        System.out.println(d.sendEmail((new User(0,"ds", "ds","ds", "ds", "ds", "20030201", true, "hophuongdongk15@gmail.com", "ds",new Role(2, ""), 0)),"123413"));
    }

    public Blog getBlogByID(int id) {
        String sql = "select * from Blog where statusBlogID = 1 and blogID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(9), "");
                Blog b = new Blog(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        cb);
                return b;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Blog> searchBlogByKey(String key) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where statusBlogID =1 and blogTitle like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(9), "");
                Blog b = new Blog(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        cb);
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getBlogByCateID(int id) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where cateBlogID = ? and statusBlogID =1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(9), "");
                Blog b = new Blog(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        cb);
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<Blog> getPostLatest() {
        List<Blog> list = new ArrayList<>();
        String sql = "select top 5 * from Blog where statusBlogID =1 order by createDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(9), "");
                Blog b = new Blog(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        cb);
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getPaging(int index) {
        String sql = "select * from Blog where statusBlogID = 1\n"
                + "order by createDate desc\n"
                + "offset ? rows\n"
                + "fetch first 3 rows only";
        List<Blog> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 3);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(9), "");
                Blog b = new Blog(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        cb);
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<CategoryBlog> getCateBlog() {
        String sql = "select * from CategoryBlog";
        List<CategoryBlog> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(1), rs.getString(2));
                list.add(cb);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getNumberPage() {
        AdminDAO d = new AdminDAO();
        List<Blog> list = d.getListBlog();
        int total = list.size();
        int countPage = 0;
        countPage = total / 3;
        if (total % 3 != 0) {
            countPage++;
        }
        return countPage;
    }

    public List<Blog> getListBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where statusBlogID =1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryBlog cb = new CategoryBlog(rs.getInt(9), "");
                Blog b = new Blog(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        cb);
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void update(User p) {
        String sql = "update [User] set fullName = ?, userEmail= ?, userAdress=?, userPhone=?, userBirth=?,userAvatar = ? where userID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getFullname());
            st.setString(2, p.getEmail());
            st.setString(3, p.getAddress());
            st.setString(4, p.getPhone());
            st.setString(5, p.getDob());
            st.setString(6, p.getAvatar());
            st.setInt(7, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insert(User p) {
        try {
            String sql = "insert into [User] values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getPass());
            st.setString(3, p.getFullname());
            st.setString(4, p.getAvatar());
            st.setString(5, p.getAddress());
            st.setString(6, p.getDob());
            st.setBoolean(7, p.isGender());
            st.setString(8, p.getEmail());
            st.setString(9, p.getPhone());
            st.setInt(10, p.getRole().getRoleID());
            st.setInt(11, p.getUstatusId());
            st.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public int getIndexUser() {
        int code = 0;
        String sql = "select COUNT(userID) from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                code = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return code;
    }

//    public boolean sendEmail(User user) {
//        boolean test = false;
//
//        String toEmail = user.getEmail();
//        String fromEmail = "hophuongdongk15@gmail.com";
//        String password = "hophuongdong";
//
//        try {
//
//            // your host email smtp server details
//            Properties pr = new Properties();
//            pr.put("mail.smtp.host", "smtp.mail.com");
//            pr.put("mail.smtp.port", "587");
//            pr.put("mail.smtp.auth", "true");
//            pr.put("mail.smtp.starttls.enable", "true");
////            pr.put("mail.smtp.socketFactory.port", "587");
////            pr.put("mail.smtp.socketFactory.class", "jakarta.net.ssl.SSLSocketFactory");
//
//            //get session to authenticate the host email address and password
//            Session session = Session.getInstance(pr, new Authenticator() {
//                @Override
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    return new PasswordAuthentication(fromEmail, password);
//                }
//            });
//
//            //set email message details
//            Message mess = new MimeMessage(session);
//
//            //set from email address
//            mess.setFrom(new InternetAddress(fromEmail));
//            //set to email address or destination email address
//            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//
//            //set email subject
//            mess.setSubject("User Email Verification");
//
//            //set message text
//            mess.setText("Registered successfully.Please verify your account using this code: " + user.getCode());
//            //send the message
//            Transport.send(mess);
//
//            test = true;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return test;
//    }
    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "kiennhhe163054@fpt.edu.vn";
        String password = "qgpq vpno bfsj fhre";

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
            mess.setSubject("AVIATO | CONFIRM ORDER");

            //set message text
            mess.setText("Order Success!!! ");
            //send the message
            Transport.send(mess);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public boolean sendEmail(User user, String code) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "kiennhhe163054@fpt.edu.vn";
        String password = "qgpq vpno bfsj fhre";

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
            mess.setSubject("User Email Verification");

            //set message text
            mess.setText("Registered successfully.Please verify your account using this code: " + code);
            //send the message
            Transport.send(mess);

            test = true;
            System.out.println("Oke");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public void updatePassword(User u, String newpass) {
        String sql = "update [User] set userPass = ? where userName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, u.getName());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void registerAccount(String fname, String uname, String email, String pass) {
        String sql = "insert [User](fullName,userName,userEmail,userPass,userRole,uStatusID) values (?,?,?,?,5,1)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fname);
            ps.setString(2, uname);
            ps.setString(3, email);
            ps.setString(4, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User checkEmail(String email) {
        AdminDAO d = new AdminDAO();
        String sql = "select * from [User] where userEmail=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role x = new Role(rs.getInt(11), "");
                return new User(rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("userPass"),
                        rs.getString("fullName"),
                        rs.getString("userAvatar"),
                        rs.getString("userAdress"),
                        rs.getString("userBirth"),
                        rs.getBoolean("userGender"),
                        rs.getString("userEmail"),
                        rs.getString("userPhone"),
                        x,
                        rs.getInt("uStatusId"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User getUser(String user, String pass) {
        AdminDAO d = new AdminDAO();
        String sql = "select * from [User] where userName=? and userPass=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role x = new Role(rs.getInt(11), "");
                return new User(rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("userPass"),
                        rs.getString("fullName"),
                        rs.getString("userAvatar"),
                        rs.getString("userAdress"),
                        rs.getString("userBirth"),
                        rs.getBoolean("userGender"),
                        rs.getString("userEmail"),
                        rs.getString("userPhone"),
                        x,
                        rs.getInt("uStatusId"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    public static List<User> ls = new ArrayList<>();

    public User findByID(int id) {
        for (User l : ls) {
            if (l.getId() == id) {
                return l;
            }
        }
        return null;
    }

//    public int update(User u) {
//        for (int i = 0; i < ls.size(); i++) {
//            if (ls.get(i).getId() == u.getId()) {
//                ls.set(i, u);
//                return i;
//            }
//        }
//        return -1;
//    }
    public int save(User u) {
        ls.add(u);
        return 1;
    }

    public int delete(int id) {
        AdminDAO d = new AdminDAO();

        User u = d.findByID(id);
        if (u != null) {
            ls.remove(u);
            return 1;
        }
        return 0;
    }

    public List<User> getAllUser() {
        AdminDAO d = new AdminDAO();
        List<User> list = new ArrayList<>();

        String sql = "select * from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role x = new Role(rs.getInt(11), "");
                User u = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        x,
                        rs.getInt(12)
                );
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public User getUserByID(int id) {
        AdminDAO d = new AdminDAO();
        User c = null;
        String sql = "select * from [User] where userID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role x = new Role(rs.getInt(11), "");
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        x,
                        rs.getInt(12));

            }
        } catch (Exception e) {
        }
        return null;
    }
}
