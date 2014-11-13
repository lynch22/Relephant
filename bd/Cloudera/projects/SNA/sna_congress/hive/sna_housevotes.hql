create database if not exists SNA_Congress;

use SNA_Congress;

set hive.exec.mode.local.auto=true ;

create table if not exists houseVotes(
  session int,
  year int,
  roll int,
  date timestamp,
  updated timestamp,
  category string,
  type string,
  question string,
  required string,
  result string,
  voter int,
  voteValue string,
  state string)
row format delimited fields terminated by '\t'
collection items terminated by ',' ;



