<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JPG</title>
</head>
<body>
<script src="/MyWeb/js/jquery3.5.1.min.js"></script>
<img id="pic1" src="/MyWeb/images/cups.jpg" width="640" height="360"/>
<script>
  var count=0;
  
  window.setInterval(function(){
      count++;
      $.get("/MyWeb/PictureServlet",{"id":count},function (path){
  	    $("#pic1").attr("src", path);
      });
  }, 1500);
</script>
</body>
</html>