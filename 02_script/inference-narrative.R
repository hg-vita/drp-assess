library(tibble)
library(glue)
library(purrr)

# ---------------------------------------
# 1. Define function-to-inference mapping
# ---------------------------------------

function_map <- tribble(
  ~function_name,    ~inference_template,
  "mean",            "The average value of {indicator} was {value}.",
  "median",          "The median {indicator} observed was {value}.",
  "max",             "The peak {indicator} recorded was {value}.",
  "min",             "The lowest {indicator} recorded was {value}.",
  "trend_up",        "{indicator} has been steadily increasing.",
  "trend_down",      "{indicator} has shown a decreasing trend.",
  "rank_high",       "{indicator} ranks among the top performers.",
  "rank_low",        "{indicator} is among the lowest globally.",
  "volatility_high", "{indicator} shows significant fluctuations.",
  "volatility_low",  "{indicator} has remained stable over time."
)

# ---------------------------------------
# 2. Sample metric analysis input
# ---------------------------------------

analysis_input <- tribble(
  ~indicator,     ~function_name, ~value,
  "ANC4",         "mean",         72.5,
  "SBA",          "median",       81.3,
  "ANC4",         "trend_up",     NA,
  "SBA",          "rank_low",     NA
)

# ---------------------------------------
# 3. Generate narrative using pmap
# ---------------------------------------

narratives <- analysis_input %>%
  left_join(function_map, by = "function_name") %>%
  mutate(
    narrative = pmap_chr(
      list(indicator, value, inference_template),
      function(indicator, value, template) {
        glue(template, .envir = list(indicator = indicator, value = value))
      }
    )
  )

# ---------------------------------------
# 4. View Output
# ---------------------------------------

print(narratives$narrative)
