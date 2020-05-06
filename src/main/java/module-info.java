module com.gestionstock.escapp {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.logging;
    requires java.sql;
    requires java.desktop;
    requires com.google.zxing;
    requires com.google.zxing.javase;
    requires com.jfoenix;
    exports com.msabia.gestionstock;
    opens com.msabia.gestionstock.controller;
    opens com.msabia.gestionstock.model;
}