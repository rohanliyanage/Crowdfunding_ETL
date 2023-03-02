CREATE DATABASE crowdfunding_db

CREATE TABLE "campaign" (
    "cf_id" INT NOT NULL,
    "contact_id" INT NOT NULL,
    "company_name" VARCHAR(80)   NOT NULL,
    "description" VARCHAR(100)   NOT NULL,
    "goal" NUMERIC(10,2) NOT NULL,
    "pledged" NUMERIC(10,2) NOT NULL,
    "outcome" VARCHAR(12)   NOT NULL,
    "backers_count" INT NOT NULL,
    "country" VARCHAR(3)   NOT NULL,
    "currency" VARCHAR(3)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(12)   NOT NULL,
    "subcategory_id" VARCHAR(12)   NOT NULL
     CONSTRAINT "pk_campaign" PRIMARY KEY (
         "cf_id"
     )
 );

 CREATE TABLE "category" (
    "category_id" VARCHAR(12)   NOT NULL,
    "category" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
    "category_id"
    )
  );

CREATE TABLE "contacts" (
    "contact_id" INT NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "email" VARCHAR(60)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
    "contact_id"
    )
  );

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(12)   NOT NULL,
    "subcategory" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
       "subcategory_id"
    )
 );

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

SELECT
    cf_id,
    contact_id,
    company_name,
    description,
    goal,
    pledged,
    outcome,
    backers_count,
    country,
    currency,
    launch_date,
    end_date,
    category_id,
    subcategory_id

FROM
    campaign;


SELECT
    category_id,
    category

FROM
    category;
	


SELECT
    contact_id,
    first_name,
    last_name,
    email

FROM
    contacts;



SELECT
    subcategory_id,
    subcategory
	
FROM
    subcategory;