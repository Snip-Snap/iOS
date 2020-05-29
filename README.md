#  Thoughts on each Screen

I am using apollo iOS to connect to my golang graphql server that is running on aws. 
The golang graphql is using gqlgen and is connected to a postgreSQL database which is also on aws. 

The design of this application is not mine, it is from a design created on [dribbble](https://dribbble.com/shots/11069254-Ciach-Ciach/attachments/2666293?mode=media). The login/register screen design and the map view design are mine. 


## Login 

The login screen is fairly straight forward the username and password textfields are used as the input 
to the graphql login mutation. 

- [ ] Display a message if the login was not successful. 

<p align="middle">
<img src="./display_images/login.png" width="50%" />
</p>

## Shops

First, I get the coordinates of one location (usually the location of the user)
then I fetch all the shops from the backend server and cache to data to be later used in the shopCards.

Second, I sort the shop data by distance by default then reload the tableview.

Last, I setup the tabbar at the bottom so that it displays which bar we are on.

- [ ] Connect the tabbar items to their respective screens.
- [ ] Make the search bar work.
- [ ] add additional filters.

<p align="middle">
<img src="./display_images/shops.png" width="50%" />
</p>

## Appointments 

This was the toughest screen to make and the messiest because there are a lot of parts to it. 
It contains two collection views, two views that are clickable, and a few labels and buttons.
One view navigates to a tableview screen and the other is an actionsheet which should be converted to a
tableview but for this project since we don't have a lot of barbers I thought it was best to create an
actionsheet for all barbers at a shop.

- [ ] Try adding a tabbar at the bottom if it doesn't look good remove it.
- [ ] Refactor the code because it is all over the place. 
- [ ] Add navigation to another screen when the appointment is successfully created. 


<p align="middle">
	<img src="./display_images/appt.png" width="45%" />
	<img src="./display_images/appt2.png" width="45%" />
</p>
