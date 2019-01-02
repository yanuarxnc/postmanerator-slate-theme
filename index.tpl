<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="favicon.ico" rel=icon type="image/ico"/>
    <title>{{ .Name }}</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/tomorrow-night-eighties.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
    <script src="https://docs-api.bhinneka.com/javascripts/all.js"></script>
    <script>
        hljs.configure({
            tabReplace: '    ',
        });
        hljs.initHighlightingOnLoad();
    </script>
    <style>{{ template "custom.css" }}</style>
    <link href="https://docs-api.bhinneka.com/stylesheets/screen.css" rel="stylesheet" media="screen" />
    <link href="https://docs-api.bhinneka.com/stylesheets/print.css" rel="stylesheet" media="print" />
</head>
<body>

    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-wrapper" aria-expanded="false">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>

    <div class="toc-wrapper">
      {{ template "menu.tpl" . }}
    </div>

    <div class="page-wrapper">
      <div class="dark-box"></div>
      <div class="content">
          <h1 id="doc-general-notes">Introduction</h1>
          {{ markdown .Description }}

          {{ template "structures.tpl" }}

          {{ range .Requests }}
            {{ template "request.tpl" . }}
          {{ end }}

          {{ range .Folders }}
            {{ $folder := .}}
            {{ template "folders.tpl" $folder }}
          {{ end }}
      </div>

      <div class="dark-box">
          <div class="lang-selector">
                <a href="#" data-language-name="http" class="active">http</a>
          </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $("table:not(.table)").addClass('table table-bordered');
        });
    </script>

</body>
</html>
