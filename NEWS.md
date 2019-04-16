## 2019-04-16
### What did you do this week?
 
- Julia: I spent most of the week working on the historic data tab to get it to work and reflect our plan. First, I made the graphs be in a fluid page, this allows for the size of the boxes and visuals to change based on the size of the window. I then put all of our content for the tab in separate boxes that are collapsible. I did this to minimize users' scrolling. I also found out how to use ggplot with ractive data (aes_string(x =input, y= input)) so I used that to make a visualization where the user can make a custom correlation graph by picking the variables that they want. I also made a way for the user to switch between orchardmet and whatelymet in the historic data tab. I also started working on a "favstats"" table that allows the user to get a summary of the variable the have chosen. I then worked on the raw data tab. I figured out how to get the columns in the data set to filter (allow user to select which variables). I also started writing the method section of the final paper but have not put it in an rmd file yet.

- Marta: 

- Mirella: I've been trying to get the images to work for all computers, since the images are currently only working on mine. I have also started working on the introduction of the paper. 

### What is it that you're struggling with right now?

- Julia: I'm still working on the toggle between data sets in the "raw data tab" and dowload the user's data. I have a download data button but it throws this error "ERROR: Reading objects from shinyoutput object not allowed." I'm also struggling with getting the wind rose chart to be interactive. I tried plotly and highchart but it seems like our wind direction data is in a diffrent format where these methods don't work. I'm also unsure about how we can  extract info from the current weather table and make it into a text object. I also don't know how "rticles" package works or how to format writings in rmd.file format.

- Marta: 

- Mirella:Understanding why the images aren't working when the method I got from the shiny website states it should work with the way we did it.     

### What are you planning to do next week?

-Julia:  I'm planning on working on our final paper draft! I'm also planning on finishing the "raw data tab" to be workable. I would like to get the wind rose chart to be interactive. I'm also planning on writing instructions on how to use each tab and the tue items in each tab(like how to read a windrose chart). I'm also hoping to help with the current weather tab and do more research and see how to extract the data from the existing table to be text variable. I also want to add some more comments to my recent code to make it easier to read for other people. I also think we should work on some of the documentation for the ceeds package (the "Description: What the package does (one paragraph)"). 

- Marta: 

- Mirella: Working on the final paper of the draft, collecting MacLeish pictures for the website (will be going to Macleish). Help my team in the sections they are working on if they need any help. 

## 2019-04-09
### What did you do this week?
 
- Julia:  I started working on the tab to allow the user to download the data. I also found out how to use ggplot and reactive user data and I tried to follow the example that I found online to use ggplot. I also spent most of the week trying to find the bug in final.rmd. I learned that something is wrong with the "about" tab but I'm not sure what. I also tried to see if it was because the data was too big to load and was stalling and that's why our plots did not appear and used a smaller data set but that was not the case.  

- Marta: Mirella and I started to debug the tabs problem, but Ben has already solved that problem for us.

- Mirella: Marta and I started a new file to debug and clean our work to figure out what was going wrong. 

### What is it that you're struggling with right now?

- Julia: I'm still struggling with debugging the code that I have already written and seeing what went wrong to make tabs no longer work in final.Rmd. I also struggling with allowing users to toggle between orchard and whatley for the graphs and certain variables.  I'm also unsure about how to extract info from the current weather table and make it into a text object.

- Marta: We're struggling with debugging, seeing if ggplot can be reactive and also putting what graphs we want into the tabs.

- Mirella: The debugging, and getting every file we have to work smoothly toguether.     

### What are you planning to do next week?

-Julia:  I'm planning on solving where the bug is in my code and get the tabs to be working again, I'm pretty sure it might just be an unfound typo because I did not change any of the logical ways that this code runs compared to (HighchartJulia.Rmd).  I'm also planning on reading more examples online that could help me debug our code.

- Marta: I'm planning on working on the current weather tab, so that all the appropriate visualizations appear.

- Mirella: Having a better demo and clear structure of our project to present for our technical report. 

## 2019-04-02
### What did you do this week?
 
