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
import model.Feedback;
import model.User;
import model.product.Brand;
import model.product.Category;
import model.product.Color;
import model.product.ImgOfProduct;
import model.product.Product;
import model.product.ProductDetail;
import model.product.ProductDetailX;
import model.product.Size;


public class ProductDAO extends DBContext {

//    private PreparedStatement st;
//    private ResultSet rs;
    public List<Product> listProductIter3() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p join Category c on p.cateID = c.cateID\n"
                + "join Brand b on c.brandID = b.brandID where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));

                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));

                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setProductImg(rs.getString("productImage"));
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setDiscount(rs.getDouble("discount"));
                String x=rs.getString("productDescribe");
                if(x.length()>50){
                    x=x.substring(0, 50);
                }
                p.setProductDes(x);
                p.setIsActive(rs.getBoolean("isActive"));
                p.setCate(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteProduct(String productID) {
        String sql = "delete from Product where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productID);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void insertProduct(String name, String price, String img, String des, String cateID, String quan, String dis, String create, String isSale, String isAcive) {
        String sql = "insert into Product values (?, ?, ?, ?, ?, ?, ?,?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, price);
            st.setString(3, img);
            st.setString(4, des);
            st.setString(5, cateID);
            st.setString(6, quan);
            st.setString(7, dis);
            st.setString(8, create);
            st.setString(9, isSale);
            st.setString(10, isAcive);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Product getProductByIDIter3(String id) {
        String sql = "select * from Product p join Category c on p.cateID = c.cateID"
                + " join Brand b on c.brandID = b.brandID where p.productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));

                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));

                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setProductImg(rs.getString("productImage"));
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setDiscount(rs.getDouble("discount"));
                p.setProductDes(rs.getString("productDescribe"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setIsActive(rs.getBoolean("isActive"));
                p.setInSale(rs.getBoolean("isSale"));
                p.setCate(c);
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateProduct(String id, String name, String price, String img, String des,
            String cateID, String totalQ, String isActive, String isSale, String discount) {
        String sql = "update Product set productName = ?, productPrice = ?, productImage = ?, productDescribe = ?, cateID = ?,\n"
                + "totalQuantity = ?, isActive = ?, isSale = ?, discount = ? where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, price);
            st.setString(3, img);
            st.setString(4, des);
            st.setString(5, cateID);
            st.setString(6, totalQ);
            st.setString(7, isActive);
            st.setString(8, isSale);
            st.setString(9, discount);
            st.setString(10, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> searchProductIter3(String txt) {
        String sql = "select * from Product p join Category c on p.cateID = c.cateID\n"
                + "join Brand b on c.brandID = b.brandID where p.productName like ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));

                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));

                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setProductImg(rs.getString("productImage"));
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setDiscount(rs.getDouble("discount"));
                p.setProductDes(rs.getString("productDescribe"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setIsActive(rs.getBoolean("isActive"));
                p.setInSale(rs.getBoolean("isSale"));
                p.setCate(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> sortProductIter3(int type) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p join Category c on p.cateID = c.cateID\n"
                + "join Brand b on c.brandID = b.brandID";
        if (type == 1) {
            sql += " order by p.productName desc";
        }
        if (type == 2) {
            sql += " order by p.productName asc";
        }
        if (type == 3) {
            sql += " order by (p.productPrice - p.productPrice*p.discount) desc";
        }
        if (type == 4) {
            sql += " order by (p.productPrice - p.productPrice*p.discount) asc";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));

                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));

                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setProductImg(rs.getString("productImage"));
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setDiscount(rs.getDouble("discount"));
                p.setProductDes(rs.getString("productDescribe"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setIsActive(rs.getBoolean("isActive"));
                p.setInSale(rs.getBoolean("isSale"));
                p.setCate(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCateIDIter3(int cateID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p join Category c on p.cateID = c.cateID\n"
                + "join Brand b on c.brandID = b.brandID";
        if (cateID != 0) {
            sql += " where c.cateID = " + cateID;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));

                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));

                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setProductImg(rs.getString("productImage"));
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setDiscount(rs.getDouble("discount"));
                p.setProductDes(rs.getString("productDescribe"));
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setIsActive(rs.getBoolean("isActive"));
                p.setInSale(rs.getBoolean("isSale"));
                p.setCate(c);
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCate() {
        String sql = "select * from Category c join Brand b on c.brandID = b.brandID";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));

                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductCart(String txt) {
        String query = "select * from Product where productID = ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        c,
                        rs.getInt(7),
                        rs.getDouble(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getBoolean(11),
                        1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 9 * from Product p order by p.totalQuantity desc";
//        String sql="select * from Product";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt(6), null, "");
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), cate, rs.getInt(7), rs.getDouble(8), rs.getString(9), rs.getBoolean(10), rs.getBoolean(11));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getAll() throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setProductID(rs.getInt(1));
            p.setProductName(rs.getString(2));
            list.add(p);
        }
        return list;
    }

    public Brand getBrandByID(int brandID) {
        String sql = "select * from Brand where brandID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Brand(rs.getInt(1), rs.getString(2));
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

    public ProductDetail getProductDetailScreen(int productID, int colorID, int sizeID) {
        String sql = "select * from ProductDetail where productID=? and colorID=? and sizeID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            st.setInt(3, sizeID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getByID(rs.getInt(2));
                Size s = getSizeByID(rs.getInt(3));
                Color c = getColorByID(rs.getInt(5));
                return new ProductDetail(rs.getInt(1), p, s, rs.getInt(4), c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<ProductDetail> getAllProductDetailByID(int productID) {
        String sql = "select * from ProductDetail pd inner join Size s\n"
                + "on pd.sizeID=s.sizeID inner join Color c\n"
                + "on pd.colorID=c.colorID where productID=?\n"
                + "order by s.sizeID asc";
        List<ProductDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getByID(rs.getInt(2));
                Size s = getSizeByID(rs.getInt(3));
                Color c = getColorByID(rs.getInt(5));
                list.add(new ProductDetail(rs.getInt(1), p, s, rs.getInt(4), c));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Size> getListSizeOfProduct(int productID, int colorID) {
        List<Size> list = new ArrayList<>();
        String sql = "select distinct s.sizeID,s.numberSize from Size s inner join ProductDetail pd\n"
                + "on s.sizeID=pd.sizeID where pd.ProductID=? and colorID=? and pd.quantity >0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getInt(1), rs.getInt(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getAllFeedbackByID(int productID) {
        String sql = "select * from Feedback f inner join ProductDetail pd\n"
                + "on f.detailID=pd.detailID where pd.productID=?\n"
                + "order by f.commentDate desc";
        List<Feedback> list = new ArrayList<>();
        ControllUser u = new ControllUser();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail d = getProductDetailByID(rs.getInt(3));
                User account = u.getUser(rs.getInt(2));
                list.add(new Feedback(rs.getInt(1), account, d, rs.getString(4), rs.getString(5), rs.getInt(6), rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Color> getListColorOfProduct(int productID) {
        String sql = "select distinct c.colorID,c.colorName from Color c inner join ProductDetail pd\n"
                + "on pd.colorID=c.colorID where pd.productID=?";
        List<Color> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ImgOfProduct> getAllImgOfProductDetail(int productID, int colorID) {
        List<ImgOfProduct> list = new ArrayList<>();
        String sql = "select * from ImgOfProduct where productID=? and colorID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, colorID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = getColorByID(rs.getInt(2));
                list.add(new ImgOfProduct(rs.getInt(1), c, rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(int id) {
        String sql = "select * from Product where productID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                Category cate = new Category(rs.getInt(6), null, "");
                Category cate = getCateByID(rs.getInt(6));
                return new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), cate, rs.getInt(7), rs.getDouble(8), rs.getString(9), rs.getBoolean(10), rs.getBoolean(11));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Product> getTop4Product() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 pd.productID,sum(od.quantity) as quantity,sum(od.price) as price from ProductDetail pd, OrderDetail od\n"
                + "where pd.detailID=od.detailID\n"
                + "group by pd.productID\n"
                + "order by quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductByID(rs.getInt(1));
                list.add(p);
            }
        } catch (Exception e) {

        }
        return list;
    }

    //long
    public List<Product> getProductShop() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p where isActive = 1 order by p.createAt desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                String n = rs.getString("productName");
                if(n.length() > 30){
                    n = n.substring(0, 30);
                }
                p.setProductName(n);
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setProductImg(rs.getString("productImage"));
                String d = rs.getString("productDescribe");
                if(n.length() > 50){
                    d = d.substring(0, 50);
                }
                p.setProductDes(d);
                p.setDiscount(rs.getDouble("discount"));
                p.setCreateAt(rs.getString("createAt"));
                list.add(p);
            }
//            return list;
        } catch (SQLException e) {
        }
        return list;
    }


    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Brand> listBrand() {
        List<Brand> listB = new ArrayList<>();
        String sql = "select * from Brand";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));
                listB.add(b);
            }
//            return listB;
        } catch (Exception e) {
        }
        return listB;
    }

    public List<Product> SideBarProduct(String cateID, String brandID, String priceF, String priceT, String order) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p join Category c on p.cateID = c.cateID join Brand b on b.brandID = c.brandID where 1=1 and isActive = 1";
        if (cateID != null && cateID != "") {
            sql += " and p.cateID = '" + cateID + "'";
        }
        if (brandID != null && brandID != "") {
            sql += " and b.brandID = '" + brandID + "'";
        }
        if (priceF != null && priceF != "" && priceT != null && priceT != "") {
            sql += " and (p.productPrice - p.productPrice*p.discount*0.1) between '" + priceF + "' and '" + priceT + "'";
        }
        if (order != null && order != "") {
            sql += " order by (p.productPrice - p.productPrice*p.discount*0.1) " + order;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                b.setBrandName(rs.getString("brandName"));
                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setBrand(b);
                c.setCateName(rs.getString("cateName"));
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                String n = rs.getString("productName");
                if(n.length() > 30){
                    n = n.substring(0,30);
                }
                p.setProductName(n);
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setProductImg(rs.getString("productImage"));
                String d = rs.getString("productDescribe");
                if(d.length() > 50){
                    d = d.substring(0, 50);
                }
                 p.setProductDes(d);
                 p.setCate(c);
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setDiscount(rs.getDouble("discount"));
                p.setCreateAt(rs.getString("createAt"));
                p.setIsActive(rs.getBoolean("isSale"));
                p.setInSale(rs.getBoolean("isSale"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }


    public List<Category> listCate() {
        List<Category> listC = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCateID(rs.getInt("cateID"));
                c.setCateName(rs.getString("cateName"));
                listC.add(c);
            }
//            return listC;
        } catch (Exception e) {
        }
        return listC;
    }

        public List<Product> searchSideBarShop(String txt) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p join Category c on p.cateID = c.cateID "
                + "join Brand b on c.brandID = b.brandID where isActive = 1 and p.productName like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                Category c = new Category();
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                String n = rs.getString("productName");
                if (n.length() > 30) {
                    n = n.substring(0, 30);
                }
                p.setProductName(n);
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setProductImg(rs.getString("productImage"));
                String d = rs.getString("productDescribe");
                if (d.length() > 50) {
                    d = d.substring(0, 50);
                }
                p.setProductDes(d);
                p.setCate(c);
                p.setTotalQuantity(rs.getInt("totalQuantity"));
                p.setDiscount(rs.getDouble("discount"));
                p.setCreateAt(rs.getString("createAt"));
                p.setIsActive(rs.getBoolean("isSale"));
                p.setInSale(rs.getBoolean("isSale"));
                list.add(p);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }


    public List<Product> getProductHome() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product p inner join ProductDetail pd on p.productID = pd.productID\n"
                + "inner join OrderDetail od on pd.detailID = od.detailID order by od.quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                String n = rs.getString("productName");
                if(n.length() > 30){
                    n = n.substring(0,30);
                }
                p.setProductName(n);
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setProductImg(rs.getString("productImage"));
                String d = rs.getString("productDescribe");
                if(d.length() > 50){
                    d = d.substring(0, 50);
                }
                 p.setProductDes(d);
                p.setDiscount(rs.getDouble("discount"));
                list.add(p);
            }
        } catch (Exception e) {

        }
        return list;
    }


    public List<Product> getProductNew() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product p order by p.createAt desc";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                String n = rs.getString("productName");
                if(n.length() > 30){
                    n = n.substring(0,30);
                }
                p.setProductName(n);
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setProductImg(rs.getString("productImage"));
                String d = rs.getString("productDescribe");
                if(d.length() > 50){
                    d = d.substring(0, 50);
                }
                 p.setProductDes(d);
                p.setDiscount(rs.getDouble("discount"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Product> getProductSale() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product p order by p.discount desc";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                String n = rs.getString("productName");
                if(n.length() > 30){
                    n = n.substring(0,30);
                }
                p.setProductName(n);
                p.setProductPrice(rs.getDouble("productPrice"));
                p.setProductImg(rs.getString("productImage"));
                String d = rs.getString("productDescribe");
                if(d.length() > 50){
                    d = d.substring(0, 50);
                }
                 p.setProductDes(d);
                p.setDiscount(rs.getDouble("discount"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }


    //hai new
    public List<Product> getTop5Product(String from, String to) {
        List<Product> list = new ArrayList<>();
        String sql = "select distinct top 5 pd.productID,sum(od.quantity) as quantity,sum(od.price) as price from ProductDetail pd, OrderDetail od\n"
                + "where pd.detailID=od.detailID\n"
                + "group by pd.productID\n"
                + "order by quantity desc";
        
        //neu !=null
        if (from != "" && to != "") {
            sql = "select distinct top 5 pd.productID,sum(od.quantity) as quantity,sum(od.price) as price from ProductDetail pd, OrderDetail od\n"
                    + "where pd.detailID=od.detailID and od.updateAt between ? and ?\n"
                    + "group by pd.productID\n"
                    + "order by quantity desc";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, from);
                st.setString(2, to);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Product p = getProductByID(rs.getInt(1));
                    p.setTotalQuantity(rs.getInt(2));
                    list.add(p);
                }
            } catch (Exception e) {

            }
            return list;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductByID(rs.getInt(1));
                p.setTotalQuantity(rs.getInt(2));
                list.add(p);
            }
        } catch (Exception e) {

        }
        return list;
    }

    
    //long new
    public Product productID(){
        String sql = "select top 1 * from Product order by productID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<ProductDetailX> getProductDetail(int id){
        String sql = "select * from ProductDetail where productID = ?";
        List<ProductDetailX> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                ProductDetailX pd = new ProductDetailX(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                list.add(pd);
                
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updateProductDetailX(String productID, String sizeID, String quantity){
        String sql = "update ProductDetail set quantity = ? where productID = ? and sizeID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quantity);
            st.setString(2, productID);
            st.setString(3, sizeID);
            st.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    
    public void updateProduct(String id, String name, String price, String img, String des,
            String cateID, int totalQ, String isActive, String isSale, String discount) {
        String sql = "update Product set productName = ?, productPrice = ?, productImage = ?, productDescribe = ?, cateID = ?,\n"
                + "totalQuantity = ?, isActive = ?, isSale = ?, discount = ? where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, price);
            st.setString(3, img);
            st.setString(4, des);
            st.setString(5, cateID);
            st.setInt(6, totalQ);
            st.setString(7, isActive);
            st.setString(8, isSale);
            st.setString(9, discount);
            st.setString(10, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void insertProductDetail(int productID, String size, String quantity, String color){
        String sql = "insert into ProductDetail values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setString(2, size);
            st.setString(3, quantity);
            st.setString(4, color);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void insertProduct(String name, double price, String img, String des, String cateID, double quan, String dis, String create, String isSale, String isAcive) {
        String sql = "insert into Product values (?, ?, ?, ?, ?, ?, ?,?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, price);
            st.setString(3, img);
            st.setString(4, des);
            st.setString(5, cateID);
            st.setDouble(6, quan);
            st.setString(7, dis);
            st.setString(8, create);
            st.setString(9, isSale);
            st.setString(10, isAcive);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }
    public void insertProductDetail(int productID, int size, int quantity, int color){
        String sql = "insert into ProductDetail values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setInt(2, size);
            st.setInt(3, quantity);
            st.setInt(4, color);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        List<Product> list1 = pd.getTop5Product("2022/04/05", "2022/08/01");
        System.out.println(list1.size());
    }
}
