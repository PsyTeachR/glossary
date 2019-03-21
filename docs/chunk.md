
## chunk

In an RMarkdown file (`.Rmd`), you can include a block (or "chunk") of R code by surrounding the code as in the example below:

<pre><code>```{r chunk-name}

mean_age <- mean(ages) %>% round(2)

&#96;&#96;&#96;</code></pre>