- Julia:  I spent most of this week working on the infrastructure  of our final dashboard. I first made a new file to combine all of the elements that we want on our final dashboard. I also renamed the tabs to reflect our mark up design. I also tried to figured out how to get many plots on one page. I also made a wind rose graph in ggplot and found a package to work with wind data ("rWind"). I also worked on trying to get different data sets to show up and be filtered in the raw data tab. I also finished the get_lastyear function to maybe help us get a smaller data set to work with. This week, I also made other temperature variables that are in fahrenheit and rounded it to 2 places because Paul told us that that is as accurate as temperature can be collected at. I also made a current weather data set so we can get a table with only the current 10 min weather (and I hope to make that into a function in the ceeds package ). I also was trying to see what happened to our precipitation graph and then saw that all of the entries in our data set for rainfall are now zero and we should ask Paul about that?! Everything seemed to be fine until there was an error where tabs appear to be no longer working properly and so I'm going to spend the rest of the week trying to see why this is the case and debug the code. I did not get as much done as I would have liked to and I need to work on my time managment skills. 


- Marta: 

- Mirella:I was working on getting the download filtered data to work. I'm
trying to figure out whether it would be a better idea to work with gridextra package (vs how we have it) when getting multiple plots into one tab. 

### What is it that you're struggling with right now?

- Julia: I'm struggling with debugging the code that I have already written and seeing what went wrong to make tabs no longer work in final.Rmd. I also think I need to expirenment more with tabs to see what is truly wrong with our dashboard. I'm also struggling with how to get users to toggle between data sets and download the data. I also need to find away to get our code to run faster which might help with the debugging process. I'm also struggling with how to make my code more readable bacuse to me it is fine but it seems like that it might be only readable to me and I need feedback on how to make it more readable to others. 

- Marta:  

- Mirella: What's the most efficient (and better) way to have the download filtered data for our final project. We have a few options; however, they are not exactly what our client wants. Havign trouble catching up with how tab works since it stops working.   

### What are you planning to do next week?

-Julia:  I'm planning on solving where the bug is in my code and get the tabs to be working again, I'm pretty sure it might just be an unfound typo because I did not change any of the logical ways that this code runs compared to (HighchartJulia.Rmd). With that said I would like to better understand tabs so if I need to change something later on there will be no mistakes or be easier to find them. I also would like to finish the tab to allow the user to download the data (I already found an example so we just need to follow that). I also want to finally allow users to toggle between orchard and whatley for the graphs and certain variables. I'm also planning on getting my code to be more readable for other people. I'm also planning on trying to extract info from the current weather table and make it into a text object. 

- Marta: 

- Mirella: Work on our report, and help Julia with the multiple plots in one tab (weather that is with the gridextra package or how we have it right now).

## 2019-03-26
### What did you do this week?
 
- Julia: I got the tabs in the dashboard (see HighchartJulia.Rmd) to work as they should. I also added a function in macleish.R called get_lastyear(x) which takes in a data set,x, and returns and filters the data only from the last year. I also started trying to add in a tab for downloading user filtered data sets into our dashboard. This week, we also made a sketch of what we want our dashboard to look like. 

- Marta: I worked on a mockup of what the final app should look like and started working on replicating the classic Tufte weather visualization to our weather data.
- Mirella: I continued trying to work in getting the tabs to work. Used Julia's example to learn and know what I was doing wrong when referencing to Data Camp.

### What is it that you're struggling with right now?

- Julia: While I got tabs to work, I would like a better/deeper understanding of how they work. I'm also confused because the highcharts that were working are no longer work on our dashboard. It seems like the boxes are too small or something. The only chart that is working is the one for max wind speed. I'm still struggling with making our app run faster and be more efficient beause it takes a long time for everything to load. I'm still trying to find the best way to get data to be downloaded by users.   

- Marta: I want to explore the highcharter package more and see what visualizations we can create, specifically the wind rose visualization for the wind data. 

- Mirella:  Although the tabs are working, I want to understand it more properly. I want to understand how one can add more to each tab page (in addition to high charts) without it being too overwhelming. 

### What are you planning to do next week?

-Julia: Now that we have working tabs we need to we arrage the tabs to be the ones we want for our final dashboard. We would like start working on our final dashboard where we can have everything in one app .I'm planning on making the tabs reflect our design and putting the charts where they make sense based on the design. I'm also planning on working on using orchard data because all of our existing charts are from Whately (we might want to create a way to toggle between the two sets of data). I would also like to fix our highcharts in the app we have and see why they are not showing up in big enough boxes. I also going to work more on a tab for downloading user filtered data sets into our dashboard.

- Marta: I plan to keep working with the highcharter package.

- Mirella: Adding the additional features of each tab page, and working on the wind graph (similar to what Paul had on the website).

## 2019-03-19
### What did you do this week?
 
