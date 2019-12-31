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
	<form action="all" method="post">
		<input name="pageNum" value="1" type="hidden">
		商品模糊:<input name="key" value="${m.key}">
		<input type="submit">
	</form>
	<table>
		<tr>
			<td>选择框</td>
			<td>商品名称</td>
			<td>英文名称</td>
			<td>商品品牌</td>
			<td>商品种类</td>
			<td>尺寸</td>
			<td>单价（元）</td>
			<td>数量</td>
			<td>标签</td>
			<td>图片</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${page.list}" var="l">
			<tr>
			<td><input type="checkbox" value="${l.id}" class="ck"></td>
			<td>${l.bname}</td>
			<td>${l.kname}</td>
			<td>${l.rname}</td>
			<td>${l.dname}</td>
			<td>${l.chi}</td>
			<td>${l.price}</td>
			<td>${l.count}</td>
			<td>${l.biao}</td>
			<td><img alt="xxx" style="width: 80px; height: 50px;" src="looking?path=${l.address}"></td>
			<td>
				<input type="button" value="删除" onclick="del(${l.id})">
				<a href="show.jsp?id=${l.id}"><input type="button" value="详情"></a>
				<a href="update.jsp?id=${l.id}"><input type="button" value="修改"></a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="15">
				<input type="button" onclick="getPage(1)" value="首页">
				<input type="button" onclick="getPage(${page.pageNum-1})" value="上一页">
				第${page.pageNum}页/共${page.pages}页
				<input type="button" onclick="getPage(${page.pageNum+1})" value="下一页">
				<input type="button" onclick="getPage(${page.pages})" value="尾页">
				<input type="button" onclick="plsc()" value="批删">
				<a href="add.jsp"><input type="button" value="添加"></a>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		function getPage(p){
			$("[name=pageNum]").val(p);
			$("form").submit();
		}
		
		function plsc(){
			var id="";
			$(".ck:checked").each(function(){
				id+=","+$(this).val();
			});
			
			ids=id.substring(1);
			
			if(ids==""){
				alert("请选择数据");
			}else{
				if(confirm("确定要删除吗")){
					location="del?ids="+ids;
				}
			}
		}
		
		function del(ids){
			if(confirm("确定要删除吗")){
				location="del?ids="+ids;
			}
		}
	</script>
</body>
</html>