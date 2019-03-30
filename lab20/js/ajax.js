

function getRequestObject() {
  // Asynchronous objec created, handles browser DOM differences

  if(window.XMLHttpRequest) {
    // Mozilla, Opera, Safari, Chrome, IE 7+
    return (new XMLHttpRequest());
  }
  else if (window.ActiveXObject) {
    // IE 6-
    return (new ActiveXObject("Microsoft.XMLHTTP"));
  } else {
    // Non AJAX browsers
    return(null);
  }
}

function sendRequest(){

   var JQUERY = 1;
   
   if (JQUERY == 1) {
       
       $.get( "controller.php", { pattern: document.getElementById('userInput').value })
          .done(function( data ) {
              var ajaxResponse = document.getElementById('ajaxResponse');
              ajaxResponse.innerHTML = data;
              ajaxResponse.style.visibility = "visible";
              M.AutoInit();
          });
       
   } else {
       
       request=getRequestObject();
       if(request!=null)
       {
         var userInput = document.getElementById('userInput');
         var url='controller.php?pattern='+userInput.value;
         request.open('GET',url,true);
         request.onreadystatechange = 
                function() { 
                    if((request.readyState==4)){
                        // Asynchronous response has arrived
                        var ajaxResponse=document.getElementById('ajaxResponse');
                        ajaxResponse.innerHTML=request.responseText;
                        ajaxResponse.style.visibility="visible";
                        //M.AutoInit();
                    }     
                };
         request.send(null);
       }
       
   }
   
}

function sendRequest2(){
   $.get( "controller.php", { numDebt: document.getElementById('userInput2').value })
      .done(function( data ) {
          var ajaxResponse2 = document.getElementById('ajaxResponse2');
          ajaxResponse2.innerHTML = data;
          ajaxResponse2.style.visibility = "visible";
          M.AutoInit();
      });
}

function selectValue() {
   var list=document.getElementById("list");
   var userInput2=document.getElementById("userInput");
   var ajaxResponse2=document.getElementById('ajaxResponse');
   userInput2.value=list.options[list.selectedIndex].text;
   ajaxResponse2.style.visibility="hidden";
   userInput.focus();
}

function selectValue2() {
   var list=document.getElementById("list2");
   var userInput=document.getElementById("userInput2");
   var ajaxResponse2=document.getElementById('ajaxResponse2');
   userInput.value=list.options[list.selectedIndex].text;
   ajaxResponse2.style.visibility="hidden";
   userInput.focus();
}
