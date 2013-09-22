-- CREATES INITIAL DATABASE WITH TABLES VERSION 1.0
-- should at least work with sqlite3 and mysql!
CREATE TABLE buddy_study (
    id VARCHAR( 20 ) PRIMARY KEY,
    study VARCHAR( 120 )
 );

CREATE TABLE buddy_chatMessages (
    idBuddy VARCHAR( 20 ),
    idIncoming VARCHAR( 20 ),
    message TEXT,
    dateSend Date,
    PRIMARY KEY( idBuddy, idIncoming )
 );

CREATE TABLE buddy_nationality (
    id VARCHAR( 20 ) PRIMARY KEY,
    short_name VARCHAR( 60 )
);

--idBuddy,idIncoming,message,dateSend from buddy_chatMessages
