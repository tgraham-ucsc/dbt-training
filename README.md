## Welcome to the dbt-training

As we continue our data journey with the modern data stack, this repository is intended to be a collaborative space for UCSC staff to learn and gain familiarity with dbt and Snowflake. Therefore, it is **important** to understand that this repository and content are for training purposes only, and no UCSC data will be used during these classes.  

dbt Labs offers free online high-quality training that provides a hands-on experience where participants model data from a fictional retail store using the dbt Cloud product. It's a great way to get experience with dbt and understand the products capabilities.

## Course Assumptions

- Knowledge of SQL:You have written queries that used JOIN or CASE WHEN statements.
- Basic Data Warehouse Knowledge: You have experience querying in a relational database.
- Strongly encouraged: Basic Understanding of Git.


## Important Changes during setup!
The course instructs you to create your own personal GitHub repository and a trial Snowflake account. The changes outlined below will allow you to access the UCSC Snowflake account and work from a shared GitHub repository. 

The dbt Fundamentals course begins with a series of video introductions. Watch all of the videos in the first two series ("Welcome to dbt Fundamentals" & "Who is an analytics engineer?"). During the third series titled "Setup dbt Cloud", you can skip the section called "Loading training data in your warehouse". We have already staged the data in UCSC's Snowflake DBT_TRAINING database. Create your dbt Cloud account in the next section called "Create dbt Cloud account and GitHub repository", but do not create a GitHub repository. You can stop this video at 1:18 after creating your GitHub account, and before creating the GitHub repo. **Pause at this point and do not create the Github repo** . You will need to connect with a project team member who can help connect you to the dbt-training GitHub repo and provide the Snowflake account information.  Once you are all "wired up", proceed with the remaining sections/videos beginning with the section called "dbt Cloud Overview". The hands-on work begins with the "Models" series. Follow the course to its end. 


## Important course code accomodations for UCSC's Snowflake DBT training schemas
You will need to replace the schema (raw) used in the videos with the schemas (jaffle_shop or stripe) we have used to stage the training data. It is best you login to the Snowflake DBT_TRAINING database to see what table(s) reside in each schema so you know when to reference each, but remember to always replace the "raw" schema used in the videos with either the "jaffle_shop" or "stripe" schema. The need for the first replacement appears in the "Building your first model" lesson of the "Models" module.


## Ready to get started?

[Enroll in dbt Fundamentals](https://courses.getdbt.com/courses/fundamentals)

## FAQ

#### Why GitHub and not UCSC managed Bitbucket?
- dbt Cloud, the [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) that is used through out the class integrates natively with GitHub. Should we adopt dbt Cloud, this functionality will likely migrate to Bitbucket.

#### What accounts do I need to create in order to participate in the class?  

[Sign up for GitHub](https://github.com)

[Sign up for dbt cloud](https://cloud.getdbt.com/signup/)

## Additional Resources

- [dbt Slack Channel](https://www.getdbt.com/community/join-the-community)
- [anyone can transform with dbt](https://getdbt.wistia.com/medias/f90bwl0y17)