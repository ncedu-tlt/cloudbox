/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.ncedu.tlt.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import ru.ncedu.tlt.entity.EntityFile;
import ru.ncedu.tlt.hash.HashGenerator;
import ru.ncedu.tlt.properties.PropertiesCB;

/**
 *
 * @author victori
 */
@Stateless
@LocalBean
public class EntityFileController {

    @EJB
    HashGenerator hashGenerator;
    
    Connection connection;
    
    public EntityFile createEntityFile(String fileName, Integer ownerId) {       
        
        EntityFile entityFile = new EntityFile();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());     
       
        int indexOfFileExt = fileName.lastIndexOf('.');     //индекс последнего вхождения знака '.' в имени файла           
        entityFile.setName(fileName.substring(0, indexOfFileExt));
        entityFile.setExt(fileName.substring(indexOfFileExt, fileName.length()));    
        entityFile.setDate(timestamp);        
        
        String prehash = entityFile.getName()
                    + entityFile.getExt()
                    + timestamp.toString();
        String hash = hashGenerator.getHash(prehash);
        entityFile.setHash(hash);
        
        PreparedStatement preparedStatement = null;
        String insertTableSQL = "INSERT INTO CB_FILE "
                + "(FILEID,FILENAME,FILEEXT,FILEDATE,FILEHASH,FILEUSERID)"
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
            preparedStatement = connection.prepareStatement(insertTableSQL, Statement.RETURN_GENERATED_KEYS);
            try (ResultSet keys = preparedStatement.getGeneratedKeys()) {
                keys.next();
                entityFile.setId(keys.getInt(1));
            }           
            preparedStatement.setString(2, entityFile.getName());
            preparedStatement.setString(3, entityFile.getExt());            
            preparedStatement.setString(4, timestamp.toString());
            preparedStatement.setString(5, entityFile.getHash());
            preparedStatement.setInt(6, ownerId);
            preparedStatement.executeUpdate();
            System.out.println("Record is inserted into CB_FILE table!");

        } catch (SQLException e) {
            System.out.println("ERROR! createEntityFile: " + e.getMessage());
            return null;
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
        return entityFile;
    }

    
    public boolean deleteFile(String fileID) {
        String sqlQuery = "DELETE FROM CB_FILE WHERE FILEUSERID=?";
        // а как удалять? из CB_FILE или установить метку в CB_USERFILES?       
        return true;
    }

    
    public ArrayList<EntityFile> getFilesList(String userID) throws SQLException {

        ArrayList<EntityFile> entityFileList = new ArrayList();
        
        connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
        PreparedStatement preparedStatement = null;
        
        String sqlQuery = "SELECT * FROM CB_FILE WHERE FILEUSERID = ?";
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                EntityFile entityFile = new EntityFile();
                entityFile.setId(rs.getInt("fileid"));
                entityFile.setName(rs.getString("filename"));
                entityFile.setExt(rs.getString("fileext"));
                entityFile.setDate((Timestamp)rs.getObject("filedate"));
                entityFile.setHash(rs.getString("filehash"));
                entityFileList.add(entityFile);
            }
        } catch (Exception e) {
            System.out.println("ERROR! getFilesList: " + e.getMessage());
        }
        return entityFileList;       
    }
    
    // крайне сомневаюсь, что эти методы понадобятся в том виде в котором они сейчас есть
    
    // TODO "довести до ума"
    
//    public EntityFile findFile(String fileName) throws SQLException
//    {
//        connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
//        PreparedStatement preparedStatement = null;
//        String query = "SELECT * FROM CB_FILE WHERE FILENAME = ?";
//        try {
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, fileName);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                entityFile = new EntityFile();
//                entityFile.setId(rs.getInt("FILEID"));
//                entityFile.setName(rs.getString("FILENAME"));
//                entityFile.setExt(rs.getString("FILEEXT"));
//                entityFile.setDate((Timestamp)rs.getObject("FILEDATE"));
//                entityFile.setHash(rs.getString("FILEHASH"));
//            }
//        } catch (Exception e) {
//            System.out.println("findFile " + e.getMessage());
//            return null;
//        } finally {
//            if (preparedStatement != null) {
//                preparedStatement.close();
//            }
//            if (connection != null) {
//                connection.close();
//            }
//        }
//        return entityFile;
//    }

    
//    public EntityFile findFile(Integer fileId) throws SQLException
//    {
//        EntityFile entityFile = null;
//        connection = DriverManager.getConnection(PropertiesCB.CB_JDBC_URL);
//        PreparedStatement preparedStatement = null;
//        String query = "SELECT * FROM CB_FILE WHERE FILEID = ?";
//        try {
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setInt(1, fileId);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                entityFile = new EntityFile();
//                entityFile.setId(rs.getInt("FILEID"));
//                entityFile.setName(rs.getString("FILENAME"));
//                entityFile.setExt(rs.getString("FILEEXT"));
//                entityFile.setDate((Timestamp)rs.getObject("FILEDATE"));
//                entityFile.setHash(rs.getString("FILEHASH"));
//            }
//        } catch (Exception e) {
//            System.out.println("findFile " + e.getMessage());
//            return null;
//        } finally {
//            if (preparedStatement != null) {
//                preparedStatement.close();
//            }
//            if (connection != null) {
//                connection.close();
//            }
//        }
//        return entityFile;
//    }
}