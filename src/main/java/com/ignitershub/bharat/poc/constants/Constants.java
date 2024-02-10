package com.ignitershub.bharat.poc.constants;

public interface Constants {

	public interface Access {
		String AGENCY = "agency";
		String ADVERTISER = "advertiser";
		String OPERATORADMIN = "operatoradmin";
		String UID = "uid";
		String ROLE = "role";
		String ACCESSES = "accesses";
		String TYPE = "type";
		String ANONYMOUS = "anonymous";
		String USER = "user";
		String SUPERUSER = "superuser";
		String CUSTOMER = "customer";
		String DELETE = "delete";
		String EDIT = "edit";
		String APPROVE = "approve";
		String CREATE = "create";
		String READ = "read";
		String SESSION_USER_INFO = "sessionUserInfo";
	}

	public interface QueryComparator {
		String ISEMPTY = "is_empty";
		String ISNOTEMPTY = "is_not_empty";
		String ISNOTNULL = "is_not_null";
		String ISNULL = "is_null";
		String EQUALS = "equals";
		String NOTEQUALS = "not_equals";
		String ANYWHERE = "anywhere";
		String STARTSWITH = "starts_with";
		String LESSTHAN = "less_than";
		String GREATERTHAN = "greater_than";
		String LESSTHANOREQUAL = "less_than_or_equal";
		String GREATERTHANOREQUAL = "greater_than_or_equal";
		String CONTAINS = "contains";
		String NOTCONTAINS = "not contains";
	}

	public interface API {
		String X_REQUESTED_WITH = "X-Requested-With";
		String XML_HTTP_REQUEST = "XMLHttpRequest";
		String TOKEN = "token";
		String UNAUTHORIZED = "UNAUTHORIZED";
		String ERROR = "error";
		String REFRESH_TOKEN = "refreshToken";
		String BEARER = "Bearer ";
	}

	public interface Page {
		String HOME = "home";
		String LOGIN = "login";
		String REGISTER = "register";
		String PRODUCT_DETAILS = "product-details";
		String SEARCH = "search";
		String CHECKOUT = "checkout";
		String ORDER_CONFIRMATION = "order-confirmation";
		String ORDER_DETAILS = "order-details";
		String MY_PROFILE = "my-profile";
		String CANCELLATION_GROUP = "cancellation-group";
		String CUSTOMER_GROUP = "customer-group";
		String PRICING_GROUP = "pricing-group";
		String PRICING_GROUP_UPSERT = "pricing-group-upsert";
		String PAYMENT_GROUP = "payment-group";
		String INVENTORY_LIST = "inventory-list";
		String BULK_UPLOAD="inventory-bulk-upload";
		String PENDING_INVENTORY_LIST = "pending-inventory-list";
		String INVENTORY = "inventory";
		String CANCELLATION_PAGE = "cancellation-page";
		String CUSTOMER_PAGE = "customer-group-page";
		String PAYMENT_PAGE = "payment-group-page";
		String USER_AND_ROLES = "users-and-roles";
		String ACCOUNTING_SETTING = "accounting-setting";
		String ERROR = "error";
		String CUSTOMER_MASTER = "customer-master";
		String PLANNING_TOOL = "planning-tool";
		String CMS = "cms";
		String WISHLIST = "wishlist";
		String CART = "cart";
		String RFP = "rfp";
		String ORDER_PLACED_LIST = "order-placed-list";
		String ORDER_PLACED = "order-placed";
		String ORDER_RECEIVED_LIST = "order-received-list";
		String ORDER_RECEIVED = "order-received";
		String BLOCK_DATES = "block-dates";
		String ORDER_SUMMARY = "orderSummary";
		String INVENTORY_OVERVIEW = "inventory-overview";
	}

