
// this is used for validation (following the examples provided by the bootstrap docu in the internet)
 window.addEventListener('load', function() {
    var form = document.getElementById('needs-validation');
    form.addEventListener('submit', function(event) {
      var authorVal = document.getElementById("author").value.trim();
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      if ( (authorVal == "Danielle Steel") || (authorVal == "Roland Emmerich")){
        alert ("Yawn!!! Please choose another option ...");
        document.getElementById("authorReject").innerHTML = "I do not want to save this!!!";
        event.preventDefault();
        event.stopPropagation();        
      }
      form.classList.add('was-validated');
      addMedium();
    }, false);
  }, false);

// set the value of environment (can be "xs", "sm", "md", "lg")
var environ = getResponsiveBreakpoint();

// construct HTML-string for the element of the array media at position index 
function getStringForMedium (index) {
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
	 	retVal += " (" + media[index].Publisher + ")";
     }
	 // if minutes is not null or empty string, then display as "Length: " + value + " minutes"
     if ((media[index].Minutes != null)&& ((media[index].Minutes + ' ').trim()!='')) {
	 	retVal += "<br>Length: " + media[index].Minutes + " minutes";
     }
	 // if weight is not null or empty string, then display as "Weight: " + value + " kg"
     if ((media[index].Weight != null)&& ((media[index].Weight + ' ').trim()!='')) {
	 	retVal += "<br>Weight: " + media[index].Weight + " kg";
     }
	 // check if rating is not null, if it is a number, and not an empty string
	 if (media[index].Rating != null && !isNaN(media[index].Rating) && ((media[index].Rating + ' ').trim()!='')) {
	 	retVal  += "<br>";
	 	// display bintang as often as rating
        for (ind=0;ind<media[index].Rating;ind++) {
        	retVal  += "&#9733;";
        }
	 	retVal  += "<br>";	 	
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

// this is used for adding media
function addMedium() {
	// define variables
	var authorVal = document.getElementById("author").value.trim();
	var ratingVal = document.getElementById("rating").value;
	var minutesVal = document.getElementById("minutes").value;
	var weightVal = document.getElementById("weight").value;
	if ((authorVal == "Danielle Steel") || (authorVal == "Roland Emmerich")) {
		//alert ("Yawn!!! Please choose another option ..."); // not needed any more
    } else {
    	// define new variable. This will be added to the array media later
	    var mediumX = {
		    Title: document.getElementById("title").value,	
            Author: authorVal,
            Genre: document.getElementById("genre").value.split(","),
            Publisher: document.getElementById("publisher").value,
	        Image: document.getElementById("image").value,
	        Rating: document.getElementById("rating").value,
	        Minutes: document.getElementById("minutes").value,
	        Weight: document.getElementById("weight").value
	    }  
	    // add mediumX to array media
	    media.push(mediumX);
	    // reset of inner HTML of document.getElementById("firstPos")
	    document.getElementById("firstPos").innerHTML = "";
	    // fill document.getElementById("firstPos").innerHTML with new content
	    writeMedia();
    }
    // reset the values in the form
    resetFormValues();
 	return false;
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

// if radio button for book is selected, hide element with id minutesDiv
function showBookWeight(){
  document.getElementById('minutesDiv').style.display ='none';
  document.getElementById('afterMinutesDiv').style.display ='none';  
  document.getElementById('weightDiv').style.display = '';
  document.getElementById('afterWeightDiv').style.display = '';
  document.getElementById("minutes").value = null;
}

// if radio button for movies or songs is selected, hide element with id weightDiv
function showLength(){
  document.getElementById('minutesDiv').style.display = '';
  document.getElementById('afterMinutesDiv').style.display =''; 
  document.getElementById('weightDiv').style.display ='none';
    document.getElementById('afterWeightDiv').style.display = 'none';
  document.getElementById("weight").value = null;
}