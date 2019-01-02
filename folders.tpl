<!-- BEGIN iterate through all groups -->
{{ $folder := . }}
  <h1 id="folder-{{ slugify $folder.Name }}">
    {{ .Name }}
    <a href="#folder-{{ slugify $folder.Name }}"><i class="glyphicon glyphicon-link"></i></a>
  </h3>

  {{ markdown $folder.Description }}

  <!-- BEGIN iterate through all requests -->
  {{ range $folder.Requests }}
  {{ $req := . }}
    <div class="split">
      <div class="left">
        <div class="headling">
          <h2 id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}">
            {{ $req.Name }}
            <a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}"><i class="glyphicon glyphicon-link"></i></a>
          </h2>
        </div>

        <div class="description">{{ markdown $req.Description }}</div>
      </div>

      <div class="right clearfix">
        <!-- BEGIN example requests -->
        <div class="request">
          <h5>Example request</h5>

          <ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="active"><a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-http" data-toggle="tab">HTTP</a></li>
            <li role="presentation"><a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-curl" data-toggle="tab">Curl</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-http">
              <pre><code class="hljs http">{{ httpSnippet $req }}</code></pre>
            </div>
            <div class="tab-pane" id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-curl">
              <pre><code class="hljs curl">{{ curlSnippet $req }}</code></pre>
            </div>
          </div>
        </div>
        <!-- END example requests -->

        <!-- BEGIN example responses -->
        {{ with $req.Responses }}
        <div class="response">
          <h5>Example response</h5>

          <ul class="nav nav-pills" role="tablist">
            {{ range $index, $res := . }}
            <li role="presentation" {{ if eq $index 0 }} class="active" {{ end }}>
              <a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-responses-{{ $res.ID }}" data-toggle="tab">
                {{ if eq (len $req.Responses) 1 }}
                  Response
                {{ else }}
                  {{ $res.Name }}
                {{ end }}
              </a>
            </li>
            {{ end }}
          </ul>

          <div class="tab-content">
            {{ range $index, $res := . }}
            <div class="tab-pane{{ if eq $index 0 }} active{{ end }}" id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-responses-{{ $res.ID }}">
              <div class="resp-code"><code><span class="status status-{{ $res.StatusCode }}">Status {{ $res.StatusCode }}</span> {{ $res.Status }}</code></div>
              {{ if hasContent $res.Body }}
                {{ with $example := indentJSON $res.Body }}
                  <pre><code>{{ $example }}</code></pre>
                {{ end }}
              {{ end }}
            </div>
            {{ end }}
          </div>
        </div>
        {{ end }}
        <!-- END example responses -->
      </div>
    </div>

  {{ end }}
  <!-- END iterate through all requests -->
  
<!-- END iterate through all groups -->
