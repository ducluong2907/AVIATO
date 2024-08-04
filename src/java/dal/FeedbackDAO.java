/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Feedback;
import model.User;
import model.product.Brand;
import model.product.Category;
import model.product.Color;
import model.product.Product;
import model.product.ProductDetail;
import model.product.Size;

/**
 *
 * @author hophu
 */
public class FeedbackDAO extends DBContext{
    
    public List<Feedback> getFeedbackList(int[] statusFeedback, int[] brandID, int[] productID, int[] rateStar, String keySearch, int sortCondition, int page, int pageSize) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select * from Feedback f inner join ProductDetail pd\n"
                + "on f.detailID=pd.detailID\n"
                + "inner join Product p\n"
                + "on pd.productID=p.productID\n"
                + "inner join Category c\n"
                + "on p.cateID=c.cateID\n"
                + "inner join Brand b\n"
                + "on c.brandID=b.brandID\n"
                + "inner join [User] u\n"
                + "on f.userID=u.userID where 1=1";
        //xu li status
        if (statusFeedback != null) {
            sql += " and f.status in(";
            for (int i = 0; i < statusFeedback.length; i++) {
                sql += statusFeedback[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li brand
        if (brandID != null) {
            sql += " and b.brandID in(";
            for (int i = 0; i < brandID.length; i++) {
                sql += brandID[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
            //xu li product
            if (productID != null) {
                sql += " and p.productID in(";
                for (int i = 0; i < productID.length; i++) {
                    sql += productID[i] + ",";
                }
                if (sql.endsWith(",")) {
                    sql = sql.substring(0, sql.length() - 1);
                }
                sql += ")";
            }
        }

        //xu li search
        if (keySearch != null || keySearch != "") {
            sql += "and (f.comment like ? or u.fullName like ?)";
        }
        //xu li star
        if (rateStar != null) {
            sql += "and f.rateStar in (";
            for (int i = 0; i < rateStar.length; i++) {
                sql += rateStar[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li sort
        if (sortCondition == 0) {
            sql += " order by u.fullName asc, p.productName asc, f.rateStar asc, f.status asc";
        } else {
            sql += " order by u.fullName desc, p.productName desc, f.rateStar desc, f.status desc";
        }
        sql += " offset (?-1)*? row fetch next ? rows only";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + keySearch + "%");
            st.setString(2, "%" + keySearch + "%");
            st.setInt(3, page);
            st.setInt(4, pageSize);
            st.setInt(5, pageSize);
            rs = st.executeQuery();
            while (rs.next()) {
                User account = getU.getUser(rs.getInt(2));
                ProductDetail pro = getPro.getProductDetailByID(rs.getInt(3));
                list.add(new Feedback(rs.getInt(1), account, pro, rs.getString(4), rs.getString(5), rs.getInt(6), rs.getBoolean(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
public List<Product> getAllProduct(int[] brandID) {
        String sql = "select * from Product p \n"
                + "inner join Category c\n"
                + "on p.cateID=c.cateID\n"
                + "inner join Brand b on c.brandID=b.brandID where 1=1";
        List<Product> list = new ArrayList<>();
        //xu li brand
        if (brandID != null) {
            sql += " and b.brandID in(";
            for (int i = 0; i < brandID.length; i++) {
                sql += brandID[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt(6), null, "");
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), cate, rs.getInt(7), rs.getDouble(8), rs.getString(9), rs.getBoolean(10), rs.getBoolean(11));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Brand> getAllBrand() {
        String sql = "select * from Brand";
        List<Brand> list = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void changeStatusFeedback(int condition, int feedbackID) {
        String sql = "update Feedback\n"
                + "set status=? where feedbackID=?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, condition);
            st.setInt(2, feedbackID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int getTotalPageFB(int[] statusFeedback, int[] brandID, int[] productID, int[] rateStar, String keySearch) {
        int count = 0;
        String sql = "select * from Feedback f inner join ProductDetail pd\n"
                + "on f.detailID=pd.detailID\n"
                + "inner join Product p\n"
                + "on pd.productID=p.productID\n"
                + "inner join Category c\n"
                + "on p.cateID=c.cateID\n"
                + "inner join Brand b\n"
                + "on c.brandID=b.brandID\n"
                + "inner join [User] u\n"
                + "on f.userID=u.userID where 1=1";
        //xu li status
        if (statusFeedback != null) {
            sql += "and f.status in(";
            for (int i = 0; i < statusFeedback.length; i++) {
                sql += statusFeedback[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li brand
        if (brandID != null) {
            sql += " and b.brandID in(";
            for (int i = 0; i < brandID.length; i++) {
                sql += brandID[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
            //xu li product
            if (productID != null) {
                sql += " and p.productID in(";
                for (int i = 0; i < productID.length; i++) {
                    sql += productID[i] + ",";
                }
                if (sql.endsWith(",")) {
                    sql = sql.substring(0, sql.length() - 1);
                }
                sql += ")";
            }
        }
        //xu li search
        if (keySearch != null || keySearch != "") {
            sql += "and (f.comment like ? or u.fullName like ?)";
        }
        if (rateStar != null) {
            sql += "and f.rateStar in (";
            for (int i = 0; i < rateStar.length; i++) {
                sql += rateStar[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + keySearch + "%");
            st.setString(2, "%" + keySearch + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }
    public void insert(User u, int detailID, String comment, int rate, int orderDetailID) {
        String sql = "insert into [Feedback] values (?,?,?,?,?,?)";
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setInt(2, detailID);
            st.setString(3, comment);
            Date d = new Date();
            st.setString(4, date);
            st.setInt(5, rate);
            st.setBoolean(6, true);
            st.executeUpdate();
            String sql2 = "update OrderDetail set isFeedback=1 where orderDetailID=?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, orderDetailID);
            st2.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public ProductDetail getProductDetailByID(int id) {
        String sql = "select * from ProductDetail where detailID=?";
        List<ProductDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getByID(rs.getInt(2));
                Size s = getSizeByID(rs.getInt(3));
                Color c = getColorByID(rs.getInt(5));
                return new ProductDetail(rs.getInt(1), p, s, rs.getInt(4), c);
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Category getCateByID(int cateID) {
        String sql = "select * from Category where cateID = ?";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand x = pd.getBrandByID(rs.getInt(2));
                return new Category(rs.getInt(1), x, rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Product getByID(int productID) {
        String sql = "select * from Product where productID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cate = getCateByID(rs.getInt(6));
                return new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), cate, rs.getInt(7), rs.getDouble(8), rs.getString(9), rs.getBoolean(10), rs.getBoolean(11));
            }
        } catch (Exception e) {

        }
        return null;
    }
    public Size getSizeByID(int id) {
        String sql = "select * from Size where sizeID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Size(rs.getInt(1), rs.getInt(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Color getColorByID(int id) {
        String sql = "select * from Color where colorID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Color(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Feedback getFeedbackByID(int feedbackID){
        AdminDAO ad = new AdminDAO();
        Feedback f = null;
        String sql = "select * from Feedback where feedbackID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedbackID);
            ResultSet rs =st.executeQuery();
            if(rs.next()){
                ProductDetail d=getProductDetailByID(rs.getInt(3));
                User u = ad.getUserByID(rs.getInt(2));
                f = new Feedback(rs.getInt(1), u, d, rs.getString(4), rs.getString(5), rs.getInt(6) , rs.getBoolean(7));
            }
        } catch (Exception e) {
        }
        return f;
    }
    public void updateStatusFeedback(int feedbackID,int stt ){
        String sql = "update Feedback set status = ? where feedbackID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stt);
            st.setInt(2, feedbackID);
            st.executeUpdate();
            
        } catch (Exception e) {
        }
    }
    
    
    PreparedStatement st;
    ResultSet rs;
    ControllUser getU = new ControllUser();
    ProductDAO getPro = new ProductDAO();

    public List<Feedback> getFeedbackList(int[] statusFeedback, int[] productID, int[] rateStar, String keySearch, int sortCondition, int page, int pageSize) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select * from Feedback f inner join ProductDetail pd\n"
                + "on f.detailID=pd.detailID\n"
                + "inner join Product p\n"
                + "on pd.productID=p.productID\n"
                + "inner join Category c\n"
                + "on p.cateID=c.cateID\n"
                + "inner join Brand b\n"
                + "on c.brandID=b.brandID\n"
                + "inner join [User] u\n"
                + "on f.userID=u.userID where 1=1";
        //xu li status
        if (statusFeedback != null) {
            sql += " and f.status in(";
            for (int i = 0; i < statusFeedback.length; i++) {
                sql += statusFeedback[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li product
        if (productID != null) {
            sql += " and p.productID in(";
            for (int i = 0; i < productID.length; i++) {
                sql += productID[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li search
        if (keySearch != null || keySearch != "") {
            sql += "and (f.comment like ? or u.fullName like ?)";
        }
        //xu li star
        if(rateStar!=null){
            sql+="and f.rateStar in (";
            for (int i = 0; i < rateStar.length; i++) {
                sql+=rateStar[i]+",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li sort
        if (sortCondition == 0) {
            sql += " order by u.fullName asc, p.productName asc, f.rateStar asc, f.status asc";
        } else {
            sql += " order by u.fullName desc, p.productName desc, f.rateStar desc, f.status desc";
        }
        sql += " offset (?-1)*? row fetch next ? rows only";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + keySearch + "%");
            st.setString(2, "%" + keySearch + "%");
            st.setInt(3, page);
            st.setInt(4, pageSize);
            st.setInt(5, pageSize);
            rs = st.executeQuery();
            while (rs.next()) {
                User account = getU.getUser(rs.getInt(2));
                ProductDetail pro = getPro.getProductDetailByID(rs.getInt(3));
                list.add(new Feedback(rs.getInt(1), account, pro, rs.getString(4), rs.getString(5), rs.getInt(6), rs.getBoolean(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalPageFB(int[] statusFeedback, int[] productID, int[] rateStar, String keySearch) {
        int count = 0;
        String sql = "select * from Feedback f inner join ProductDetail pd\n"
                + "on f.detailID=pd.detailID\n"
                + "inner join Product p\n"
                + "on pd.productID=p.productID\n"
                + "inner join Category c\n"
                + "on p.cateID=c.cateID\n"
                + "inner join Brand b\n"
                + "on c.brandID=b.brandID\n"
                + "inner join [User] u\n"
                + "on f.userID=u.userID where 1=1";
        //xu li status
        if (statusFeedback != null) {
            sql += "and f.status in(";
            for (int i = 0; i < statusFeedback.length; i++) {
                sql += statusFeedback[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li product
        if (productID != null) {
            sql += "and p.productID in(";
            for (int i = 0; i < productID.length; i++) {
                sql += productID[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        //xu li search
        if (keySearch != null || keySearch != "") {
            sql += "and (f.comment like ? or u.fullName like ?)";
        }
        if(rateStar!=null){
            sql+="and f.rateStar in (";
            for (int i = 0; i < rateStar.length; i++) {
                sql+=rateStar[i]+",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + keySearch + "%");
            st.setString(2, "%" + keySearch + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }

    
    
    public List<Product> getAllProduct() {
        String sql = "select * from Product";
        List<Product> list = new ArrayList<>();
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt(6), null, "");
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), cate, rs.getInt(7), rs.getDouble(8), rs.getString(9), rs.getBoolean(10), rs.getBoolean(11));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    public static void main(String[] args) {
        FeedbackDAO fd = new FeedbackDAO();
        ControllUser cu=new ControllUser();
//        Feedback f = fd.getFeedbackByID(6);
//        System.out.println(f.getStar());
    fd.updateStatusFeedback(3, 0);
    User x=cu.getUser(1);
    }
}
