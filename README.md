# Slate - Postmanerator theme by Bhinneka

![Slate preview](/preview.png?raw=true)

A [slate](https://github.com/lord/slate) theme for [Postmanerator](https://github.com/aubm/postmanerator).

Used components:
- Bootstrap 3
- jQuery 2
- highlight.js
- slate component (css & javascript)

# Limitation
Currently there are some limitations:
- postmanerator only support postman collection v1
- Responsive issue

# Usage

Make sure you already throught [postmanerator installation](https://github.com/aubm/postmanerator#installation)

Download theme from repository
```
$ postmanerator themes get https://github.com/Bhinneka/postmanerator-slate-theme.git
```

Confirm that it is available on your local machine
```
$ postmanerator themes list
slate
default
```

Generate documentation
```
$ postmanerator -collection=main.postman_collection.json \
> -environment=local.postman_environment.json \
> -theme=slate -output=./build/index.html
```

You can add your own logo in the generated documentation, just copy the `logo.png` file to the directory with the generated documentation (next to the `index.html`).

# License

MIT License

Copyright (c) 2019 Bhinneka
