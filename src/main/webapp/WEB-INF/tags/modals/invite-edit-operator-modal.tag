<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade show invite-update-operator-modal" style="display: none">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-spacebtn">
            <div class="modal-body">
                <div class="logr-form assignaditform">
                    <h1 class="text-start modal-heading">Invite Operator</h1>
                    <form id="invite-operator-form">
                        <input type="hidden" name="pk"/>
                        <div class="mb-3 row">
                            <div class="col col-12">
                                <input type="text" name="name" class="form-control" placeholder="Name*">
                                <span class="has-error" data-error="name" style="display: none;"></span>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <div class="col col-12">
                                <input type="text" name="email" class="form-control" placeholder="Business Email*">
                                <span class="has-error" data-error="email" style="display: none;"></span>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <div class="col col-3">
                                <select class="form-select" name="callingCode">
                                    <c:if test="${not empty callingcodes.data.results}">
                                        <c:forEach items="${callingcodes.data.results}" var="result">
                                            <option value="${result.callingCode}">${result.callingCode}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                <span class="has-error" data-error="callingCode" style="display: none;"></span>
                            </div>
                            <div class="col col-9">
                                <input type="text" name="contactNo" class="form-control" placeholder="Mobile*">
                            </div>
                            <span class="has-error" data-error="contactNo" style="display: none;"></span>
                        </div>
                        <div class="mb-3 row">
                            <div class="col col-12 d-flex justify-content-end">
                                <div class="fw-bold">
                                    Status*
                                </div>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input type="radio" name="active" value="true" id="activestatus" checked>
                                        <label class="fw-normal" for="activestatus">
                                            Active
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" name="active" value="false" id="inactivestatus">
                                        <label class="fw-normal" for="inactivestatus">
                                            InActive
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <span class="has-error" data-error="active" style="display: none;"></span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer justify-content-center pt-0">
                <button type="button" class="btn btn-secondary red-btn mw-80 operator-modal-close">Cancel</button>
                <button type="button" class="btn btn-primary red-btn mw-80 invite-update-operator">Invite Operator</button>
            </div>
        </div>
    </div>
</div>
