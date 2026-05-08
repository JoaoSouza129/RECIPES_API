CREATE TYPE ROLE_FUNCTION AS ENUM('ADMIN','USER');
CREATE TABLE USERS(
    id INTEGER PRIMARY KEY,
    username VARCHAR(256),
    email VARCHAR(256) unique,
    password VARCHAR(256),
    role ROLE_FUNCTION,
    created_at DATE
);

CREATE TABLE INGREDIENTS( 
    id INTEGER PRIMARY KEY,
    name VARCHAR(256) unique
);

CREATE TABLE PANTRY_ITEMS(
    user_id INTEGER,
    ingredient_id INTEGER,
    quantity INTEGER,
    PRIMARY KEY(user_id,ingredient_id)
);

CREATE TABLE RECIPE_INGREDIENTS( 
    recipe_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY(recipe_id,ingredient_id)
);

CREATE TABLE RECIPES( 
    id INTEGER PRIMARY KEY,
    name VARCHAR(256),
    instructions VARCHAR(256),
    created_by_user_id INTEGER,
    created_at DATE,
    CONSTRAINT fk_user
    FOREIGN KEY (created_by_user_id)
    REFERENCES USERS(id)
    
)