 create table table1( ColumnA int);
 create table table2( ColumnB int);
Query OK, 0 rows affected (0.30 sec)

mysql> insert into table1 values(1),(2),(3);
Query OK, 3 rows affected (0.09 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into table2 values(2),(3),(4);
Query OK, 3 rows affected (0.10 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from table1;
+---------+
| ColumnA |
+---------+
|       1 |
|       2 |
|       3 |
+---------+
3 rows in set (0.00 sec)
mysql> select * from table2;
+---------+
| ColumnB |
+---------+
|       2 |
|       3 |
|       4 |
+---------+
3 rows in set (0.00 sec)

mysql> select * from table1, table2; --cross join
+---------+---------+
| ColumnA | ColumnB |
+---------+---------+
|       3 |       2 |
|       2 |       2 |
|       1 |       2 |
|       3 |       3 |
|       2 |       3 |
|       1 |       3 |
|       3 |       4 |
|       2 |       4 |
|       1 |       4 |
+---------+---------+
9 rows in set (0.00 sec)



mysql> select * from table1 left join table2 on table1.ColumnA=table2.ColumnB;---left join
+---------+---------+
| ColumnA | ColumnB |
+---------+---------+
|       1 |    NULL |
|       2 |       2 |
|       3 |       3 |
+---------+---------+
3 rows in set (0.00 sec)

mysql> select * from table1 right join table2 on table1.ColumnA=table2.ColumnB;---right join
+---------+---------+
| ColumnA | ColumnB |
+---------+---------+
|       2 |       2 |
|       3 |       3 |
|    NULL |       4 |
+---------+---------+
3 rows in set (0.00 sec)

mysql> select * from table1 left join table2 on table1.ColumnA=table2.ColumnB union select * from table1 right join table2 on table1.ColumnA=table2.ColumnB;--full join
+---------+---------+
| ColumnA | ColumnB |
+---------+---------+
|       1 |    NULL |
|       2 |       2 |
|       3 |       3 |
|    NULL |       4 |
+---------+---------+
4 rows in set (0.09 sec)

mysql> select * from table1 inner join table2 on table1.ColumnA=table2.ColumnB;--inner join
+---------+---------+
| ColumnA | ColumnB |
+---------+---------+
|       2 |       2 |
|       3 |       3 |
+---------+---------+
2 rows in set (0.00 sec)
---self join

