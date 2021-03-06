/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.ncedu.tlt.controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.sql.DataSource;
import ru.ncedu.tlt.entity.User;
import ru.ncedu.tlt.entity.UserRole;

/**
 *
 * @author Andrew
 */
@Stateless
@LocalBean
public class RoleController {

    @Resource(name = "jdbc/CBDataSource", type = javax.sql.ConnectionPoolDataSource.class)
    private DataSource dataSource;

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    public RoleController() {
    }

    /**
     *
     * @param userRoles
     * @param user
     * @return
     */
    public ArrayList<UserRole> setAndCreateUserRole(ArrayList<UserRole> userRoles, User user) {
        //Проверка на пустоту
        if (userRoles == null) {
            return new ArrayList<>();
        }
        if (userRoles.isEmpty()) {
            return userRoles;
        }

        String insertTableSQL = "INSERT INTO CB_USERROLE (UR_USERID, UR_ROLEID) VALUES (?,?)";

//        for (int i = 0; i < userRoles.size() - 1; i++) {
//            insertTableSQL.append(", (?,?)");
//        }
        try {
            connection = dataSource.getConnection();
//            connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
            preparedStatement = connection.prepareStatement(insertTableSQL);

//            connection.setAutoCommit(false);
            for (UserRole role : userRoles) {
                System.out.println("role is " + role.toString());
                preparedStatement.setInt(1, user.getId());
                preparedStatement.setInt(2, role.getId());
                preparedStatement.execute();
//                preparedStatement.addBatch();
            }

//            preparedStatement.executeBatch();
//            connection.commit();
//            connection.setAutoCommit(true);
        } catch (Exception ex) {
            System.out.println("RoleController - createUserRole: "+ex.getMessage());
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return userRoles;
    }

    public List<UserRole> getUserRoles(User user) {
        List<UserRole> roles = new ArrayList<>();
        UserRole role;
        if(user.getId()==null) 
        {
            user.setId(-1);
        }
        String query = "SELECT CB_USERROLE.UR_ROLEID, CB_ROLE.ROLELABEL "
                + "FROM CB_USERROLE "
                + "INNER JOIN CB_ROLE ON CB_USERROLE.UR_ROLEID = CB_ROLE.ROLEID "
                + "WHERE UR_USERID = ? "
                + "ORDER BY ROLEID";
        try {
            connection = dataSource.getConnection();
//            connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, user.getId());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                role = new UserRole();
                role.setId(rs.getInt(1));
                role.setName(rs.getString(2));
                roles.add(role);
            }
        } catch (Exception e) {
            System.out.println("UserController - getUserRoles " + e.getMessage());
            if (roles.isEmpty()) {
                role = new UserRole();
                role.setId(-1);
                roles.add(role);
            }
          return roles;
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        if (roles.isEmpty()) {
            role = new UserRole();
            role.setId(-1);
            roles.add(role);
        }

        return roles;
    }

//------
    public List<UserRole> getAllUserRoles() throws SQLException {
        UserRole role;
        ArrayList<UserRole> rolesList = new ArrayList<>();
        connection = dataSource.getConnection();
//        connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
        preparedStatement = null;
        String query = "SELECT ROLEID, ROLELABEL FROM CB_ROLE ORDER BY ROLEID";
        try {
            preparedStatement = connection.prepareStatement(query);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                role = new UserRole();
                role.setId(rs.getInt("ROLEID"));
                role.setName(rs.getString("ROLELABEL"));
                rolesList.add(role);
            }
        } catch (Exception e) {
            System.out.println("getAllRoles " + e.getMessage());
            return null;
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return rolesList;
    }
    
    
}
