<#import "/spring.ftl" as spring />


<html>
<head>
    <title>Books</title>
    <#include "../partials/head.ftlh">
</head>
<body>


<#assign page = "Book-Edit">
<#include "../partials/main_content_top.ftlh">

<h3 class="mb-3">Edit Book</h3>
<div class="table-responsive">

    <#include "../forms/bookEditForm.ftlh" />
</div>

<#include "../partials/main_content_bottom.ftlh">
<#include "../partials/scripts.ftlh">
<script src="/scripts/main.js"></script>
<script src="/scripts/bookValidation.js"></script>
</body>
</html>

