<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade show access-denied" style="display: none">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-spacebtn">
            <div class="modal-body">
                <div class="modal-title">
                    You don't have the authority to perform this operation.
                </div>
            </div>
            <div class="modal-footer justify-content-center pt-0">
            	<button type="button" class="btn btn-secondary red-btn mw-80 cancel-action" >Close</button>
            </div>
        </div>
    </div>
</div>