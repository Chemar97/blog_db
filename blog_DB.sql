CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "username" varchar,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "entries" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "publication_date" date NOT NULL
);

CREATE TABLE "rel_entry_category" (
  "id" SERIAL PRIMARY KEY,
  "entry_id" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "category_name" varchar NOT NULL
);

CREATE TABLE "comment" (
  "id" SERIAL PRIMARY KEY,
  "content" text NOT NULL,
  "user_id" int NOT NULL,
  "post_id" int NOT NULL,
  "publication_date" date NOT NULL
);

ALTER TABLE "entries" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("post_id") REFERENCES "entries" ("id");

ALTER TABLE "rel_entry_category" ADD FOREIGN KEY ("entry_id") REFERENCES "entries" ("id");

ALTER TABLE "rel_entry_category" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");


insert into users (
	name, 
	username, 
	age, 
	email, 
	"password"
)
values
	('Jose', 'Wolf', 25, 'jose@gmail.com', 'jose123'),
	('Luis', 'Giga', 18, 'luis@hotmail.com', 'luis456');

select * from users u ;


insert into categories (
	category_name
)
values
	('travel'),
	('daily routine'),
	('design');

select * from categories c  ;


insert into entries (
	user_id, 
	title, 
	description,
	publication_date
)
values
	(1, 'primer post de Jose', 'descripcion 1', '2021-05-12'),
	(1, 'segundo post de Jose', 'descripcion 2', '2021-05-25'),
	(2, 'primer post de Luis', 'descripcion 3', '2021-10-05'),
	(2, 'segundo post de lus','descripcion 4', '2022-01-10');

select * from entries e ;


insert into comments(
	"content" ,
	user_id,
	entry_id,
	publication_date
)
values
	('primer comentario', 1, 1, '2021-05-13'),
	('segundo comentario', 2, 4, '2022-01-11'),
	('tercer comentario', 1, 2,'2022-01-12');

select * from "comments" c; 


insert into rel_entry_category (
	entry_id,
	category_id
)
values
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 3),
	(4, 1),
	(4, 3),
	(4, 2)
;

select * from rel_entry_category rec ;


select u.username, e.title, e.description  from users u 
join entries e on e.user_id = u.id ;

select u.username, e.title, e.description, c."content"  from users u 
inner join entries e on e.user_id = u.id
inner join "comments" c on e.id = c.entry_id ;

select u."name", e.title, c.category_name  from users u 
inner join entries e on u.id = e.user_id 
inner join rel_entry_category rec on e.id = rec.entry_id
inner join categories c on rec.category_id = c.id;










