
--assessment sql.


mysql> create databases bank;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databases bank' at line 1
mysql> create database bank;
Query OK, 1 row affected (0.04 sec)

mysql> use bank;
Database changed
mysql>
mysql> create table bank(branch_id int primary key,branch_name varchar(20),b
ranch_city varchar(20));
Query OK, 0 rows affected (0.09 sec)

mysql> describe bank;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| branch_id   | int         | NO   | PRI | NULL    |       |
| branch_name | varchar(20) | YES  |     | NULL    |       |
| branch_city | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table account_holder(account_holder_id int primary key,account
_no varchar(20),account_holder_name varchar(30),city varchar(40),contact var
char(20),
    -> ^C
mysql> create table account_holder(account_holder_id int primary key,account_no varchar(20),account_holder_name varchar(30),city varchar(40),contact varchar(20),date_of_account_created date,account_status varchar(15),check(accou
nt_status in ('active','terminated')),account_type varchar(20),balance decim
al(15,2));
Query OK, 0 rows affected (0.08 sec)

mysql> describe account_holder;
+-------------------------+---------------+------+-----+---------+-------+
| Field                   | Type          | Null | Key | Default | Extra |
+-------------------------+---------------+------+-----+---------+-------+
| account_holder_id       | int           | NO   | PRI | NULL    |       |
| account_no              | varchar(20)   | YES  |     | NULL    |       |
| account_holder_name     | varchar(30)   | YES  |     | NULL    |       |
| city                    | varchar(40)   | YES  |     | NULL    |       |
| contact                 | varchar(20)   | YES  |     | NULL    |       |
| date_of_account_created | date          | YES  |     | NULL    |       |
| account_status          | varchar(15)   | YES  |     | NULL    |       |
| account_type            | varchar(20)   | YES  |     | NULL    |       |
| balance                 | decimal(15,2) | YES  |     | NULL    |       |
+-------------------------+---------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> create table loan(loan_no int primary key,branch_id int,account_holde
r_id int, loan_amount varchar(50),foreign key(branch_id) references bank(bra
nch_id),foreign key(account_holder_id) references account_holder(account_hol
der_id));
Query OK, 0 rows affected (0.10 sec)

mysql> describe loan;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| loan_no           | int         | NO   | PRI | NULL    |       |
| branch_id         | int         | YES  | MUL | NULL    |       |
| account_holder_id | int         | YES  | MUL | NULL    |       |
| loan_amount       | varchar(50) | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into bank (branch_id ,branch_name,branch_city) values(1,'mumbia b
ranch','mumbai'),(2,'delhi branch','delhi');
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from bank;
+-----------+---------------+-------------+
| branch_id | branch_name   | branch_city |
+-----------+---------------+-------------+
|         1 | mumbia branch | mumbai      |
|         2 | delhi branch  | delhi       |
+-----------+---------------+-------------+
2 rows in set (0.00 sec)

mysql> insert into account_holder values(1,'IN10001','rahul rao','mumbai','9875
643219','2013-01-20','active','saving',500000.00);
Query OK, 1 row affected (0.03 sec)

mysql> insert into account_holder values(2,'IN10002','vikram singh','delhi','89
75684899','2013-01-10','active','current',600000.00);
Query OK, 1 row affected (0.04 sec)

mysql> select * from account_holder;
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
| account_holder_id | account_no | account_holder_name | city   | contact    | date_of_account_created | account_status | account_type | balance   |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
|                 1 | IN10001    | rahul rao           | mumbai | 9875643219 | 2013-01-20              | active         | saving       | 500000.00 |
|                 2 | IN10002    | vikram singh        | delhi  | 8975684899 | 2013-01-10              | active         | current      | 600000.00 |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
2 rows in set (0.00 sec)

mysql> select *from account_holder;
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
| account_holder_id | account_no | account_holder_name | city   | contact    | date_of_account_created | account_status | account_type | balance   |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
|                 1 | IN10001    | rahul rao           | mumbai | 9875643219 | 2013-01-20              | active         | saving       | 501800.00 |
|                 2 | IN10002    | vikram singh        | delhi  | 8975684899 | 2013-01-10              | active         | current      | 599800.00 |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
2 rows in set (0.00 sec)

mysql> update account_holder set balance =balance-1800 where account_no="IN10001" and balance>=100;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from account_holder;
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
| account_holder_id | account_no | account_holder_name | city   | contact    | date_of_account_created | account_status | account_type | balance   |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
|                 1 | IN10001    | rahul rao           | mumbai | 9875643219 | 2013-01-20              | active         | saving       | 500000.00 |
|                 2 | IN10002    | vikram singh        | delhi  | 8975684899 | 2013-01-10              | active         | current      | 599800.00 |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
2 rows in set (0.00 sec)

mysql> update account_holder set balance = balance+200 where account_no ="IN10002";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from account_holder;
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
| account_holder_id | account_no | account_holder_name | city   | contact    | date_of_account_created | account_status | account_type | balance   |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
|                 1 | IN10001    | rahul rao           | mumbai | 9875643219 | 2013-01-20              | active         | saving       | 500000.00 |
|                 2 | IN10002    | vikram singh        | delhi  | 8975684899 | 2013-01-10              | active         | current      | 600000.00 |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
2 rows in set (0.00 sec)


mysql> insert into account_holder values(3,"IN10003","ali kumar","mu
mbai",'8975864996','2013-02-05','active',"current",70000.00);
Query OK, 1 row affected (0.01 sec)

mysql> select *from account_holder;
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
| account_holder_id | account_no | account_holder_name | city   | contact    | date_of_account_created | account_status | account_type | balance   |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
|                 1 | IN10001    | rahul rao           | mumbai | 9875643219 | 2013-01-20              | active         | saving       | 500000.00 |
|                 2 | IN10002    | vikram singh        | delhi  | 8975684899 | 2013-01-10              | active         | current      | 600000.00 |
|                 3 | IN10003    | ali kumar           | mumbai | 8975864996 | 2013-02-05              | active         | current      |  70000.00 |
+-------------------+------------+---------------------+--------+------------+-------------------------+----------------+--------------+-----------+
3 rows in set (0.00 sec)



mysql> select account_holder_name,city from account_holder group by
city,ccount_holder_name having count(account_holder_name)>1;
ERROR 1054 (42S22): Unknown column 'ccount_holder_name' in 'group statement'
mysql> select account_holder_name,city from account_holder group by city,ccount_holder_name having count(account_holder_name)>1;
ERROR 1054 (42S22): Unknown column 'ccount_holder_name' in 'group statement'
mysql> select account_holder_name,city from account_holder where cit
y in (select city from account_holder group by city having count(acc
ount_holder_id)>1) order by city,account_holder_name;
+---------------------+--------+
| account_holder_name | city   |
+---------------------+--------+
| ali kumar           | mumbai |
| rahul rao           | mumbai |
+---------------------+--------+
2 rows in set (0.01 sec)

mysql> select account_no,account_holder_name from account_holder where day(date_account_cre^C
mysql> ^Cte_account_created)>15;
mysql> ^C4 (42S22): Unknown column 'date_account_created' in 'where clause'
mysql> select account_no,account_holder_name from account_holder where day(date_account_created)>15;
ERROR 1054 (42S22): Unknown column 'date_account_created' in 'where clause'
mysql> select account_no,account_holder_name from account_holder where day(date_of_account_created)>15;
+------------+---------------------+
| account_no | account_holder_name |
+------------+---------------------+
| IN10001    | rahul rao           |
+------------+---------------------+
1 row in set (0.01 sec)

mysql> select branch_city as city,count(branch_id) as count_branch f
rom bank group by branch_city;
+--------+--------------+
| city   | count_branch |
+--------+--------------+
| mumbai |            1 |
| delhi  |            1 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql> describe loan;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| loan_no           | int         | NO   | PRI | NULL    |       |
| branch_id         | int         | YES  | MUL | NULL    |       |
| account_holder_id | int         | YES  | MUL | NULL    |       |
| loan_amount       | varchar(50) | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into loan(loan_no,branch_id,account_holder_id,loan_amo
unt,loainsert into loan(loan_no,branch_id,account_holder_id,loan_amo                                                                            ^C
mysql> ^C
mysql> ^C4 (42S22): Unknown column 'loan_type' in 'field list'
mysql> ^C                                                           unt,loan_type) values(1001,1,1,50000.00,"home"),(1002,1,2,20000,"personal");
mysql> insert into loan(loan_no,branch_id,account_holder_id,loan_amount,loan_type) values(1001,1,1,50000.00,"home"),(1002,1,2,20000,"personal");
ERROR 1054 (42S22): Unknown column 'loan_type' in 'field list'
mysql> alter table loan add loan_type varchar(20);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe loan;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| loan_no           | int         | NO   | PRI | NULL    |       |
| branch_id         | int         | YES  | MUL | NULL    |       |
| account_holder_id | int         | YES  | MUL | NULL    |       |
| loan_amount       | varchar(50) | YES  |     | NULL    |       |
| loan_type         | varchar(20) | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into loan(loan_no,branch_id,account_holder_id,loan_amount,loan_type) values(1001,1,1,50000.00,"home"),(1002,1,2,20000,"personal");
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select *from loan;
+---------+-----------+-------------------+-------------+-----------+
| loan_no | branch_id | account_holder_id | loan_amount | loan_type |
+---------+-----------+-------------------+-------------+-----------+
|    1001 |         1 |                 1 | 50000.00    | home      |
|    1002 |         1 |                 2 | 20000       | personal  |
+---------+-----------+-------------------+-------------+-----------+
2 rows in set (0.00 sec)

mysql> select account_holder.account_holder_id,account_holder.accoun
t_holder_name,loan.branch_id,loan.loan_amount from account_holder jo
in loan on account_holder.account_holder_id=loan.account_holder_id;
+-------------------+---------------------+-----------+-------------+
| account_holder_id | account_holder_name | branch_id | loan_amount |
+-------------------+---------------------+-----------+-------------+
|                 1 | rahul rao           |         1 | 50000.00    |
|                 2 | vikram singh        |         1 | 20000       |
+-------------------+---------------------+-----------+-------------+
2 rows in set (0.00 sec)

