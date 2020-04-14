# Stat 33B - Lecture 2
# Jan 29, 2020

# Announcements
# =============
#
# Assignment 1 is now on bcourses.
#
# Please make sure you have access to Piazza.

# https://www.wayfair.com/furniture/pdp/ebern-designs-abingd-nightstand-w000787596.html?piid=675203115
# Review: Copy-on-Write Semantics
# ===============================
# R uses copy-on-write semantics for assignment.
#
# This means that if we assign `x` to `y`:
x = c(1, 2)
y = x

# And then modify `y`:
y[1] = 7

# Then `x` remains unchanged:
x

# Originally, `x` and `y` referred to the same value in memory.
#
# When we modified `y` (a "write"), R automatically copied its value in memory.


# Data Frames
# ===========
# For the next few lectures, we'll use the "dogs" data set. You can download a
# copy from bcourses. The data set is originally from:
#
#   https://informationisbeautiful.net/visualizations/
#     best-in-show-whats-the-top-data-dog/


# You can load the file from an absolute path, or a path relative to the
# working directory. Helpful functions:
#
# getwd() -- get the current working directory
# setwd() -- set the current working directory
#
# Idiomatic R: use paths relative to your .R file, and avoid setting the
# working directory.


# The dogs data set on bcourses is saved in RDS format.
#
# RDS stands for "R Data Serialized", and is R's native serialization format.
# (for Python users, RDS is similar to pickle)
#
# You can read an RDS file with `readRDS`:
dogs = readRDS("dogs_full.rds")

# Not a good idea to print an entire unfamiliar data set!
#
# Instead, we can inspect the data set with functions such as:
#
# head()  -- print first 6 rows
head(dogs)
# tail()  -- print last 6 rows
tail(dogs)
# dim()   -- print dimensions
dim(dogs)
# nrow()  -- print number of rows
# ncol()  -- print number of columns
# str()   -- summarize structure of an object  (lists all columns, data type, leading entries, 
#            and the observations of all the variables)
# summary() -- summarize an object
#
summary(dogs)

# In statistics, tabular data usually has:
#   * Observations as rows
#   * Features as columns
#
# R's data structure for tabular data is the "data frame".
#
# The dogs data is an example of a data frame.


# Data types in each column must be homogeneous (like a vector).
# All entries need to be filled out in dataframe, it cannot be jagged(every column must have
# the same number of elements)
# Data types in each row can be heterogeneous.
#
# For instance, if we get an individual column with `$`:


# Types & Classes
# ===============
# How do we know the dogs data is a data frame?


# In R, every object has at least one class.
#
# Class specifies how the object behaves in R.
#
# Class answers the question "How does this thing behave?"
#
# Check S3 class with `class`:

class(dogs)

# Every object has exactly one type, too.
#
# Type specifies how the object is stored in memory.
#
# Type answers the question "What is this thing?"
#
# Check type with `typeof`:



# R "sees" scalars as 1-vectors.
#
# Scalars and vectors have the same type and class:


# Technically, class and type are independent.
#
# So we could tell an integer that it's a data frame:


# Of course, this is silly. Most of the time, each class corresponds to a
# specific type or set of types.


# R can automatically coerce types upward in this ordering:
#
# * list
# * character (strings)
# * complex
# * double / numeric
# * integer
# * logical
#
# Most notably, this happens when making a vector with `c`:


# R usually won't coerce types downward, but it depends on the function.


# Some types exist outside the ordering:


# A Few More Data Structures
# ==========================
# Lists are general-purpose containers for heterogeneous objects:


# Every (ordinary) data frame is a list:


# We can really see this if we remove the class from the data frame:


# More about subtleties of lists next week.


# Matrices are useful for homogeneous tabular data:


# Type of the matrix is the same as the type of its elements.


# R matrices are stored in column order in memory.
#
# So it's usually faster to operate on columns rather than rows.


# In R, "arrays" generalize vectors and matrices to higher dimensions:


# R does not provide built-in stack, queue, or tree data structures.
#
# R provides a limited hash table data structure; we'll see it later on.
#
# Some of these are also provided in R packages.


# Attributes
# ==========
# Attributes are name-value pairs in the metadata of an R object.
#
# Several functions for working with attributes:
#
# attr() -- get or set one attribute on an object
# attributes() -- get all attributes on an object
# structure() -- set all attributes on an object
#
# We've already been using attributes.
#
# S3 classes are stored in the "class" attribute:


# The `class` function is just a helper for this attribute.


# Names are also attributes:


# Some common attributes:
#
# * class -- S3 class
# * row.names -- row names
# * names -- element names or column names
# * dim -- dimensions (on matrices)
# * dimnames -- names of dimensions (on matrices)
#
# Some of these also have helper functions:



# Idiomatic R: use a helper function to set attributes when possible.
