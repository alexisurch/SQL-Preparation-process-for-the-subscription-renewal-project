use sys;
SELECT
    User_data.User_ID,
    User_data.user_name,
    User_data.Full_Name,
    Purchase_data.Subscription_upgrade,
    App_Usage_data.Avg_logins_per_week,
    User_data.Gender,
    App_Usage_data.Time_spent_per_day,
    App_Usage_data.Sign_up_year,
    App_Usage_data.first_time_customer,
    App_Usage_data.Week_since_last_sign_in,
    User_data.User_Group
FROM
    User_data
INNER JOIN subscription_data ON User_data.User_ID = subscription_data.User_ID
INNER JOIN Purchase_data ON User_data.User_ID = Purchase_data.User_ID
INNER JOIN feedback_data ON User_data.User_ID = feedback_data.User_ID
INNER JOIN Content_data ON User_data.User_ID = Content_data.User_ID
INNER JOIN App_Usage_data ON User_data.User_ID = App_Usage_data.User_ID
WHERE 
    App_Usage_data.Week_since_last_sign_in BETWEEN 0 AND 4
    AND App_Usage_data.Time_spent_per_day BETWEEN 30 AND 1500
    AND App_Usage_data.First_time_customer = 'FALSE';
