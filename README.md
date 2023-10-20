# eis1600.github.io

Project website

- the website data is in the subfolder `./theme_stack/`

- you can open the entire project using the *.Rproj file in RStudio

- `blogdown` library must be installed; information on this library and how to use it: <https://bookdown.org/yihui/blogdown/> (the book is downloadable; created with `bookdown` package, developed by the same person, Yihui Xie, in collaboration with some others);

- you can start the live server with `blogdown::serve_site()`;
- the server can be stopped with `blogdown::stop_server()`

- posts and pages are created in subfolder `content`;

  - `post` :: create a subfolder using the same pattern as those that are already there (starting with the date! The post will be made available on that date; using date from the future will make the post published on the future date (I think...)); inside the folder one must create `index.en.md` (the easiest might be to copy-paste); changing `en` to other languages to make translations (`de`, `ar`, `fa`, `ru`, etc.); 

- to edit tags and categories: `./theme_stack/i18n/` --- language-specific files;
