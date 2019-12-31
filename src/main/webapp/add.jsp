<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" href="css/css.css">
</head>
<body>

	<form action="save" method="post" enctype="multipart/form-data">
		<table>
			<tr>
			<td>商品名称:<input name="bname"></td>
			</tr>
			<tr>
			<td>英文名称:<input name="kname"></td>
			</tr>
			<tr>
			<td>商品品牌:<select name="bid"></select></td>
			</tr>
			<tr>
			<td>商品种类:<select name="kid"></select></td>
			</tr>
			<tr>
			<td>尺寸:<input name="chi"></td>
			</tr>
			<tr>
			<td>单价（元）:<input name="price"></td>
			</tr>
			<tr>
			<td>数量:<input name="count"></td>
			</tr>
			<tr>
			<td>标签:<input name="biao"></td>
			</tr>
			<tr>
			<td>图片:<input name="myfile" type="file"></td>
			</tr>
		</table>
		<input type="submit">
	</form>
	<script type="text/javascript">
	$.post("allb",function(num){
		for ( var i in num) {
			$("[name=bid]").append("<option value="+num[i].id+">"+num[i].name+"</option>");
		}
	},"json");
	$.post("allk",function(num){
		for ( var i in num) {
			$("[name=kid]").append("<option value="+num[i].id+">"+num[i].name+"</option>");
		}
	},"json");
	</script>
</body>
</html>