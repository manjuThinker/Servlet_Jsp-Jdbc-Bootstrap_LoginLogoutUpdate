/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package blog.dao;

import blog.entities.User;
import java.sql.*;

public class Userdao {

    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }

    public boolean SaveUser(User user) {

        boolean f = false;
        try {
            String query = "INSERT INTO register (name, password, email,gender,about)"
                    + " VALUES (?,?,?,?,?);";

            PreparedStatement ptsmt = this.con.prepareStatement(query);
            ptsmt.setString(1, user.getName());
            ptsmt.setString(2, user.getPassword());
            ptsmt.setString(3, user.getEmail());
            ptsmt.setString(4, user.getGender());
            ptsmt.setString(5, user.getAbout());

            ptsmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from register where email=? and password=?";
            PreparedStatement ptstmt = this.con.prepareStatement(query);
            ptstmt.setString(1, email);
            ptstmt.setString(2, password);

            ResultSet rs = ptstmt.executeQuery();

            if (rs.next()) {
                user = new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setAbout(rs.getString("about"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
       boolean b=false;
        try {
            // assuming you have established a JDBC connection and created a Statement object called "statement"
            String sql = "UPDATE register SET name=?, email=?, password=?, about=? WHERE id=?";
            PreparedStatement preparedStatement = this.con.prepareStatement(sql);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getAbout());
            preparedStatement.setInt(5, user.getId());
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
              b=true;
            } else {
                b=false;
            }

          
        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;

    }
}
