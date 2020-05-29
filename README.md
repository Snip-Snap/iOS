#  Thoughts on each Screen

I am using apollo iOS to connect to my golang graphql server that is running on aws. 
The golang graphql is using gqlgen and is connected to a postgreSQL database which is also on aws. 

The design of this application is not mine, it is from a design created on [dribble](https://dribbble.com/shots/11069254-Ciach-Ciach/attachments/2666293?mode=media). The login/register screen design and the map view design are mine. 


## Login Screen
The login screen is fairly striaght forward the username and password textfields are used as the input 
to the graphql login mutation. 

- [] Make sure to display a message if the login was not successful. 

![Login Screen]: (./display_images/login_screen.png)

