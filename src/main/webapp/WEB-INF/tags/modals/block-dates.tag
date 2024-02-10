<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="access" class="com.pym.ui.utility.AccessUtility" />
<!--Block Dates Modal-->
<div class="modal fade show blockdatesModal" style="display: none" id="blockdatesModal">
  <input type="hidden" name="blockDateSKUpk">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content modal-spacebtn">
      <div class="modal-body">
        <div class="logr-form assignaditform commonform ">
          <h1 class="text-start">Block Dates</h1>
          <form></form>
        </div>
      </div>
      <div class="modal-footer justify-content-end pt-0">
        <button type="button" class="btn red-btn mw-80 cancel-block-date" data-bs-dismiss="modal">cancel</button>
      </div>
    </div>
  </div>
</div>
<div class="mb-3 row align-items-end repeating_rowinside repeating_row block-date-details" id="block-date-details" style="display: none;">
  <input type="hidden" name="blockDatepk">
  <div class=<c:choose>
    <c:when test="${access.isSuperUser()}">"col-md-3"</c:when>
    <c:otherwise>"col-md-4"</c:otherwise>
    </c:choose>> <input type="date" class="form-control" id="date" name="startDate" placeholder="DD/MM/YYYY" />
    <span class="has-error" data-error="startDate" style="display: none;"></span>
  </div>
  <div class=<c:choose>
    <c:when test="${access.isSuperUser()}">"col-md-3"</c:when>
    <c:otherwise>"col-md-4"</c:otherwise>
    </c:choose>> <input type="date" class="form-control" id="date" name="endDate" placeholder="DD/MM/YYYY" />
    <span class="has-error" data-error="endDate" style="display: none;"></span>
  </div>
  <c:if test="${access.isSuperUser()}">
    <div class="col-md-3">
      <div class="operator">
        <div class="col-sm-9">
          <select class="form-select" aria-label="Default Operator" name="operator">
            <option value="">Select</option>
            <c:if test="${not empty operators.data.results}">
              <c:forEach items="${operators.data.results}" var="operator" varStatus="loop">
                <c:choose>
                  <c:when test="${group.operator.pk != operator.pk }">
                    <option value="${operator.pk}">${operator.name}</option>
                  </c:when>
                  <c:otherwise>
                    <option value="${operator.pk}" selected="selected">${operator.name}</option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </c:if>
          </select>
          <span class="has-error" data-error="operator" style="display: none;"></span>
        </div>
      </div>
    </div>
  </c:if>
  <div class=<c:choose>
    <c:when test="${access.isSuperUser()}">"col-md-3 col-auto"</c:when>
    <c:otherwise>"col-md-4 col-auto"</c:otherwise>
    </c:choose>> <div class="add-delet-row">
      <button class="circle_icobtn addclonerow add-block-date" type="button">
        <i class="icofont-plus"></i>
      </button>
      <button class="circle_icobtn deleteclonerow delete-block-date" type="button">
        <i class="icofont-minus"></i>
      </button>
      <button type="submit" class="icon_btn circle_icon_btn save-block-date">
        <i class="icofont-save"></i>
      </button>
    </div>
  </div>
</div>