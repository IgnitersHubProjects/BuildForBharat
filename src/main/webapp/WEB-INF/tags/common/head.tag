<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="title" required="false" type="java.lang.String"%>
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>${title}</title>
   <link rel="icon" type="image/png" href="/_ui/store/assets/favicon.png">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="_csrf" content="${_csrf.token}" />
   <meta name="_csrf_header" content="${_csrf.headerName}" />
   <meta name="_csrf_parameter" content="${_csrf.parameterName}" />
   <link rel="apple-touch-icon" href="apple-touch-icon.png">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <!--Slick Slider css-->
   <link href="https://kenwheeler.github.io/slick/slick/slick-theme.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
   <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   <spring:url value="/resources/css/icofont.min.css" var="icofonmintcss"/>
   <link href="${icofonmintcss}" rel="stylesheet">
   <spring:url value="/resources/css/icofont.css" var="icofontcss"/>
   <link href="${icofontcss}" rel="stylesheet">
   <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
   <spring:url value="/resources/css/style.css" var="stylecss"/>
   <link href="${stylecss}" rel="stylesheet">
   <spring:url value="/resources/css/front-style.css" var="frontstylecss"/>
   <link href="${frontstylecss}" rel="stylesheet" >
   <spring:url value="/resources/css/user-style.css" var="userstylecss"/>
   <link href="${userstylecss}" rel="stylesheet">
   <spring:url value="/resources/css/custom.css" var="customcss"/>
   <link href="${customcss}" rel="stylesheet">
</head>