	public interface URL {
		String REDIRECT = "redirect:";
		String ROOT = "/";
		String ERROR = "/error";
		String LOGIN = "/login";
		String LOGOUT = "/logout";
		String SESSION_USER = "/session-user";
		String REGISTER = "/register";
		String RESET_PASSWORD = "/reset-password";
		String MY_PROFILE = "/my-profile";
		String PLANNING_TOOL = "/planning-tool";
		String CMS = "/cms/{page}";
		String ISOENTITY_ENTRY_POINT = "/iso";
		String REDIRECT_MY_PROFILE = "redirect:/my-profile";
		String SUBSCRIBE = "/subscribe";
		String INVENTORY_OVERVIEW = "/inventory-overview";

		public interface PDP {
			String INDEX = "/p";
			String GET = "/{code}";
			String ACTIVE_PRICE = "/active-price";
			String CAMPAIGNS = "/campaigns";
		}

		public interface Home {
			String SEARCH = "/search";
			String ADVANCED_SEARCH = "/advanced-search";
			String AMS_DATA = "/ams-data";
			String CUMMULATIVE_AMS_DATA = "/cummulative-ams-data";
		}
		
		public interface AccountingSetting{
			String INDEX = "/accounting-settings";
			String GET_TAX_CONFIG = "/get-tax-config/{pk}";
			String UPSERT_TAX_CONFIG = "/upsert";
			String DELETE_TAX_CONFIG = "/delete/{pk}";
		}
		
		public interface CancellationGroup {
			String INDEX = "/cancellation-group";
			String UPSERT_GROUP = "/upsert";
			String DELETE_GROUP = "/delete/{pk}";
			String GET_CUSTOMER_GROUP = "/get-customer-group";
		}

		public interface CustomerGroup {
			String INDEX = "/customer-group";
			String UPSERT_GROUP = "/upsert";
			String DELETE_GROUP = "/delete/{pk}";

		}

		public interface PricingGroup {
			String INDEX = "/pricing-group";
			String UPSERT_GROUP = "/upsert";
			String DELETE_GROUP = "/delete/{pk}";
			String GET_GROUP = "/{pk}";
			String CREATE_GROUP = "/create";
		}

		public interface PaymentGroup {
			String INDEX = "/payment-group";
			String UPSERT_GROUP = "/upsert";
			String DELETE_GROUP = "/delete/{pk}";
			String GET_CUSTOMER_GROUP = "/get-customer-group";
		}

		public interface CustomerMaster {
			String INDEX = "/customer-master";
			String UPSERT_CUSTOMER = "/upsert";
			String DELETE_CUSTOMER = "/delete/{pk}";
			String GET_CUSTOMER = "/get-customer/{pk}";
		}

		public interface INVENTORY {
			String INDEX = "/inventory";
			String GET_PENDING_INVENTORIES = "/pending";
			String GET_NEW_INVENTORY = "/new";
			String GET_INVENTORY = "/{pk}";
			String GET_PENDING_INVENTORY = "/pending/{pk}";
			String APPROVE_PENDING_INVENTORY = "/approve/{pk}";
			String DELETE_INVENTORY = "/delete/{pk}";
			String DELETE_PENDING_INVENTORY = "/delete-pending/{pk}";
			String UPSERT_INVENTORY = "/upsert";
			String UPDATE_PENDING_INVENTORY = "/update-pending";
			String BULK_UPLOAD_INVENTORY = "/bulk-upload";
			String UPLOAD = "/upload";
			String IMAGE_UPLOAD = "/image-upload";
		}

		public interface UserManagement {
			String INDEX = "/users-and-roles";
			String INVITE_OPERATOR = "/invite-operator";
			String GET_OPERATOR = "/get-operator/{pk}";
			String GET_USER = "/get-user/{pk}";
			String CREATE_UPDATE_USER = "/create-update-user";
			String DELETE_USER = "/delete-user/{pk}";
			String GET_ROLE = "/get-role/{pk}";
			String CREATE_UPDATE_ROLE = "/create-update-role";
			String DELETE_ROLE = "/delete-role/{pk}";
		}

