#1)What does the caith dataset in the MASS package contain
# This dataset contains color and inensity properties but does not contain what the properties are for.

#2)Describe what is stored in EYecolor
# The value stored in eycolor is the number of rows in a table. IT does not necessarily mean its for
#eyecolors

#3)Create new var HairColor with total hair across different eye color.
HairColor <-colSums(caith)

#4) Create a histogram of EyeColors
hist(EyeColor)

#5) Describ what the code below does:

caitha <- as.matrix(caith)
#This line of code takes a copy oft the caith matrix to a new variable caitha which is another matrix

#6) Describe wha the code below does:

barplot(t(as.matrix(caith)))
#This barplot has a bar for each eyecolor , then each bar is divided into HairColor

#7) Modify the barplot so that hairColor shows separate
barplot(t(as.matrix(caith)), beside = TRUE)

#8) IS there a relationship between eye color and hair color ?
#The barplot(t(as.matrix(caith)), beside = TRUE) barplot shows there may be some
#correlelation with medium -medium and dark - dark percentage wise when looking at total data
# The boxplot code boxplot(caith, las = 2) also shows how dark and medium are skewed in 
#one direction compared to other colors.
