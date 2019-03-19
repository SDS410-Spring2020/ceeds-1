## 2019-03-19
### What did you do this week?
 
- Julia: I spent a lot of time this week trying to fix read_whately() in the ceeds package but I am still having problems. I also figured out how to allow user to download data from a shiny dashboard. I'm also still working on making tabs for the shiny dashboard and the layout. Over Spring break I did alot of research and watched tutorials about shiny dashboard. I also added some comments to my code to make it easier to read. 
- Marta: I created a precipitation graph on ggplot that we can hopefully make reactive.
- Mirella: 

### What is it that you're struggling with right now?

- Julia: I'm still having problems with how to make the tabs in the dashboard to work as they should. I'm also having a hard time how to make more functions in the ceeds package. I'm also struggling to make read_whately and read_orchard more efficient but also work. 
- Marta: Making a ggplot reactive in Shiny.
- Mirella: 

### What are you planning to do next week?

-Julia: I feel like we are on the cusp of getting tabs to work and I think that I can get that done this week. I'm also planning on trying to fix the errors in the Ceeds package. I'm also hoping to combine all of the work on one dashboard (after tabs work). I also want to create a data file that is smaller to work with for our tests. 
- Marta: Come up with a mock-up of what we want our app to look like ultimately. Also, keep working on data visualizations that we can maybe use. 
- Mirella:

## 2019-03-05
### What did you do this week?
 
- Julia: This Week I explored highcharter package and made some graphics using highcharter. I also worked on incorporating tabs into the shiny app. I also looked into the lubridate pacakge to filter the data by date and I figured how to filter the data for just the past week or month using the today() function.
- Marta: This week I continued to work on the precipation graph.
- Mirella: 

### What is it that you're struggling with right now?

- Julia: I'm still trying to use ggplot if I also want to filter in Shiny. I also still don't have access to the shiny server. I'm also still trying to see how tabs work. I'm also currently struggling to find the best way for allowing a user to download filtered data, because highcharter allows users to download filtered data but only variables used in the chart. 
- Marta: I'm struggling with integrating ggplot into Shiny and also finding the most efficient way to depict rainfall since it is an accumulation.
- Mirella: 

### What are you planning to do next week?

-Julia: I'm planning on working more on the user dashboard interface to get tabs to be able to work with our plots. We are also going to work on the ceeds package documentation and the README. I also think it would be good to put the function that filters data for just for the last week/last month in our ceeds package. I also am planning on annotating code that I have already written to make it easier for others and my future self to read. 
- Marta: I'm planning on catching up with Julia and Mirella regarding how the last meeting with Paul went and discussing how we can move forward effectively.
- Mirella:

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
