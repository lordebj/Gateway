<%@ page language="java" contentType="text/html; charset=UTF-8"
         isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>test cookie</title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            if ($.cookie("rmbUser") == "true") {
                $("#ck_rmbUser").attr("checked", true);
                $("#txt_username").val($.cookie("username"));
                $("#txt_password").val($.cookie("password"));
                var ProvinceValue=$.cookie("Province")
                //alert(a1);
                //$("#ProvinceOption").val($.cookie("ProvinceChoice"));
                //$("#ProvinceOption").find("option:contains(a1))").attr("selected",true);
                // alert(a1)
                //alert(ProvinceID)
                function display(optionID){

                    var all_options = document.getElementById("ProvinceOption").options;

                    for (i=0; i<all_options.length; i++){

                        if (all_options[i].value == ProvinceValue )  // 根据option标签的ID来进行判断  测试的代码这里是两个等号

                        {

                            all_options[i].selected = true;

                        }

                    }

                };

                display("4");

                //add before
            }
        });

        //记住用户名密码
        function Save() {
            if ($("#ck_rmbUser").attr("checked")) {
                var str_username = $("#txt_username").val();
                var str_password = $("#txt_password").val();
                //  var ProvinceChoice= document.getElementsByTagName("SELECT")[0].selectedIndex;
                //  var ProvinceChoice= document.getElementById('ProvinceOption').value;
                // var oOpt = document.getElementById("ProvinceOption");
                // var ProvinceChoice= oOpt.options[oOpt.selectedIndex].value;
                var options=$("#ProvinceOption option:selected");  //获取选中的项

                ProvinceChoice=options.val();

                alert(ProvinceChoice);

                $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
                $.cookie("username", str_username, { expires: 7 });
                $.cookie("password", str_password, { expires: 7 });
                $.cookie("Province", ProvinceChoice, { expires: 7 });
            }
            else {
                $.cookie("rmbUser", "false", { expire: -1 });
                $.cookie("username", "", { expires: -1 });
                $.cookie("password", "", { expires: -1 });
                $.cookie("ProvinceOption", ProvinceChoice, { expires: -1 });
            }
        };
        //add a new function
        function WriteHeader(){

            var options=$("#ProvinceOption option:selected");  //获取选中的项

            var ProvinceID=options.id();

            alert(ProvinceID);

            request.setRequestHeader("X-Request-Province",ProvinceID);

        };
        //add a new function
        function WriteHeaderlogin() {
            $.ajax({
                type: "GET",
                url: "login.jsp",
                beforeSend: function(request) {
                    WriteHeader();
                },
                success: function(result) {
                    alert(result);
                }
            });
        }


    </script>
</head>
<body>

<form method="POST" action="${pageContext.request.contextPath }/login">

    <div>
        用户名：<input type="text" id="txt_username"/><br />
        密码：<input type="text" id="txt_password"/><br />
    </div>
    <div>
        <SELECT NAME="city"  id="ProvinceOption">
            <option        id=     province01      value="北京">   北京    </option>
            <option         id=     province02      value="广东">   广东    </option>
            <option         id=     province03      value="山东">   山东    </option>
            <option         id=     province04      value="江苏">   江苏    </option>
            <option         id=     province05      value="河南">   河南    </option>
            <option         id=     province06      value="上海">   上海    </option>
            <option         id=     province07      value="河北">   河北    </option>
            <option         id=     province08      value="浙江">   浙江    </option>
            <option         id=     province09      value="陕西">   陕西    </option>
            <option         id=     province10      value="湖南">   湖南    </option>
            <option         id=     province11      value="重庆">   重庆    </option>
            <option         id=     province12      value="福建">   福建　  </option>
            <option         id=     province13      value="天津">   天津　  </option>
            <option         id=     province14      value="云南">   云南　  </option>
            <option         id=     province15      value="四川">   四川　  </option>
            <option         id=     province16      value="广西">   广西　  </option>
            <option         id=     province17      value="安徽">   安徽    </option>
            <option         id=     province18      value="海南">   海南    </option>
            <option         id=     province19      value="江西">   江西    </option>
            <option         id=     province20      value="湖北">   湖北    </option>
            <option         id=     province21      value="山西">   山西    </option>
            <option         id=     province22      value="辽宁">   辽宁    </option>
            <option         id=     province23      value="黑龙">   黑龙    </option>
            <option         id=     province24      value="内蒙">   内蒙    </option>
            <option         id=     province25      value="贵州">   贵州    </option>
            <option         id=     province26      value="甘肃">   甘肃    </option>
            <option         id=     province27      value="青海">   青海    </option>
            <option         id=     province28      value="新疆">   新疆    </option>
            <option         id=     province29      value="西藏">   西藏    </option>
            <option         id=     province30      value="吉林">   吉林    </option>
            <option         id=     province31      value="宁夏">   宁夏    </option>
        </SELECT>
    </div>
    <div>
        <input type="checkbox" id="ck_rmbUser"/>记住用户名和密码<br />
        <input type="submit" id="sub" value="预记录" onclick="Save()"/>
        <input type="submit" id="subok" value="登录" onclick="Writeheaderlogin()"/>
    </div>
</form>
</body>
</html>
