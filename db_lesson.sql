-- Q1
CREATE TABLE departments (
departments_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name varchar(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Q2
ALTER TABLE people add department_id int(10) unsigned after email ;
-- Q3
INSERT INTO departments (name)
values
("営業"),
("開発"),
("経理"),
("人事"),
("情報システム")
;

INSERT INTO people (name,department_id,age,gender)
values
('大谷翔平', 1, 30, 1),
('山本由伸', 1, 26, 1),
('千賀滉大', 1, 32, 1),
('小田裕也', 2, 35, 1),
('東浜巨', 2, 34, 1),
('西川愛也', 2, 25, 1),                                                                 
('柳田悠岐', 2, 36, 1),
('金子千尋', 3, 41, 1),
('伊藤光', 4, 35, 1),
('岸孝之', 5, 40, 1)
;

INSERT INTO reports(person_id,content)
values
(7, '飛び込み営業をしました'),
(8, 'アポ5件いきました'),
(9, '契約とれました'),
(10, 'システム開発しました'),
(11, 'テストしました'),
(12, '計画を立てました'),
(13, '設計をしました'),
(14, '領収証の計算をしました'),
(15, '面接をしました'),
(16, '情報の共有をしました')
;
-- Q4
UPDATE people SET department_id = 1 where department_id IS NULL;
-- Q5
-- DELETE FROM people WHERE person_id >= 17;

-- UPDATE people SET age=30, gender=1 where person_id = 7;
-- UPDATE people SET age=26, gender=1 where person_id = 8;
-- UPDATE people SET age=32, gender=1 where person_id = 9;
-- UPDATE people SET age=35, gender=1 where person_id = 10;
-- UPDATE people SET age=34, gender=1 where person_id = 11;
-- UPDATE people SET age=25, gender=1 where person_id = 12;
-- UPDATE people SET age=36, gender=1 where person_id = 13;
-- UPDATE people SET age=41, gender=1 where person_id = 14;
-- UPDATE people SET age=35, gender=1 where person_id = 15;
-- UPDATE people SET age=40, gender=1 where person_id = 16;

SELECT * FROM people ORDER BY age DESC;
-- Q6
SQLにおいて、データはテーブル（table）という単位で管理されます。テーブルは行と列から成り立っており、行はレコード（record）、列は**カラム（column）**と呼ばれます。

例えば、users という名前のテーブルがあり、その中に name、email、age という3つのカラムがあるとします。このテーブルには複数のレコードが格納されていると想定できます。

この users テーブルから name、email、age のカラムを取得するSQLの SELECT 文は以下のようになります。
SELECT name, email, age FROM users;

•	SELECT name, email, age： name、email、age という3つのカラムのデータを取得する
	•	FROM users： users テーブルから取得する

    このSQL文を実行すると、 users テーブルのすべてのレコードについて、 name、email、age のデータが取得されます。

SQLにおいて、FROM句はどのテーブルからデータを取得するかを指定するために使われます。
例えば、テーブル名が ‘people’ の場合、FROM句はこの people テーブルからデータを抽出することを意味します。

以下のSQL文を例に挙げます。

SELECT name, email, age FROM people;

	•	FROM句:
	•	people というテーブルからデータを取得することを示しています。
	•	つまり、データベース内の people テーブルに保存されている全てのレコード（行）の中から、指定された3つのカラムの値を取り出します。

このように、FROM句とテーブル名 ‘people’ を用いることで、どこからデータを取得するかが明確になり、SELECT句で指定したカラムの情報を正しく抽出できるようになっています。

QLにおけるWHERE句は、テーブル内のレコードから特定の条件を満たすものだけを抽出するために使用されます。
例えば、WHERE department_id = 1 という条件は、department_id というカラムの値が 1 であるレコードだけを対象にすることを意味します。

具体的な例として、以下のSQL文を考えてみましょう。

SELECT name, email, age FROM employees WHERE department_id = 1;

このSQL文の説明は以下の通りです。
	•	SELECT句:
	•	name, email, age というカラムからデータを取得することを指定しています。
	•	FROM句:
	•	employees というテーブルからデータを取得することを示しています。
	•	WHERE句:
	•	department_id = 1 という条件を指定することで、テーブル内の department_id カラムの値が1であるレコードだけが抽出されます。
	•	つまり、全てのレコードの中から、department_id が1に一致するデータのみが結果として返される仕組みです。

このように、WHERE句を用いることで、膨大なデータの中から必要な情報だけを効率的に取り出すことができます。



SQLにおけるORDER BY句は、クエリの結果セットを特定のカラムに基づいて並び替えるために使用されます。例えば、created_at というカラムは通常、レコードが作成された日時を示すため、このカラムで並び替えると、データが作成日時順にソートされます。

具体例として、以下のSQL文を考えてみましょう。

SELECT name, email, age FROM users ORDER BY created_at;

このSQL文の説明は以下のとおりです。
	•	SELECT句:
	•	name, email, age の各カラムからデータを取得するよう指定しています。
	•	FROM句:
	•	データ取得元のテーブルとして users を指定しています。
	•	ORDER BY句:
	•	created_at カラムに基づいてレコードを並び替えます。
	•	並び替えのデフォルトは昇順（古い順→新しい順）ですが、必要に応じて DESC を使うことで降順（新しい順→古い順）に変更できます。例えば、最新のレコードを先に表示したい場合は ORDER BY created_at DESC; と記述します。

このように、ORDER BY句を利用することで、データベースから取得する結果の並び順を意図した通りに制御することが可能です。

-- Q7
SELECT * FROM people WHERE age BETWEEN 40 AND 49 AND gender = 1 ;

SELECT * FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 ;

-- Q8
SELECT * FROM people WHERE department_id = 1  ORDER BY age ;

-- Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 GROUP BY gender = 2 ;
-- Q10
SELECT
    出したいカラム名
FROM
    テーブル名
INNER JOIN
    結合したいテーブル1 ON peopleテーブルのperson_id = reportsテーブルのperson_id;
INNER JOIN
    結合したいテーブル2 ON peopleテーブルの = reportsテーブルのperson_id;


SELECT
    people.name, reports.content, departments.name
FROM
    people
INNER JOIN
    reports ON people.person_id = reports.person_id
INNER JOIN
    departments ON departments.departments_id = people.department_id;
-- Q11
SELECT people.name
FROM people 
LEFT OUTER JOIN reports ON people.person_id = reports.person_id
WHERE reports.content IS NULL;