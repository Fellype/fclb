'use strict';

// Changes the font icon display based on the selection
function nfw_icon_change(obj) {
    document.getElementById("nfw_selected_icon").className = obj.className;
    document.getElementById('nfw_icon_input').value = obj.className;
}

// Removes the icon the selected icon
function nfw_icon_clear_selection() {
    document.getElementById("nfw_selected_icon").className = "";
    document.getElementById('nfw_icon_input').value = "";
    return false;
}

// Displays the selected icon
function nfw_selected_icon_display() {
    document.getElementById("nfw_selected_icon").className = document.getElementById('nfw_icon_input').value;
}

// Radio style selection for icon box
function nfw_radio_style_option(obj) {
    document.getElementById('nfw_selected_radio_style').value = obj.value;
}
