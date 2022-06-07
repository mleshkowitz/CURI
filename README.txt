
QuestionRatings.xslx 

Ratings were collected by asking 39 participants to rate their interest and urge towards 143 questions. 
Participants were instructed:

In the following study, you will be asked to provide two types of judgments on each of the questions below. The ratings are for the questions' *Interest* and *Urge*, both on a scale of 1-10. 
To clarify what we mean, let us explore a few examples:
    1. What is Justin Bieber’s favorite breakfast cereal brand?
     Many expect that the answer will not be interesting. Yet, most people experience an urge to find out what it is.

     2. What are the genetic differences between Apes and Humans?
     Here, many expect the answer to be interesting. Yet, most people do not experience a strong urge to find out the answer right now.

     3. What explorer wrote the famous reply poem to Christopher Marlowe's 1599 poem "The Passionate Shepherd to his love"? 
     Here most people expect that the answer will not be interesting, and they also do not have an urge to find out what it is.

Each participant was asked to rate both their urge and interest for all 143 questions on a 1-10 scale. 

The columns in this file:
Question: The question participants were asked to rate
Interest: Mean interest rating across all participants
Urge: Mean urge rating across all participants
Zinterest: The ZScore of (Mean) Interest across all questions
Zurge: The ZScore of (Mean) Urge across all questions
ZinterestTransformed: The transformed Zinterest, equal to 2*Zinterest-Zurge
ZurgeTransformed: The transformed Zurge, equal to 2*Zurge-Zinterest

-------------------------
QuestionTopics.xslx

Each question was associated with a subset of 29 topics
Assoications were performed by human classifiers, see paper for more details regarding the process. 

The columns in this file:
Question: The question
label: a label associated with this question

(a question may be associated with multiple labels, by appearing in multiple rows)
---------------------
Topics.xlsx

The QuestionTopic associations were used together with the QuestionRatings to calculate Interest and Urge ratings for each topic, as described below.

The columns in this file:
topic: The 29 topic labels
Interest: Mean Interest rating of all questions associated with this label
Urge: Mean Urge rating all questions associated with this label
ZInterestTransfromed: Mean ZInterestTransfromed rating of all questions associated with this label
ZUrgeTransfromed: Mean ZUrgeTransfromed rating of all questions associated with this label
NumberofQuestions: Number of questions associated with this topic label

---------------------------

CURIOSITY-participants_values.xlsx
Each value in this sheet reflects the Interest/Urge preference of one participant in our experiment. Column names reflect the experiment and condition. 
For experiments 1,3,4: Values represent the proportion of choices in the interest question (calculated based on non excluded trials, see paper for more details)
For experiment 2: Values represent the mean preference (across all non excluded trials, see paper for more details), where 1 represents high preference for the high Urge question and 10 represents high preference for the high Interest question. 

First Row in spreadsheet: Name of experiment
Second Row: Name of condition
