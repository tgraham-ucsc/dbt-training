## Welcome to the dbt-training

As we continue our data journey with the modern data stack, this repository is intended to be a collaborative space for UCSC staff to learn and gain familiarity with dbt and Snowflake. Therefore, it is **important** to understand that this repository and content are for training purposes only, and no UCSC data will be used during these classes.  

dbt Labs offers free online high-quality training that provides a hands-on experience where participants model data from a fictional retail store using the dbt Cloud product. It's a great way to get experience with dbt and understand the products capabilities.

## Course Assumptions

- Knowledge of SQL:You have written queries that used JOIN or CASE WHEN statements.
- Basic Data Warehouse Knowledge: You have experience querying in a relational database.
- Strongly encouraged: Basic Understanding of Git.


## Important Changes during setup!
The course instructs you to create your own personal GitHub repository and a trial Snowflake account. The changes outlined below will allow you to access the UCSC Snowflake account and work from a shared GitHub repository. 

The dbt Fundamentals course begins with a series of video introductions.  During the third series under "Setup dbt Cloud" there is a section called "Connect to your warehouse and repository"  You will want to **pause at this point** and connect with a project team member that will be able to provide the Snowflake account information as well as authentication information.  

## Important course code accomodations for UCSC's specific Snowflake DBT training schemas

You will need to replace the schema used in the lessons (raw) with the schemas (jaffle_shop & stripe) we have used to stage the training data in UCSC's Snowflake DBT_TRAINING database.
It is best you login to the Snowflake DBT_TRAINING database to see what table(s) reside in each schema so you know when to reference each, but remember to always replace the "raw" schema used in the videos with either the "jaffle_shop" or 'stripe" schemas. This first appears in the "Building your first model" lesson of the "Models" module.

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