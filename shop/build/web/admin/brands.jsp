<%@page import="DAO.Brand_DAO"%>
<%@page import="Classes.Brands"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Classes.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.Category_DAO"%>

<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<%
    ArrayList<Brands> lstBrand = Brand_DAO.getListBrands();
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Dashboard
            <small>Quản lý danh mục</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Quản lý danh mục</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Quản lý danh mục</h3>
                        <br/>
                        <a href="BrandDetail.jsp" class="btn btn-info" style="float:right">Thêm mới</a>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 5%">STT</th>
                                    <th>Tên hãng</th>
                                    <th>Mô tả</th>
                                    <th>Logo</th>
                                    <th style="width: 10%">Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int i = 1;
                                    for (Brands br : lstBrand) {%>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=br.getName()%></td>
                                    <td><%=br.getDescription()%></td>
                                     <td><%=br.getLogo()%></td>
                                    <td>
                                        <form style="display: inline-block" action="BrandDetail.jsp" method="GET">
                                            <input type="hidden" name="BrandID" value="<%=br.getID()%>"/>
                                            <input type="submit" value="Sửa" class="btn btn-link"/>
                                        </form>
                                        |
                                        <form style="display: inline-block" action="/shop/BrandDelete" method="POST">
                                            <input type="hidden" name="ID" value="<%=br.getID()%>"/>
                                            <input type="submit" value="Xóa" class="btn btn-link"/>
                                        </form>


                                    </td>
                                </tr>
                                <%i++;
                                    }%>
                            </tbody>

                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
</div>

<!-- /.content-wrapper -->
<jsp:include page="footer.jsp"></jsp:include>