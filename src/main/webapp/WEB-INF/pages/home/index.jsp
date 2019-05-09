<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";


    DB db = new DB();
    db.open();
    ResultSet rs = db.executeQuery("SELECT * FROM ads");

%>
<%--<jsp:include page="header.jsp"></jsp:include>--%>
<%@ include file="header.jsp" %>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    .wrap {
        position: relative;
        margin: 0 auto;
    }

    .centered-btns_nav {
        position: absolute;
        top: 50%;
        z-index: 2;
        width: 38px;
        height: 61px;
        margin-top: -40px;
        line-height: 200px;
        background-image: url(<%=basePath%>static/slider/images/arrow.gif);
        overflow: hidden;
        opacity: .7;
    }

    .next {
        right: 0;
        background-position: right 0;
    }

    .centered-btns_nav:active {
        opacity: 1;
    }

    .centered-btns_tabs {
        margin-top: 15px;
        text-align: center;
        font-size: 0;
        list-style-type: none;
    }

    .centered-btns_tabs li {
        display: inline-block;
        margin: 0 3px;
        *display: inline;
        *zoom: 1;
    }

    .centered-btns_tabs a {
        display: inline-block;
        width: 9px;
        height: 9px;
        border-radius: 50%;
        line-height: 20px;
        background-color: rgba(0, 0, 0, .3);
        background-color: #ccc \9;
        overflow: hidden;
        *display: inline;
        *zoom: 1;
    }

    .centered-btns_tabs .centered-btns_here a {
        background-color: rgba(0, 0, 0, .8);
        background-color: #666 \9;
    }
</style>
<script>
    $(function () {
        $('#dowebok').responsiveSlides({
            pager: true,
            nav: true,
            namespace: 'centered-btns',
        });
    });
</script>


<div class="wrap container">
    <ul class="rslides" id="dowebok">
        <%
            while (rs.next()) {
        %>

        <li><a href="<%=rs.getString("url") %>" target="_blank">
            <img style="height:350px;" src="<%=basePath %><%=rs.getString("thumb") %>" alt=""></a></li>
        <% } %>

    </ul>
    <div class="abc"></div>
</div>


<!-- content-section-starts -->
<div class="content">
    <div class="container">
        <div class="brand">
            <div class="col-md-8 main">
                <a href="<%=basePath %>app/showNews?id=${n1.id}">
                    <img src="<%=basePath %>${n1.thumb}" style="width:760px;height:451px;" alt=""/>
                </a>
            </div>
            <div class="col-md-4 sub">
                <a href="<%=basePath %>app/shop?id=${g1.id}">
                    <img style="width:325px;height:206px;" src="<%=basePath %>${g1.thumb}" alt=""/>
                </a>
                <div class="add-to-cart">
                    <p>${g1.product_name}</p>
                    <form action="" class="sky-form">
                        <fieldset>
                            <section>
                                <div class="rating">
                                    <input type="radio" name="stars-rating" id="stars-rating-5">
                                    <label for="stars-rating-5"><i class="icon-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-4">
                                    <label for="stars-rating-4"><i class="icon-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-3">
                                    <label for="stars-rating-3"><i class="icon-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-2">
                                    <label for="stars-rating-2"><i class="icon-star"></i></label>
                                    <input type="radio" name="stars-rating" id="stars-rating-1">
                                    <label for="stars-rating-1"><i class="icon-star"></i></label>
                                    <div class="clearfix"></div>
                                </div>
                            </section>
                        </fieldset>
                    </form>
<%--                    <span>￥${g1.price }</span>--%>
                    <button onclick="javascript:location.href='<%=basePath %>app/shop?id=${g2.id}';"
                            class="cart-button">
                        <i class="white-cart"></i>
                        <span>| 点击购买</span>
                    </button>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="watch-and-buy">
            <div class="select">
                <h2>watch & <br> Buy</h2>
            </div>
            <div class="preview">
                <a href="<%=basePath %>app/shop?id=${g2.id}">
                    <img style="width:307px;height:256px;" src="<%=basePath %>${g2.thumb}" alt=""/>
                </a>
                <i class="bag"></i></a>
            </div>
            <div class="preview"><a href="<%=basePath %>app/shop?id=${g3.id}">
                <img style="width:307px;height:256px;" src="<%=basePath %>${g3.thumb}" alt=""/>
                <i class="bag"></i></a>
            </div>
            <div class="preview span_66"><a href="<%=basePath %>app/shop?id=${g4.id}">
                <img style="width:307px;height:256px;" src="<%=basePath %>${g4.thumb}" alt=""/>
                <i class="bag"></i>
            </a>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="sap_tabs">
            <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                <ul class="resp-tabs-list">
                    <li class="resp-tab-item" style="width:100%;" aria-controls="tab_item-2" role="tab">
                        <span>热门家居</span></li>

                    <div class="clearfix"></div>
                </ul>
                <div class="resp-tabs-container">
                    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                        <ul class="tab_img">

                            <c:forEach items="${requestScope.glist }" var="u" varStatus="st">
                                <li>
                                    <div class="view view-first">
                                        <a href="<%=basePath %>app/shop?id=${u.id}">
                                            <img style="height:300px;" src="<%=basePath %>${u.thumb}"
                                                 class="img-responsive" alt=""/>
                                        </a>
                                        <!-- <div class="info1"><h4>hot</h4> </div>-->
                                        <div class="mask">

                                        </div>
                                        <div class="tab_desc">
                                            <div class="tab_desc_1">
                                                <h5><a href="<%=basePath %>app/shop?id=${u.id}">
                                                        ${u.product_name }
                                                </a>
                                                </h5>
                                            </div>
                                            <div class="tab_desc_2">
                                                <p>￥${u.price }</p>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>

                                    </div>
                                    <img src="<%=basePath %>static/home/images/rating.png" alt=""/>
                                </li>
                            </c:forEach>


                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shipping">
        <div class="container">
            <div class="shipping-section-grid">
                <div class="col-md-7 shipping-left-grid">
                    <h3>
                        <a href="<%=basePath %>app/showNews?id=${n2.id}">
                            ${n2.title }</a></h3>
                    <div class="icon">
                        <img style="width:100px;height:50px;" src="<%=basePath %>${n2.thumb}" alt=""/>
                    </div>
                    <div class="icon-text">
                        <p>
                            ${n2.description }
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-5 shipping-right-grid">
                    <h3>搜索信息</h3>
                    <div class="news-search-box">
                        <form action="<%=basePath %>goods/searchView">
                            <input type="text" class="text" name="name" onfocus="this.value = '';"
                                   onblur="if (this.value == '') {this.value = '';}">
                            <input type="submit" value>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function(){
        $.ajax({
            url:'/notice/searchByUser',
            success: function (rsp) {
                $.each(
                    rsp,
                    function (n,v) {
                        $('#notice').append('<li class="dropdown-header text-center"><a style="color:#10c7bf" href="<%=basePath %>goods/searchView?delete=Y&name=' + v.title + '">' + v.title + '</a></li>');
                        $('#noticeUl').show();
                    }
                )
            }
        });

        $('#noticeUl').click(function () {
            $('#notice').toggle();
        });
    };

</script>
<!-- content-section-ends -->
<jsp:include page="footer.jsp"></jsp:include>