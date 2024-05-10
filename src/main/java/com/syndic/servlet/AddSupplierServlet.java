package com.syndic.servlet;

import com.syndic.beans.Supplier;
import com.syndic.connection.Syndic_con;
import com.syndic.dao.SupplierDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class AddSupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Connection connection;

    public void init() {
        connection = Syndic_con.getConnection();
        if (connection != null) {
            System.out.println("Connexion à la base de données établie avec succès.");
        } else {
            System.out.println("Échec de la connexion à la base de données.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (connection == null) {
            return;
        }

        List<Supplier> suppliers;
        SupplierDAOImpl supplierDAO = new SupplierDAOImpl(connection);
        suppliers = supplierDAO.getAllSuppliers();
        req.setAttribute("suppliers", suppliers);

        RequestDispatcher dispatcher = req.getRequestDispatcher("addsupplier.jsp");
        dispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String supplier_name = req.getParameter("supplier_name");
        String supplier_email = req.getParameter("supplier_email");
        String supplier_phone = req.getParameter("supplier_phone");
        String supplier_type = req.getParameter("supplier_type");
        boolean supplier_active = Boolean.parseBoolean(req.getParameter("supplier_active"));
        String supplier_rating = req.getParameter("supplier_rating");
        int supplier_s_id = Integer.parseInt(req.getParameter("supplier_s_id"));

        Supplier supplier = new Supplier();

        supplier.setSupplier_name(supplier_name);
        supplier.setSupplier_email(supplier_email);
        supplier.setSupplier_phone(supplier_phone);
        supplier.setSupplier_type(supplier_type);
        supplier.setSupplier_active(supplier_active);
        supplier.setSupplier_rating(supplier_rating);
        supplier.setSupplier_s_id(supplier_s_id);



        // Insérer le paiement dans la base de données
        SupplierDAOImpl supplierDAO = new SupplierDAOImpl(connection);
        boolean success = supplierDAO.insertSupplier(supplier);

        if (success) {
            HttpSession session = req.getSession();
            session.setAttribute("successMessage", "un  fournisseur a été ajouté avec succès !");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("errorMessage", "Une erreur s'est produite lors de l'ajout d'un fournisseur.");
        }
        resp.sendRedirect(req.getContextPath() + "/addsupplier");
    }
}