- Julia: I spent a lot of time this week trying to fix read_whately() in the ceeds package but I am still having problems. I also figured out how to allow user to download data from a shiny dashboard. I'm also still working on making tabs for the shiny dashboard and the layout. Over Spring break I did alot of research and watched tutorials about shiny dashboard. I also added some comments to my code to make it easier to read. 
- Marta: I created a precipitation line graph on ggplot that we can hopefully make reactive.
- Mirella: I worked in fixing the tabs with the correct graphs. Explored other shiny data camp courses to help me. 

### What is it that you're struggling with right now?

- Julia: I'm still having problems with how to make the tabs in the dashboard to work as they should. I'm also having a hard time how to make more functions in the ceeds package. I'm also struggling to make read_whately and read_orchard more efficient but also work. 
- Marta: Making a ggplot reactive in Shiny.
- Mirella:  I am struggling understanding where the graphs would be the most appropriate to locate in my code. The examples I've seen either have for loops to render or a graph name. I will have to double check with my team to see how our graphs will work. 

### What are you planning to do next week?

-Julia: I feel like we are on the cusp of getting tabs to work and I think that I can get that done this week. I'm also planning on trying to fix the errors in the Ceeds package. I'm also hoping to combine all of the work on one dashboard (after tabs work). I also want to create a data file that is smaller to work with for our tests. 
- Marta: Come up with a mock-up of what we want our app to look like ultimately. Also, keep working on data visualizations that we can maybe use. 
- Mirella: Have all the tabs fix, and support my team with design for the dashboard and an easier way to download the data. 

## 2019-03-05
### What did you do this week?
 
- Julia: This Week I explored highcharter package and made some graphics using highcharter. I also worked on incorporating tabs into the shiny app. I also looked into the lubridate pacakge to filter the data by date and I figured how to filter the data for just the past week or month using the today() function.
- Marta: This week I continued to work on the precipation graph.
- Mirella: This week I worked on the tabs for our dashbiard. I started a new Shiny DataCamp course that helped me start the tabs. I completed a temperarture graph as well. 

### What is it that you're struggling with right now?

- Julia: I'm still trying to use ggplot if I also want to filter in Shiny. I also still don't have access to the shiny server. I'm also still trying to see how tabs work. I'm also currently struggling to find the best way for allowing a user to download filtered data, because highcharter allows users to download filtered data but only variables used in the chart. 
- Marta: I'm struggling with integrating ggplot into Shiny and also finding the most efficient way to depict rainfall since it is an accumulation.
- Mirella: I am trying to put each the graphs into their corresponding tab. 

### What are you planning to do next week?

-Julia: I'm planning on working more on the user dashboard interface to get tabs to be able to work with our plots. We are also going to work on the ceeds package documentation and the README. I also think it would be good to put the function that filters data for just for the last week/last month in our ceeds package. I also am planning on annotating code that I have already written to make it easier for others and my future self to read. 
- Marta: I'm planning on catching up with Julia and Mirella regarding how the last meeting with Paul went and discussing how we can move forward effectively.
- Mirella: Finish with the tabs, and also work with the filtering data (help Julia). As a team, determine our goals and expectations for our project. 

## 2019-02-26
### What did you do this week?
 
- Julia: This Week I created a function in Our Ceeds package called read_orchard() similar to read_whately() to get real time Orchard met data! I also made some exploratory data visualizations using the updated data.
- Marta:
- Mirella: I updated R since the latest version was not letting me work with the code and packages we want to work with. I'm also trying to create a temperature data visualization.  

### What is it that you're struggling with right now?

- Julia: I don't understand how to turn reactivevalues into a data frame, in order to use ggplot in the shiny dashboard. This is the error I keep on getting : "ggplot2 doesn't know how to deal with data of class reactivevalues." Can I not use ggplot if I also want to filter? I'm also struggling with trying to parse the "When" variable to be a date and then grouping by date. I'm also confused about why we don't need to import "macleish" in our ceeds package.
- Marta:
- Mirella: I'm having a hard time trying to get the real time data to work in my computer. 

### What are you planning to do next week?

-Julia: I'm planning on working more on the user dashboard interface to get filtering to be able to work with our plots. We are also going to work on the ceeds package documentation and the README. We are also planning on meeting with Paul this Thursday.  
- Marta:
- Mirella: My computer to be ready, so I can finalize a data visualization for Temperature. And to start working in other graphs for out dashboard. 

## 2019-02-19
### What did you do this week?

