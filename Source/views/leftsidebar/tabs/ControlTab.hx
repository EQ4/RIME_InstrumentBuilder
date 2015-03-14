package views.leftsidebar.tabs;

import models.Control;
import msignal.Signal.Signal0;
import views.instrument.controls.IControl;
import views.leftsidebar.components.ControlPropertiesComponent;
import views.leftsidebar.components.OscPropertiesComponent;

class ControlTab extends Tab {

    public var onPropertiesUpdated:Signal0;

    private var control:Control;

    private var controlProperties:ControlPropertiesComponent;
    private var oscProperties:OscPropertiesComponent;

    public function new(?control:Control) {
        super("Control");

        this.control = control;

        controlProperties = new ControlPropertiesComponent();
        onPropertiesUpdated = controlProperties.onPropertiesUpdated;
        addComponent(controlProperties);
        oscProperties = new OscPropertiesComponent();
        addComponent(oscProperties);
    }

    public function setControl(control:Control) {
        this.control = control;
        controlProperties.setControlProperties(control.properties);
        oscProperties.setProperties(control.properties);
    }
}