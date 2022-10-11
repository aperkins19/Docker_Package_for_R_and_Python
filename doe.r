# Load the package required to perform Response Surface Optimisation
library(rsm)
# docs:
# https://cran.r-project.org/web/packages/rsm/rsm.pdf

# Load the package required to read JSON files.
 library(rjson)

# Load the package required to plot.
library(ggplot2)


# Import the components to modulate JSON
components_json <- fromJSON(file = "components.json")
# convert to Dataframe
components_df <- as.data.frame(components_json)
# Print the result.
print(components_df)

# get the number of rows of the df to use as # of variables for generating design

number_of_variables <- nrow(components_df)


box_benken <- bbd(3, randomize=FALSE)
print(box_benken)
design <- ccd(basis = 3,
                n0 = 4,
                blocks = "Block",
                alpha = "orthogonal",
                wbreps = 1,
                bbreps = 1,
                randomize = FALSE,
                inscribed = FALSE)


#box_benken_coded  <- decode.data(box_benken, var1 ~ (x1 - 10)/5, var2 ~ (x2 - 50)/10, var3 ~ (x3 - 100)/20)
box_benken_decoded  <- recode.data(box_benken, coding = c(var1 ~ (x1 - 10)/5, var2 ~ (x2 - 50)/10, var3 ~ (x3 - 100)/20))
print(box_benken_coded)

CR1 <- coded.data(ChemReact1, x1 ~ (Time - 85)/5, x2 ~ (Temp - 175)/5)
CR1 <- as.data.frame(CR1)
print(ChemReact1)
print(CR1)

#ggplot(design, aes(x=x1.as.is,y=x2.as.is,z=x3.as.is)) +
#  geom_point()