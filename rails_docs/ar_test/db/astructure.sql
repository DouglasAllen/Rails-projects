CREATE TABLE "articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "text" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "commenter" varchar, "body" text, "post_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "title" varchar, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE TABLE "system_settings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL);
CREATE TABLE "widgets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "stock" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_comments_on_post_id" ON "comments" ("post_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20150203110000');

INSERT INTO schema_migrations (version) VALUES ('20150203140000');

INSERT INTO schema_migrations (version) VALUES ('20150203150000');

INSERT INTO schema_migrations (version) VALUES ('20150204000000');

INSERT INTO schema_migrations (version) VALUES ('20150204070000');

INSERT INTO schema_migrations (version) VALUES ('20150207163123');

INSERT INTO schema_migrations (version) VALUES ('20150207163909');

INSERT INTO schema_migrations (version) VALUES ('20150207170924');

