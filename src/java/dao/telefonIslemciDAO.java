/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.telefonIslemci;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.Connector;

/**
 *
 * @author techn
 */
public class telefonIslemciDAO {

    private Connector connector;
    private Connection connection;

    public telefonIslemci find(Long id) {
        telefonIslemci islemci = null;
        try {
            Statement st = this.getConnection().createStatement();
            ResultSet rs = st.executeQuery("select * from telefon_islemcileri where islemci_id=" + id);
            rs.next();
            islemci = new telefonIslemci();
            islemci.setIslemci_id(rs.getLong("islemci_id"));
            islemci.setYonga_seti(rs.getString("yonga_seti"));
            islemci.setAna_islemci(rs.getString("ana_islemci"));
            islemci.setCpu_frekansi(rs.getDouble("cpu_frekansi"));
            islemci.setCpu_cekirdegi(rs.getInt("cpu_cekirdegi"));
            islemci.setIslemci_mimarisi(rs.getInt("islemci_mimarisi"));
            islemci.setBirinci_yardimci_islemci(rs.getString("birinci_yardimci_islemci"));
            islemci.setGrafik_islemcisi_gpu(rs.getString("grafik_islemcisi_gpu"));
            islemci.setGpu_frekansi(rs.getInt("gpu_frekansi"));
            islemci.setCpu_uretim_teknolojisi(rs.getInt("cpu_uretim_teknolojisi"));
            getConnection().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return islemci;
    }

    public List<telefonIslemci> findAll() {
        List<telefonIslemci> islemci_liste = new ArrayList<>();
        try {
            Statement st = this.getConnection().createStatement();
            ResultSet rs = st.executeQuery("select * from telefon_islemcileri ");
            while (rs.next()) {
                telefonIslemci tmp = new telefonIslemci();
                tmp.setIslemci_id(rs.getLong("islemci_id"));
                tmp.setYonga_seti(rs.getString("yonga_seti"));
                tmp.setAna_islemci(rs.getString("ana_islemci"));
                tmp.setCpu_frekansi(rs.getDouble("cpu_frekansi"));
                tmp.setCpu_cekirdegi(rs.getInt("cpu_cekirdegi"));
                tmp.setIslemci_mimarisi(rs.getInt("islemci_mimarisi"));
                tmp.setBirinci_yardimci_islemci(rs.getString("birinci_yardimci_islemci"));
                tmp.setGrafik_islemcisi_gpu(rs.getString("grafik_islemcisi_gpu"));
                tmp.setGpu_frekansi(rs.getInt("gpu_frekansi"));
                tmp.setCpu_uretim_teknolojisi(rs.getInt("cpu_uretim_teknolojisi"));
                islemci_liste.add(tmp);
                getConnection().close();
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return islemci_liste;
    }

    public Connector getConnector() {
        if (this.connector == null) {
            this.connector = new Connector();
        }
        return connector;
    }

    public Connection getConnection() {
        this.connection = this.getConnector().Connect();
        return connection;
    }

    public void insert(telefonIslemci islemci) {
        try {
            Statement st = getConnection().createStatement();
            st.executeUpdate("insert into telefon_islemcileri (yonga_seti,ana_islemci,cpu_frekansi,cpu_cekirdegi,islemci_mimarisi,birinci_yardimci_islemci,grafik_islemcisi_gpu"
                    + ",gpu_frekansi,cpu_uretim_teknolojisi) values ('" + islemci.getYonga_seti() + "','" + islemci.getAna_islemci() + "'," + islemci.getCpu_frekansi() + ""
                    + "," + islemci.getCpu_cekirdegi() + "," + islemci.getIslemci_mimarisi() + ",'" + islemci.getBirinci_yardimci_islemci() + "','" + islemci.getGrafik_islemcisi_gpu() + "',"
                    + ""+islemci.getGpu_frekansi()+","+islemci.getCpu_uretim_teknolojisi()+")");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
