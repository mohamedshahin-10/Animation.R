library(ggplot2) #import ggplot2
library(gganimate)#animation
library(gifski)
library(png)  
library(plotly)    #import interactive

d1 <- StudentsPerformance    #put dataset in varible to facilitate
summary(d1, class)
sapply(d1, class)

#scatterplot
p1 <- ggplot(d1,aes(x=math,y=reading))       #vis between scores according to groups
p1 + geom_point(aes(color=group))
p11 <- p1 + geom_point(aes(color=group))
ggplotly(p11)      # to make ineractive 

p3 <- ggplot(d1,aes(x=writing,y=reading))
p3 + geom_point(aes(color=group)) + transition_states(group) +  #annimation
  ease_aes('linear')



p7 <- ggplot(d1,aes(x=math,y=writing))
p7 + geom_point(aes(color=group))



#barplots assigned to one varible
#count of groups
p2 <- ggplot(d1,aes(x=group)) 
p2 + geom_bar(color="black",fill="pink")
p22 <- p2 + geom_bar(color="black",fill="pink") #assigned new varible to make interactive 
ggplotly(p22)


#count og gender
p4 <- ggplot(d1,aes(x=gender)) 
p4 + geom_bar(aes(fill=gender))
p44 <- p4 + geom_bar(aes(fill=gender))
ggplotly(p44)

#count of parent
p5 <- ggplot(d1,aes(x=parent))
p5 + geom_bar(aes(fill=parent)) + transition_states(parent) +  #annimation
  ease_aes('linear')

p55 <- p5 + geom_bar(aes(fill=parent))
ggplotly(p55)

#count of lunch
p6 <- ggplot(d1,aes(x=lunch))
p6 + geom_bar(aes(fill=gender))



#Boxplots
# Boxplot of scores and test prepare by gender

#writing 
b <- ggplot(d1, aes(gender, writing, color = test))
b <- b + geom_boxplot()
b <- b + ggtitle("Writing scores by Gender Boxplot")
b <- b + xlab("gender") + ylab("writing")
b 
ggplotly(b) #iteractive

#math
b1 <- ggplot(d1, aes(gender, math, color = test))
b1 <- b1 + geom_boxplot()
b1 <- b1 + ggtitle("Math scores by Gender Boxplot")
b1 <- b1 + xlab("Gender") + ylab("Math Scores")
b1 

#reading
b2 <- ggplot(d1, aes(gender, reading, color = test))
b2 <- b2 + geom_boxplot()
b2 <- b2 + ggtitle("Reading scores by Gender Boxplot")
b2 <- b2 + xlab("Gender") + ylab("Reading Scores")
b2

#total
b3 <- ggplot(d1, aes(gender, total, color = test))
b3 <- b3 + geom_boxplot()
b3 <- b3 + ggtitle("total by Gender Boxplot")
b3 <- b3 + xlab("Gender") + ylab("total")
b3 



#heatmap
# Parents education and Scores

e <- ggplot(d1) +
  geom_bin2d(aes(x=writing, y=parent)) +
  xlab("Writing Scores") + ylab("Parents Education") 
e
ggplotly(e)


e1 <- ggplot(d1) +
  geom_bin2d(aes(x=reading, y=parent)) +
  xlab("Reading Scores") + ylab("Parents Education") 
e1


e2 <- ggplot(d1) +
  geom_bin2d(aes(x=math, y=parent)) +
  xlab("Math Scores") + ylab("Parents Education") 
e2


e3 <- ggplot(d1) +
  geom_bin2d(aes(x=total, y=parent)) +
  xlab("total") + ylab("Parents Education") 
e3



#Histogram
#Plot Exam scores by Gender to determine if there is a different score tendency for each gender


h <- ggplot(d1, aes(math)) + geom_histogram(binwidth=5, color="gray", aes(fill=gender))
h <- h + xlab("Math Scores") + ylab("Gender") + ggtitle("Math Scores by Gender")
h #math and gender
ggplotly(h)

h1 <- ggplot(d1, aes(reading)) + geom_histogram(binwidth=5, color="gray", aes(fill=gender))
h1 <- h1 + xlab("Reading Scores") + ylab("Gender") + ggtitle("Reading Scores by Gender")
h1 #reading and gender

h2 <- ggplot(d1, aes(writing)) +  geom_histogram(binwidth=5, color="gray", aes(fill=gender))
h2 <- h2 + xlab("Writing Scores") + ylab("Gender") + ggtitle("Writing Scores by Gender")
h2 #writing and gender

h3 <- ggplot(d1, aes(total)) +  geom_histogram(binwidth=5, color="gray", aes(fill=gender))
h <- h + xlab("total Scores") + ylab("Gender") + ggtitle("total Scores by Gender")
h #total and gender


#piechart to compare between element in each coloum 
#gender
pie=ggplot(d1,aes(x="",y=gender,fill=gender))
pie=pie+geom_bar(stat = 'identity')+coord_polar('y',start = 0)
pie

#group
pie1=ggplot(d1,aes(x="",y=group,fill=group))
pie1=pie1+geom_bar(stat = 'identity')+coord_polar('y',start = 0)
pie1

#lunch
pie2=ggplot(d1,aes(x="",y=lunch,fill=lunch))
pie2=pie2+geom_bar(stat = 'identity')+coord_polar('y',start = 0)
pie2

#parent
pie3=ggplot(d1,aes(x="",y=parent,fill=parent))
pie3=pie3+geom_bar(stat = 'identity')+coord_polar('y',start = 0)
pie3

#test
pie4=ggplot(d1,aes(x="",y=test,fill=test))
pie4=pie4+geom_bar(stat = 'identity')+coord_polar('y',start = 0)
pie4
