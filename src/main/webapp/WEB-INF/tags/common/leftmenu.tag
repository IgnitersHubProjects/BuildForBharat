<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="left_menu">
	<input type="hidden" id="active-nav-item" value="${nav}">
    <div class="collapse show" id="sidebar">
        <ul class="nav flex-column flex-nowrap overflow-hidden">
            <li class="nav-item">
                <a class="nav-link collapsed text-truncate" href="#submenu1" data-bs-toggle="collapse" data-bs-target="#submenu1"><span class="d-none d-sm-inline">Start Point </span></a>
                <div class="" id="submenu1">
                    <ul class="flex-column pl-2 nav">
                        <li data-nav="my-profile" class="nav-item">
							<input type="text" id="maxViewableDistance"
                                       name="maxViewableDistance" class="form-control"
                                       placeholder="Lat, Long"
                                       data-lat="${sku.maxViewableDistanceLat}"
                                       data-lng="${sku.maxViewableDistanceLong}"
                                       <c:if test="${not empty sku.maxViewableDistanceLat and not empty sku.maxViewableDistanceLong }"> value="${sku.maxViewableDistanceLat},${sku.maxViewableDistanceLong}" </c:if>
                                       aria-label="" aria-describedby="">                        
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>
