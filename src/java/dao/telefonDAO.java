/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.telefon;
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
public class telefonDAO {

    private Connector connector;
    private Connection connection;
    private telefonBataryaDAO batarya;
    
    private telefonIslemciDAO islemci;
    private telefonIsletimSistemiDAO isletimsistemi;

   
    private telefonRenkDAO renk;

    public List<telefon> findAll() {
        List<telefon> telefon_list = new ArrayList<>();
        try {
            Statement st = this.getConnection().createStatement();
            ResultSet rs = st.executeQuery("select * from telefon");
            while (rs.next()) {
                telefon tmp = new telefon();
                tmp.setTelefon_id(rs.getLong("telefon_id"));
                tmp.setTelefon_ad(rs.getString("telefon_ad"));
                tmp.setTelefon_marka(rs.getString("telefon_marka"));
                tmp.setTelefon_model(rs.getString("telefon_model"));
                tmp.setTelefon_ram(rs.getInt("telefon_ram"));
                tmp.setTelefon_ram_frekansi(rs.getDouble("telefon_ram_frekansi"));
                tmp.setTelefon_dahili_depolama(rs.getInt("telefon_dahili_depolama"));
                tmp.setTelefon_boy(rs.getInt("telefon_boy"));
                tmp.setTelefon_en(rs.getDouble("telefon_en"));
                tmp.setTelefon_agirlik(rs.getInt("telefon_agirlik"));
                tmp.setBatarya(this.getBatarya().find(rs.getLong("telefon_batarya_id")));
               
                tmp.setIslemci(this.getIslemci().find(rs.getLong("telefon_islemci_id")));
                tmp.setIsletimSistemi(this.getIsletimsistemi().find(rs.getLong("isletim_sistemi_id")));
                tmp.setRenk(this.getRenk().getRenk(tmp.getTelefon_id()));
                telefon_list.add(tmp);
            }
            getConnection().close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return telefon_list;
    }

   

    public telefonIsletimSistemiDAO getIsletimsistemi() {
        if (this.isletimsistemi == null) {
            this.isletimsistemi = new telefonIsletimSistemiDAO();
        }
        return isletimsistemi;
    }

    public telefonIslemciDAO getIslemci() {
        if (this.islemci == null) {
            this.islemci = new telefonIslemciDAO();
        }
        return islemci;
    }

    

    public telefonBataryaDAO getBatarya() {
        if (this.batarya == null) {
            this.batarya = new telefonBataryaDAO();
        }
        return batarya;
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

    public telefonRenkDAO getRenk() {
        if (this.renk == null) {
            this.renk = new telefonRenkDAO();
        }
        return renk;
    }

    public void insert(telefon telefon, Long selectEkran, Long selectBatarya, Long selectIslemci, Long selectArkaKamera, Long selectOnKamera, Long selectIsletimSistemi, List<Long> selectRenkList)  {
        try {
            Statement st = this.getConnection().createStatement();
            st.executeUpdate("insert into telefon (telefon_ad,telefon_marka,telefon_model,telefon_ekran_id,telefon_batarya_id,telefon_islemci_id,arka_kamera_id,on_kamera_id,telefon_ram,telefon_ram_frekansi,telefon_dahili_depolama,telefon_boy,telefon_en,telefon_agirlik,isletim_sistemi_id) values ("
                    + "'" + telefon.getTelefon_ad() + "','" + telefon.getTelefon_marka() + "','" + telefon.getTelefon_model() + "'," + selectEkran + "," + selectBatarya + "," + selectIslemci + ", "
                    + "" + selectArkaKamera + "," + selectOnKamera + "," + telefon.getTelefon_ram() + "," + telefon.getTelefon_ram_frekansi() + "," + telefon.getTelefon_dahili_depolama() + "," + telefon.getTelefon_boy() + ","
                    + "" + telefon.getTelefon_en() + "," + telefon.getTelefon_agirlik() + "," + selectIsletimSistemi + ")",Statement.RETURN_GENERATED_KEYS);

            Long telefon_id=null;                               
            ResultSet gk=st.getGeneratedKeys();
            if (gk.next()) {
                telefon_id=gk.getLong(1);
            }
            for (int i = 0; i < selectRenkList.size(); i++) {
                 Statement st2 = this.getConnection().createStatement();
                System.out.println("+++++++++++++++++++++++++++++");
                st2.executeUpdate("insert into telefon_renk (telefon_id,renk_id) values ("+telefon_id+","+selectRenkList.get(i)+")");
                System.out.println("/////////////////////////////////////");
            }
               
           
             getConnection().close();
            
           
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}
