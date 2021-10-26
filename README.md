
# glossary

<!-- badges: start -->

<!-- badges: end -->

The goal of {glossary} is to provide a glossary of statistical and R
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

  - `glossary("alpha")`:
    <a class='glossary' target='_blank' title='(stats) The cutoff value for making a decision to reject the null hypothesis; (graphics) A value between 0 and 1 used to control the levels of transparency in a plot' href='https://psyteachr.github.io/glossary/a#alpha'>alpha</a>
  - `glossary("beta", display = "β")`:
    <a class='glossary' target='_blank' title='The false negative rate we accept for a statistical test.' href='https://psyteachr.github.io/glossary/b#beta'>β</a>
  - `glossary("power", def = "custom definition of power")`:
    <a class='glossary' target='_blank' title='custom definition of power' href='https://psyteachr.github.io/glossary/p#power'>power</a>
  - `glossary("probability", def = "")`:
    <a class='glossary' target='_blank' title='' href='https://psyteachr.github.io/glossary/p#probability'>probability</a>
  - `glossary("p-value", link = FALSE)`:
    <a class='glossary' title='The probability of seeing an effect at least as extreme as what you have, if the real effect was the value you are testing against (e.g., a null effect)'>p-value</a>
  - `glossary("replicability", add_to_table = FALSE)`:
    <a class='glossary' target='_blank' title='The extent to which the findings of a study can be repeated with new samples from the same population.' href='https://psyteachr.github.io/glossary/r#replicability'>replicability</a>

You can include a glossary table at the end of a document that includes
all of the terms you defined above.

``` r
glossary_table()
```

| term                                                                   | definition                                                                                                                                                            |
| :--------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [alpha](https://psyteachr.github.io/glossary/a.html#alpha)             | (stats) The cutoff value for making a decision to reject the null hypothesis; (graphics) A value between 0 and 1 used to control the levels of transparency in a plot |
| [beta](https://psyteachr.github.io/glossary/b.html#beta)               | The false negative rate we accept for a statistical test.                                                                                                             |
| [p value](https://psyteachr.github.io/glossary/p.html#p-value)         | The probability of seeing an effect at least as extreme as what you have, if the real effect was the value you are testing against (e.g., a null effect)              |
| [power](https://psyteachr.github.io/glossary/p.html#power)             | custom definition of power                                                                                                                                            |
| [probability](https://psyteachr.github.io/glossary/p.html#probability) | A number between 0 and 1 where 0 indicates impossibility of the event and 1 indicates certainty                                                                       |

## Compilation

If you add or change any terms in the glossary, you will need to
recompile it. Here are two ways to do this, either through a running R
session or from a terminal prompt.

### Recompile using R

From the R console, with the working directory set to the root directory
of the glossary repository, type

``` r
source("_makefile.R")
```

### Recompile from the terminal

In a terminal window, navigate to the directory containing the glossary
files and type

    make

This will invoke the commands in `Makefile`.
