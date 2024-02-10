<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common" %>
						<spring:url value="/resources/images" var="images" />
						<html class="no-js" lang="en">
						<common:head />


						<body>
							<div class="main-wrapper">
								<!--Header-->
								<common:navigation />
								<input type="hidden" id="latitude" value="28.679079">
								<input type="hidden" id="longitude" value="77.06971">
								<div class="userwrapper">
									<div class="user-area">
										<div class="container">
											<form id="sku-form">
												<section class="add_newinventory">
													<div class="commonform">
														<div class="row mb-4 justify-content-center">
															<div class="new_inventry_slider col-8">
																<div class="inventry_slider"
																	id="inventry_slider_images">

																</div>
															</div>
														</div>
														<div class="row" style="margin-bottom: 10px;">
															<span>For delivery person : Finds the best available path and shows approximate duration to cover the distance</span>
														</div>
														<div class="row">
															<div class="col-4">
																<div class="row mb-2 g-2 align-items-start">
																	<div class="col-4">
																		<label for="" class="col-form-label">Start
																			Point</label>
																	</div>
																	<div class="col-8">
																		<div class="input-group">
																			<input type="text" id="maxViewableDistance"
																				name="maxViewableDistance"
																				class="form-control"
																				placeholder="Source / Start"
																				data-lat="${sku.maxViewableDistanceLat}"
																				data-lng="${sku.maxViewableDistanceLong}"
																				value="" aria-label=""
																				aria-describedby="">
																			<button class="text-primary text-btn"
																				type="button"
																				id="maxViewableDistence-btn">
																				<u>Tag</u>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-4">
																<div class="row mb-2 g-2 align-items-start">
																	<div class="col-4">
																		<label for="" class="col-form-label">End Point
																		</label>
																	</div>
																	<div class="col-8">
																		<div class="input-group">
																			<input type="text" class="form-control"
																				id="mediaLocation" name="mediaLocation"
																				placeholder="Destination / End"
																				data-lat="${sku.mediaLocationLat}"
																				data-lng="${sku.mediaLocationLong}"
																				value="" aria-label=""
																				aria-describedby="">
																			<button class="text-primary text-btn"
																				type="button" id="location-btn">
																				<u>Tag</u>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-4">
																	<div class="row mb-2 g-2 align-items-start">
																		<div class="col-4"></div>
																		<div class="col-8">
																			<div class="input-group">
																				<input class="form-control" id="maxViewableDistance-disabled" disabled></div>
																			</div>
																	</div>
																</div>
																<div class="col-4">
																	<div class="row mb-2 g-2 align-items-start">
																		<div class="col-4"></div>
																		<div class="col-8">
																			<div class="input-group">
																				<input class="form-control" id="mediaLocation-disabled" disabled></div>
																			</div>
																	</div>
																</div>
															</div>
																<div class="row">
																<div class="col-4">
																	<div class="row mb-2 g-2 align-items-start">
																		<div class="col-4">
																			<label for="zip"
																				class="col-form-label">Duration</label>
																		</div>
																		<div class="col-8">
																			<input type="text" id="mvd" name="mvd"
																				class="form-control" aria-describedby=""
																				value="${sku.mvd}" placeholder="Duration"
																				disabled>
																		</div>
																	</div>
																</div>
																<div class="col-4">
																	<div class="row mb-2 g-2 align-items-start">
																		<div class="col-4">
																			<label for="zip"
																				class="col-form-label">Distance</label>
																		</div>
																		<div class="col-8">
																			<input type="text" id="aads" name="aads"
																				class="form-control" aria-describedby=""
																				value="${sku.aads}" placeholder="Distance"
																				disabled>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="row" style="margin-top: 30px;">
																	<div class="col-4">
																		<div class="row mb-2 g-2 align-items-start">
																			<div class="col-4">
																				<label for="zip"
																					class="col-form-label">Motorable
																					Path
																					Between 2 Points:</label>
																			</div>
																			<div class="col-8">
																				<button type="button"
																					name="view-motorable-path"
																					id="view-motorable-path"
																					class="btn btn-info"
																					disabled>View</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row" style="margin-top: 30px;">
																<div class="row"><span>For delivery person : Given address can be located on Map</span></div>
																<div class="row" style="margin-top: 10px;">
																	<div class="col-4">
																		<div class="row mb-2 g-2 align-items-start">
																			<div class="col-4">
																				<label for="zip"
																					class="col-form-label">Reverse-Geocoding
																					on
																					Map:</label>
																			</div>
																			<div class="col-8">
																				<input type="text" id="addresspoc"
																					name="addresspoc"
																					class="form-control"
																					aria-describedby="" value=""
																					placeholder="Maulana Azad Rd, Rajpath Area, New Delhi">
																			</div>
																			<div class="col-4">
																				<button type="button"
																					name="view-reverse-lat"
																					id="view-reverse-lat"
																					class="btn btn-info">View</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="row" style="margin-top: 30px;">
																<span>For User : Can Use Polygon / Radius base search and discover shops and places of his need. Ex. Pizza shop, grocery, etc</span>
															</div>
															<div class="row" style="margin-top: 10px;">
																<div class="col-4">
																	<div class="row mb-2 g-2 align-items-start">
																		<div class="col-4">
																			<label for="zip"
																				class="col-form-label">Polygon
																				Search:</label>
																		</div>
																		<div class="col-8">
																			<button type="button"
																				id="polygon-search-btn"
																				class="btn btn-info">Start Polygon
																				Search</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</section>
											</form>
											<div class="row">
												<span>Live Implementation : OOH Media Industry </span>
												<a href="http://www.planyourmedia.com/" target="_blank">Planyourmedia</a>
											</div>
										</div>
									</div>
								</div>
								<!--Map Modal-->
								<div class="modal fade" tabindex="-1" id="mapModal">
									<div id="mapModelChild" class="modal-dialog modal-dialog-centered modal-xl">
										<div class="modal-content modal-spacebtn">
											<div class="modal-body">
												<div id="mapFrame" style="height: 70vh"></div>
												<div class="search-container">
													<input type="text" id="searchInput"
														placeholder="Search for places...">
														<button id="searchButton" class="btn btn-primary">Search</button>
													</div>
												<div class="modal-footer justify-content-end pt-0">
													<button type="button" class="btn red-btn mw-80"
														data-bs-dismiss="modal" id="mapClose">Cancel</button>
													<button type="button" id="saveMediLoc"
														class="btn red-btn mw-80">Save</button>
												</div>
											</div>
										</div>
									</div>
									<div class="inventory-list modal-dialog modal-xl" id="inventory-holder">
										<div style="width: 100%;">
											<ul id="item-list" style="list-style: none; padding: 10px;">
											</ul>
										</div>
									</div>
								</div>

								<!--Media Pricing(Rate) Modal-->
								<div class="modal fade show" id="mediarateModal" style="display: none">
									<div class="modal-dialog modal-dialog-centered modal-lg">
										<div class="modal-content modal-spacebtn">
											<div class="modal-body">
												<div class="logr-form assignaditform">
													<h1 class="text-start">Media Pricing</h1>
													<form></form>
												</div>
											</div>
											<div class="modal-footer justify-content-end pt-0">
												<button type="button"
													class="btn red-btn mw-80 cancel-media-rate">Cancel</button>
												<button type="button" id="save-rate"
													class="btn red-btn mw-80 add-media-rate">Save</button>
											</div>
										</div>
									</div>
								</div>
								<div class="mb-3 row align-items-end rate-details" id="rate-details"
									style="display: none;">
									<div class="col">
										<label class="mb-1">Start Date</label> <input type="date" name="startDate"
											class="form-control" style="text-transform: lowercase;">
									</div>
									<div class="col">
										<label class="mb-1">End Date</label> <input type="date" name="endDate"
											class="form-control" style="text-transform: lowercase;">
									</div>
									<div class="col">
										<label class="mb-1">Rate</label> <input type="text" name="ratePerMonth"
											class="form-control" placeholder="Enter Price">
									</div>
									<div class="col col-auto">
										<div class="add-delet-row">
											<button class="circle_icobtn add-rate">
												<i class="icofont-plus"></i>
											</button>
											<button class="circle_icobtn remove-rate">
												<i class="icofont-minus"></i>
											</button>
										</div>
									</div>
									<div class="modal fade" id="mapModal" tabindex="-1" role="dialog"
										aria-labelledby="mapModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="mapModalLabel">Polygon Search Map</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div id="map" style="height: 400px;"></div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--Add Quantity Modal-->
								<div class="modal fade show" id="addqtyModal" style="display: none">
									<div class="modal-dialog modal-dialog-centered modal-xl">
										<div class="modal-content modal-spacebtn">
											<div class="modal-body">
												<div class="logr-form assignaditform">
													<h1 class="text-start">Add Quantity</h1>
													<form></form>
												</div>
											</div>
											<div class="modal-footer justify-content-end pt-0">
												<button type="button"
													class="btn red-btn mw-80 cancel-add-qty">Cancel</button>
												<button type="button" id="save-qty"
													class="btn red-btn mw-80 save-add-qty">Save</button>
											</div>
										</div>
									</div>
								</div>
								<div class="mb-3 row align-items-end qty-details" id="qty-details"
									style="display: none;">
									<div class="col">
										<label class="mb-1">Width</label> <input type="text" name="width"
											class="form-control qty-width" placeholder="Width in feet">
									</div>
									<div class="col">
										<label class="mb-1">Height</label> <input type="text" name="height"
											class="form-control qty-height" placeholder="Height in feet">
									</div>
									<div class="col">
										<label class="mb-1">Quantity</label> <input type="text" name="quantity"
											class="form-control qty-quantity" placeholder="Enter Quantity">
									</div>
									<div class="col">
										<label class="mb-1">Wrap Type</label>
										<select name="wrapType" class="form-select qty-wrap-type">
											<c:if test="${not empty wrapTypes.data.results}">
												<c:forEach items="${wrapTypes.data.results}" var="result">
													<c:choose>
														<c:when test="${result.code == sku.wrapType.code}">
															<option value="${result.code}" selected>${result.name}
															</option>
														</c:when>
														<c:otherwise>
															<option value="${result.code}">${result.name}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="col col-auto">
										<div class="add-delet-row">
											<button class="circle_icobtn add-quantity">
												<i class="icofont-plus"></i>
											</button>
											<button class="circle_icobtn remove-quantity">
												<i class="icofont-minus"></i>
											</button>
										</div>
									</div>
								</div>
								<!-- Image Slider Box -->
								<div class="inventry_slide" id="image-slider-box" style="display:none;">
									<div class="inventry_sliderbox">
										<img src="" class="image" data-filename="" />
										<div class="overlay">
											<div class="image-controls">
												<div>
													<input type="radio" name="default-image" class="default-image">
													<span class="default-image-label">Set Default</span>
												</div>
												<div>
													<a href="#" class="image-controls-icon delete-image" title="Delete">
														<i class="icofont-ui-delete"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--js-->
							</div>
							<common:js />
							<spring:url value="/resources/js/inventory.js?v=3ssss45544444ws09sss" var="inventoryjs" />
							<script src="${inventoryjs}" type="text/javascript"></script>
							<script type="text/javascript"
								src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
							<script
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnB4wn_aLqvOUUaNyiYmWJfHsAVIfniCk&libraries=marker,drawing,places&v=beta"></script>
						</body>

						</html>