- Julia: I start work on using some of the data from the macleish package and trying to figure out how to best visualize it. I also started to  play around with shiny.(Shiny.rmd) This week we also talked to Paul and  decided what needed to be done for the next coming weeks.
- Marta: I finished the Datacamp Shiny course. We met up with Paul last week and came up with tasks we need to do.
- Mirella: I was able to install the macleish package, and start working with the data. We also met Paul last Thursday, and we were able to talk about our struggles with him and get some of his input. 

### What is it that you're struggling with right now?

- Julia: I'm having a hard time trying to access real time data. I followed the code from https://github.com/beanumber/macleish/tree/e4625a8f88b1181785fe5bbb8f3d5f7fd6f37b45 and I still don't really understand how the ETL framework works. 
- Marta: I'm still struggling with getting used to Shiny.
- Mirella: Whether or not it would be a good idea to further expand the current Macleish package, since there are quite a few variables that our client would like to include in the new dashboard. 

### What are you planning to do next week?

-Julia: I'm planning on doing a more thorough data analysis to get a better idea of what vizualizations make sense in the context of our project. I'm also planning on doing more with real time data because write now I'm just looking at Whately_2015 data as a first step. I also think that we as a team were planning on getting in contact with Suzanne Palmer because according to Paul, she has already started redoing the dashboard.
- Marta: Getting some visualizations put together with the weather data we now have access to.
- Mirella: Start creating a graph for the dashboard, and also have started mutating the data if necessary. 


## 2019-02-12
### What did you do this week?

- Julia: I finished the the Shiny DataCamp Introduction Course and started investigating the weather data. We also emailed Suzanne about getting a account on Shiny Server.
- Marta: We were able to get the two weather data files from Suzanne and started exploring Shiny.
- Mirella:We emailed Suzanne, and started playing with Shiny after taking the DataCamp Shiny Introduction course. We also meeting Paul this Thursday. 

### What is it that you're struggling with right now?
 - Julia:  I'm still having trouble being able to use/upload the data in rstudio to be able to use I think it is uploaded but when I make a dash board it says "object not found." I think this could be because I'm misunderstanding how to use etl_extract to get the data.
- Marta: To see which parts of Shiny we can utilize for Paul's dashboard and getting the data loaded in successfully.
- Mirella:To be confident with Shiny and be able to start showing some graphs. And, hopefully after meeting with Paul this week, we have a clear understanding which part to start with in Shiny. 

### What are you planning to do next week?
- Julia: I'm planning on working on creating a very basic Shiny app for weather data. I'm also planning on learning more about dygraphs and how to implement them in R. 
- Marta: We have a meeting scheduled with Paul this Thursday so hopefully we can show him some examples of the Shiny app and ideas we have moving forward. 




## 2019-02-05

### What did you do this week?

- Julia : This week I worked through parts of the Data Camp course “Building Web Applications in R with Shiny.”  I also did some reading about the Shiny (http://rstudio.github.io/shinydashboard/index.html) and how it works. 

- Marta: This week I also started working on the Data Camp course on building web apps with Shiny. We also met up with Paul on Friday and we learned more about what his purposes and intended audience were in building the Macleish weather station site.

- Mirella: Before meeting with our client, we used the website our client wants us to work on to understand out client more before meeting him. 
    After coming up with questions as a team, we emailed our client as soon as possible. Fortunatley, he was available to meet this week.
    Thus, we were able to meet discuss the project with him and learn more about what need to prioritize for our project. After discussing
    as a group, we decided to learn Shiny through Data Camp for this project. I've started the course and I am currently in the process of
    completing the Shiny Introduction course. 

### What is it that you're struggling with right now?

- Julia: I have a questions about Shiny and how we can use it in our project.
- Marta: I'm still learning about Shiny and how we can apply it to our project.
- Mirella: As a team, trying to access the 10 minute data report. Trying to figure out the cleaest way to access it and a let it be availbale for the public. 

  
- Marta:
- Mirella:Getting the data clean into R. 

### What are you planning to do next week?
- Marta: Hopefully get access to the Shiny server and keep playing around with Shiny.

- Julia: I'm planning on reading more of the weather report that Paul sent us to get a better feel for the data. I'm also planning on trying to experiment with shiny in r with sample data sets to see how it works better.  
    
- Marta: I'm planning on finishing up the Data Camp course and possibly doing another if I feel like that'll help me understand it more.
- Mirella: Finish the Shiny DataCamp Introduction Course, and meet Paul again. 
