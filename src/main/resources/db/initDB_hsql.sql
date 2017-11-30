DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE GLOBAL_SEQ AS INTEGER START WITH 100000;

CREATE TABLE users
(
  id               INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name             VARCHAR(255)            NOT NULL,
  email            VARCHAR(255)            NOT NULL,
  password         VARCHAR(255)            NOT NULL,
  registered       TIMESTAMP DEFAULT now() NOT NULL,
  enabled          BOOLEAN DEFAULT TRUE    NOT NULL,
  calories_per_day INTEGER DEFAULT 2000    NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON USERS (email);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR(255),
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES USERS (id) ON DELETE CASCADE
);

CREATE TABLE meals
(
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  date_time   TIMESTAMP    NOT NULL,
  description VARCHAR(255) NOT NULL,
  calories    INT          NOT NULL,
  user_id     INTEGER      NOT NULL,
  FOREIGN KEY (user_id) REFERENCES USERS (id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX meals_unique_user_datetime_idx ON meals (user_id, date_time)