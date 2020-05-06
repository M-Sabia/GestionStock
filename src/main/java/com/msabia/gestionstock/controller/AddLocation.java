package com.msabia.gestionstock.controller;

import java.net.URL;
import java.util.logging.Level;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.msabia.gestionstock.App;
import com.msabia.gestionstock.model.DataBase;
import com.msabia.gestionstock.model.LoggerWrapper;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.stage.Modality;
import javafx.stage.Stage;

/**
 * <b>AddLocation is the class that represents the controller of the add location window.</b>
 */
public class AddLocation {
	
	private AddMovementProduct addMovementProductCtrl;
	
	@FXML
	private TextField location_Tf;
	
	/**
	 * Default constructor.
	 */
	public AddLocation()
	{
		FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/AddLocationUi.fxml"));
		loader.setController(this);
        
        try 
        {
        	Parent root = loader.load();
    		Scene scene = new Scene(root);
    		
    		URL url = App.class.getClassLoader().getResource("style.css");
    		root.getStylesheets().clear();
    		root.getStylesheets().add(url.toURI().toString());
    		
    		Stage stage = new Stage();
    		stage.setTitle("GestionStock");
    		stage.initModality(Modality.WINDOW_MODAL);
    		stage.setScene(scene);
    		stage.centerOnScreen();
    		stage.show();
        }
        catch (Exception e)
        {
        	LoggerWrapper.getInstance().getMylogger().log(Level.SEVERE,e.toString(),e);
        }
	}
	
	/**
	 * Adds a new location to the database.
	 * 
	 * @param event
	 * 		Automatically generate when a button is clicked.
	 */
	public void addButton(ActionEvent event) {
		
		if(validInput(location_Tf.getText()))
		{
			DataBase.executionQuery(String.format("Call createLocation(\"%s\");",location_Tf.getText()));
			
			this.getAddMovementProductCtrl().selectLocationAfterAdd(location_Tf.getText());
			
			((Node)event.getSource()).getScene().getWindow().hide();
		}
	}
	
	/**
	 * Close the window.
	 * 
	 * @param event
	 * 		Automatically generate when a button is clicked.
	 */
	public void cancelButton(ActionEvent event) {
		((Node)event.getSource()).getScene().getWindow().hide();
	}
	
	/**
	 * Verifies that the value entered is not empty or only composed of white space.
	 * 
	 * @param str
	 * 		The string to check.
	 * 
	 * @return True if the conditions are satisfied, false if not.
	 */
	public boolean validInput(String str)
	{
		Pattern pattern = Pattern.compile("^\\s+$");
		Matcher matcher = pattern.matcher(str);
		
		return (str.length() != 0 && !matcher.matches());
	}
	
	/**
	 * Retrieves the controller from the add movement window.
	 * 
	 * @return The controller's instance.
	 */
	public AddMovementProduct getAddMovementProductCtrl() {
		return addMovementProductCtrl;
	}
	
	/**
	 * Sends the controller of the add movement window.
	 * 
	 * @param addMovementProductCtrl
	 * 		The controller's instance.
	 */
	public void setAddMovementProductCtrl(AddMovementProduct addMovementProductCtrl) {
		this.addMovementProductCtrl = addMovementProductCtrl;
	}
}
