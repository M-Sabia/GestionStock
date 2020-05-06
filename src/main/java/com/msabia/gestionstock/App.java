package com.msabia.gestionstock;

import com.msabia.gestionstock.controller.ConnectionUi;
import com.msabia.gestionstock.model.DataBase;

import javafx.application.Application;
import javafx.stage.Stage;

/**
 * JavaFX App
 */
public class App extends Application {

    @Override
    public void start(Stage stage) {
		DataBase.setSettings("jdbc:mysql://localhost:3306/gestionstock?useSSL=true&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC","root","root");
		new ConnectionUi();
    }

    public static void main(String[] args) {
        launch();
    }

}