		public interface Wishlist {
			String INDEX = "/wishlist";
			String ADD_TO_WISHLST = "/add";
			String REMOVE_WISHLIST = "/remove";
			String IN_WISHLIST = "/in-wishlist";
		}

		public interface CART {
			String INDEX = "/cart";
			String GET_CART = "/get";
			String RFP = "/rfp";
			String ADD_TO_CART = "/add";			
			String REMOVE_FROM_CART = "/remove/{code}";
		}
		
		public interface CHECKOUT {
			String INDEX = "/checkout";
			String ADD_PAYMENT_TERM_TO_CART = "/add-payment-term";
			String PLACE_ORDER = "/place-order";
		}
		
		public interface ORDER_SUMMARY {
			String INDEX = "/order-summary/{pk}";
		}

		public interface ORDER_PLACED {
			String INDEX = "/order-placed";
			String GET_ORDER = "/{pk}";
		}

		public interface ORDER_RECEIVED {
			String INDEX = "/order-received";
			String GET_ORDER = "/{pk}";
		}

		public interface SKU_BLOCK_DATE {
			String INDEX = "/block-dates";
			String GET_SKU_BLOCK_DATE = "/{pk}";
			String DELETE_SKU_BLOCK_DATE = "/delete/{pk}";
			String UPSERT_SKU_BLOCK_DATE = "/upsert";
		}
	}

	public interface RoleAccessTypes {
		String USER_PROFILE = "user-profile";
		String SUBSCRIPTIONS = "subscriptions";
		String ORDER_RECEIVED = "order-received";
		String ORDER_PLACED = "order-placed";
		String MY_CAMPAIGNS = "my-campaigns";
		String WISHLIST = "wishlist";
		String CAMPAIGN_TASKS = "campaign-task";
		String MONITORING_TASKS = "monitoring-task";
		String USER_AND_ROLES = "users-and-roles";
		String PRICING_GROUP = "pricing-group";
		String CUSTOMER_GROUP = "customer-group";
		String CANCELLATION_GROUP = "cancellation-group";
		String PAYMENT_GROUP = "payment-group";
		String CUSTOMER_MASTER = "customer-master";
		String INVENTORY = "inventory";
		String PENDING_INVENTORIES = "pending-inventories";
		String BULK_UPLOAD = "bulk-upload";
		String BLOCK_DATES = "block-dates";
		String VALUE_ADDED_SERVICES = "value-added-services";
		String CUSTOMER_PAYMENTS = "customer-payments";
		String GENERATE_INVOICE = "generate-invoice";
		String ACCOUNTING_REPORTS = "accounting-reports";
		String DISCOUNT_COUPONS = "discount-coupons";
		String ACCOUNTING_SETTINGS = "accounting-settings";
		String ANALYTICS_DASHBOARD = "analytics-dashboard";
		String MONITORING_REPORTS = "monitoring-reports";
		String CAMPAIGN_PERFORMANCE = "campaign-performance";
		String INVENTORY_PERFORMANCE = "inventory-performance";
		String CATEGORY_PERFORMANCE = "category-performance";
		String LOCATION_PERFORMANCE = "location-performance";
		String OCCUPANCY_OVERVIEW = "occupancy-overview";
		String CUSTOMER_PERFORMANCE = "customer-performance";
		String SALESPERSON_PERFORMANCE = "salesperson-performance";
		String SALES_PERFORMANCE = "sales-performance";
		String MOBILE_APP_DAHSBOARD = "mobile-app-dashboard";
		String MOBILE_APP_MONITOR = "mobile-app-monitor";
		String MOBILE_APP_REPORTS = "mobile-app-reports";
		String MOBILE_APP_LISTING = "mobile-app-listing";
		String MOBILE_APP_SETTINGS = "mobile-app-settings";

	}

}
