# train-stops

#########################
### MAIN: mbtaLogic.rb
###
### purpose: analyze  and manage information about
### stops on train network. Train network consists 
### of two or more train lines, each represented by a line name.
### A train line has two or more stops, each represented by a stop name.
### Does one stop (stop name) belong to two or more different 
### train lines, then this stop is considered 
### to be a hub (cross point).
### UI functions:
###   list all train lines and stops on particular line
###   list all hubs (cross points), and belonging trains crossing this paticular hub
###   list hubs on a train route,
###   for each line list all connecting lines on particular hub on trains route
###
### To add, remove or modify a train line, edit 'trainLineAdmin.rb' file only. 
