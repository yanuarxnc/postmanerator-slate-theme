  <img src="./logo.png" alt="{{ .Name }}" class="logo img-responsive" />

  <div class="search">
    <input type="text" class="search" id="input-search" placeholder="Search">
  </div>
  <ul class="search-results"></ul>

  <ul id="toc" class="toc-list-h1">">
    <li>
      <a href="#doc-general-notes" class="toc-h1 toc-link">Introduction</a>
    </li>

    {{ with $structures := .Structures }}
      <li>
        <a href="#doc-api-structures">API structures</a>
        <ul>
          {{ range $structures }}
            <li>
              <a href="#struct-{{ .Name }}">{{ .Name }}</a>
            </li>
          {{ end }}
        </ul>
      </li>
    {{ end }}

    {{ range .Requests }}
      <li>
        <a href="#request-{{ slugify (printf "%v %v" .Method .Name) }}" class="toc-h1 toc-link"><span class="req-{{ .Method }} text-lg">{{ .Method }}</span> {{ .Name }}</a>
      </li>
    {{ end }}

    {{ range .Folders }}
    {{ $folder := . }}
      <li>
        <a href="#folder-{{ slugify $folder.Name }}" class="toc-h1 toc-link">{{ $folder.Name }}</a>
        <ul class="toc-list-h2">
          {{ range $folder.Requests }}
          {{ $name := (printf "%v %v" .Method .Name ) }}
            <li>
              <a href="#request-{{ slugify $folder.Name }}-{{ slugify $name }}" class="toc-h2 toc-link"><span class="req-{{ .Method }} text-lg">{{ .Method }}</span> {{ .Name }}</a>
            </li>
          {{ end }}
        </ul>
      </li>
    {{ end }}
  </ul>
