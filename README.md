<h1> Runr </h1>
A management tool made by a manager, to managers. I personally dislike using pen and paper in 2023, using it in a daily basis and having trouble to see information that I should be seeing quickly with a decent user interface, made me come up with Runr. You will be able to manage your shifts ideally using a tablet for maximum  mobility, write down your to-dos and remembers and quickly understand what will be happening within the next hours of your shift. 
<h3>Dashboard</h3>
<video src="https://user-images.githubusercontent.com/86897214/230901863-87f16d14-07e0-4c17-9b81-bdd8fdb36e57.mp4"></video>
A fancy looking dashboard carrying information of all the other parts of the app, all in a nice visual to make it all visual appealing and bringin information in an easier way to help the user plan around their day.

As per my last commits, this is how dashboard looks currently on development:
<img src="https://i.imgur.com/HyTHQrt.png">

<h3>Floorplan</h3>
A page for the user to allocate workers to specific positions that they will be able to define on restaurant setup
<h3>Shift Report</h3>
In here the user can define who is working and the time that they will be there for. Made possible by hotwire, this page is fully responsive and feels so quick it's almost like it's alive!
<img src=https://i.imgur.com/LTxbhXw.png">


Also can read a specific .csv file and translate it into the database into a editable model

<h3>Tasklist</h3>
Quickly create notes, mark them as done or simply discard the ones you don't need.
<img src="https://i.imgur.com/H0V8Les.png">


<h4>Tech stack</h4>
I am using Ruby on Rails with PostgreSQL. So far I haven't wrote any Javascript, only using hotwire with turboframe and turbo stream so far. Lot's of back end strategies have been put in place. There is crud almost everywhere, with workers, restaurant, shift and tasklist. I am trying to make the crud actions faster for the user by using hotwire.
