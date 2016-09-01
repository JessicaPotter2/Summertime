  var req = null; 
        function test() { 
                //初始化 
                var ClassName = document.all.ClassName.value; 
                var PassWord = document.all.PassWord.value;
                var Email = document.all.Email.value;
                req = new ActiveXObject("Microsoft.XMLHTTP"); 
                //设置属性，当后台处理完成后，回来调用myDeal方法。 
                req.onreadystatechange = myDeal; 
                //发出请求 
                req.open("GET", "c.jsp?ClassName=" + ClassName + "&PassWord=" + PassWord+ "&Email=" + Email, "false"); 

                req.send(null); 
        } 
        function myDeal() { 
                if (req.readyState == 4) { 
                        //接收服务端返回的数据 
                        var ret = req.responseText; 
                        //处理数据 
                        document.all("myDiv").innerHTML = ret; 
                } 
        } 
