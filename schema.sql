-- sql dialect: postgres

create table skill_types (
  id serial primary key,
  name text,
  description text
);

create table skills (
  id serial primary key,
  type int,
  start_year date,
  description text,
  foreign key type references skill_types.id
);

create table jobs (
  id serial primary key,
  employer_name text,
  job_title text,
  start_date date,
  end_date date,
  web_address text
);

create table job_skills (
  job_id int primary key,
  skill_id primary key,
  foreign key job_id references jobs.id,
  foreign key skill_id references skills.id
);

create table job_duties (
  id serial primary key,
  job_id int,
  description text,
  foreign key job_id references jobs.id
);

create table projects (
  id serial primary key,
  name text,
  deploy_date date,
  web_address text,
  repo_address text,
  description text
);

create table project_skills (
  project_id int primary key,
  skill_id int primary key,
  foreign key project_id references projects.id,
  foreign key skill_id references skills.id
);

create table project_attributes (
  id serial primary key,
  project_id int,
  description text,
  foreign key project_id references projects.id
);
