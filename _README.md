
# glossary

<!-- badges: start -->
<!-- badges: end -->

The goal of glossary is to provide a glossary of statistical and R
coding terms used in the [PsyTeachR books](https://psyteachr.github.io/)
that can be accessed offline.

## Installation

You can install the development version of glossary from
[GitHub](https://github.com/PsyTeachR/) with:

``` r
# install.packages("devtools")
devtools::install_github("psyteachr/glossary")
```

## Access the book offline

``` r
glossary::open_glossary()
```

You can use the glossary to define terms in a markdown document. By
default, the term links to the online glossary and shows a short
definition when you hover over the link. You can change what text
displays in the link, what the short definition displays, whether the
link opens the online glossary, and whether it’s added to the glossary
table.

-   `glossary("alpha")`:
    <a class='glossary' target='_blank' title='The cutoff value for making a decision to reject the null hypothesis' href='https://psyteachr.github.io/glossary/a#alpha'>alpha</a>
-   `glossary("beta", display = "β")`:
    <a class='glossary' target='_blank' title='The false negative rate we accept for a statistical test.' href='https://psyteachr.github.io/glossary/b#beta'>β</a>
-   `glossary("power", def = "custom definition of power")`:
    <a class='glossary' target='_blank' title='custom definition of power' href='https://psyteachr.github.io/glossary/p#power'>power</a>
-   `glossary("probability", def = "")`:
    <a class='glossary' target='_blank' title='' href='https://psyteachr.github.io/glossary/p#probability'>probability</a>
-   `glossary("p-value", link = FALSE)`:
    <a class='glossary' title='The probability of seeing an effect at least as extreme as what you have, if the real effect was the value you are testing against (e.g., a null effect)'>p-value</a>
-   `glossary("replicability", add_to_table = FALSE)`:
    <a class='glossary' target='_blank' title='The extent to which the findings of a study can be repeated with new samples from the same population.' href='https://psyteachr.github.io/glossary/r#replicability'>replicability</a>

You can include a glossary table at the end of a document that includes
all of the terms you defined above.

``` r
glossary_table()
```

| term                                                                                                          | definition                                                                                                                                               |
|:--------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a class='glossary' target='_blank' href='https://psyteachr.github.io/glossary/a#alpha'>alpha</a>             | The cutoff value for making a decision to reject the null hypothesis                                                                                     |
| <a class='glossary' target='_blank' href='https://psyteachr.github.io/glossary/b#beta'>beta</a>               | The false negative rate we accept for a statistical test.                                                                                                |
| <a class='glossary' target='_blank' href='https://psyteachr.github.io/glossary/p#p-value'>p-value</a>         | The probability of seeing an effect at least as extreme as what you have, if the real effect was the value you are testing against (e.g., a null effect) |
| <a class='glossary' target='_blank' href='https://psyteachr.github.io/glossary/p#power'>power</a>             | custom definition of power                                                                                                                               |
| <a class='glossary' target='_blank' href='https://psyteachr.github.io/glossary/p#probability'>probability</a> | A number between 0 and 1 where 0 indicates impossibility of the event and 1 indicates certainty                                                          |
