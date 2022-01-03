<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        location.href = "/board/list";
    });
</script>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Hello world!
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>