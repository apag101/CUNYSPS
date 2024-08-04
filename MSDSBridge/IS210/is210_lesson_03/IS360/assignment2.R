# Five customers in queue
queue <-c("James", "Mary", "Steve", "Alex", "Patricia")
queue

#Harold is added to queue
queue <-c(queue, "Harold")
queue

#James leaves queue
queue <-c(queue[-1])
queue

#Pam a new customer talked her way in front of Steve
queue <-c(queue[1], "Pam", queue[-1])
queue

#Harold leaves
queue <-c(queue[-6])
queue

#Alex Leaves, by name
queue<-queue[-which(queue=="Alex")]
queue

#Patricia position in queue
match(c("Patricia"),queue)

#Number of people left in queue
length(queue)





