
// set the value of environment (can be "xs", "sm", "md", "lg")
var environ = getResponsiveBreakpoint();

// construct HTML-string for the element of the array media at position index 
function getStringForMedium (index) {
	console.log(media[index]);
	var retVal = 
	// open divs (was using copy+paste of real HTML...)
	    "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-6\">" 
	    + "     <div class=\"video\">"
	    // add the image URL
	    + "          <img src=\"" 
	    + media[index].Image 
	    + "\" height=180px></img><br>" 
	    // add the title (markup <h4>)
	    + "<h4> " + media[index].Title + " </h4>" 
	    // prepare display of genre; display the genres in blue.  
	    + "Genre: <span style=\"color: blue;\">" + media[index].Genre + "</span><br>"
	     // prepare display of author in red.
	    + "<span style=\"color: red;\">" + media[index].Author + "</span>";
	 // if publisher is not null or empty string, then display aside of author (enclosed in brackets)
	 if ((media[index].Publisher != null)&& ((media[index].Publisher + ' ').trim()!='')) {
	 	retVal += " (" + media[index].Publisher ;
	 	if ((media[index].ISBN != null)&& ((media[index].ISBN + ' ').trim()!='')) {
	 	    retVal += ",<br>ISBN: " + media[index].ISBN +")";	 		
	 	} else  retVal += ")<br>&nbsp;";
	 
     }
	 
	 
	 // close divs   
     retVal  += "      </div>" + "       </div>";
	 return retVal;

}

// construct a string variable. After construction, append this variable to document.getElementById("firstPos").innerHTML
function writeMedia() {
	var stringVar = "<div class=\"row\"><h1 class=\"col-md-12 mt-2 mb-2\">Media</h1></div>";
	for (index = 0; index <media.length; index++) {
		// if mobile, then insert "<div class=\"row row-videos\">"
		// if not mobile, then insert this only after every third element
		if (isMobileDevice() || ((index % 3) == 0)) stringVar += "<div class=\"row row-videos\">";
		// append the HTML for the data at position index in the array media
		stringVar += getStringForMedium(index);
		// if mobile, then close the div opened above
		// if not mobile, then close div only after every third element
		if (isMobileDevice() || ((index % 3) == 2)) stringVar  += "</div>";
	}
	// close not yet closed divs
	if (!isMobileDevice() && ((index % 3) != 2)) stringVar += "</div>";
	// append to document.getElementById("firstPos").innerHTML
	document.getElementById("firstPos").innerHTML +=  stringVar;
}

function isMobileDevice() {
	// if environ (which is set in the beginning) is "md", then it is mobile device; otherwise return false
	return (environ == "md");
}
// taken from Stackoverflow
// URL https://stackoverflow.com/questions/14441456/how-to-detect-which-device-view-youre-on-using-twitter-bootstrap-api
/**
 * Detect and return the current active responsive breakpoint in Bootstrap
 * @returns {string}
 */
function getResponsiveBreakpoint() {
    var envs = ["xs", "sm", "md", "lg"];
    var env = "";

    var $el = $("<div>");
    $el.appendTo($("body"));

    for (var i = envs.length - 1; i >= 0; i--) {
        env = envs[i];
        $el.addClass("d-" + env + "-none");
        if ($el.is(":hidden")) {
            break; // env detected
        }
    }
    $el.remove();
    return env;
}


 // reset the values in the form
function resetFormValues() {
	document.getElementById("title").value = "";	
    document.getElementById("author").value = "";
    document.getElementById("genre").value = "";
    document.getElementById("publisher").value = "";
	document.getElementById("image").value = "";
	document.getElementById("rating").value = "";
	document.getElementById("minutes").value = "";
	document.getElementById("weight").value = "";
}

