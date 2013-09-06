create sequence  hibernate_sequence ;

--  schema for the CRM on the service side
--
CREATE TABLE user_account
(
  id bigint NOT NULL,
  first_name varchar (255),
  last_name varchar(255),
  pass_word varchar(255),
  signup_date timestamp  ,
  user_name varchar(255),
  enabled boolean NOT NULL DEFAULT false,
  profile_photo_imported boolean NOT NULL DEFAULT false,
  profile_photo_media_type varchar(255),
  CONSTRAINT user_account_pkey PRIMARY KEY (id )
)
;

-- update the customers
--
CREATE TABLE customer
(
  id bigint NOT NULL,
  first_name varchar(255),
  last_name varchar(255),
  signup_date timestamp  ,
  customer_user_id_fkey bigint NOT NULL,
  CONSTRAINT customer_pkey PRIMARY KEY (id ),
  CONSTRAINT fk24217fdef32da70a FOREIGN KEY (customer_user_id_fkey) REFERENCES user_account (id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'Clark', 'Kent', 'uberman', '2013-06-02 15:33:51', 'clarkkent', true, false, null);
INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'Lois', 'Lane', 'thebetterhalf', '2013-06-02 15:33:51', 'loislane', true, false, null);
INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'Bruce', 'Wayne', 'alfred', '2013-06-02 15:33:51', 'brucewayne', true, false, null);
INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'Tony', 'Stark', 'pepper', '2013-06-02 15:33:51', 'tonystark', true, false, null);
INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'Josh', 'Long', 'cowbell', '2013-06-02 15:33:51', 'joshlong', true, true, 'image/png');
INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'George', 'Jetson', 'sprockets', '2013-07-18 20:52:28', 'georgelee', true, false, null);
INSERT INTO user_account (id, first_name, last_name, pass_word, signup_date, user_name, enabled, profile_photo_imported, profile_photo_media_type) VALUES (NEXTVAL('hibernate_sequence'), 'Roy', 'Clarkson', 'android', '2013-06-28 19:54:14', 'roy', true, false, null);

INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Arjen', 'Poutsma', '2013-06-12 22:37:22', 3);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Mark', 'Pollack', '2013-06-12 22:37:22', 4);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'David', 'Syer', '2013-06-12 22:37:22', 2);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Gunnar', 'Hillert', '2013-06-12 22:37:22', 5);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Rossen', 'Stoyanchev', '2013-06-12 22:37:22', 5);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Josh', 'Long', '2013-06-13 14:13:05', 5);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Brian', 'Dussault', '2013-06-13 17:07:21', 3);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Phill', 'Webb', '2013-06-26 03:54:53', 4);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Scott', 'Andrews', '2013-06-28 19:11:19', 2);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Mark', 'Fisher', '2013-06-28 19:54:14', 5);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Mark', 'Pollack', '2013-06-28 19:54:14', 2);
INSERT INTO customer (id, first_name, last_name, signup_date, customer_user_id_fkey) VALUES (NEXTVAL('hibernate_sequence'), 'Roy', 'Clarkson', '2013-06-28 19:54:14', 5);


-- insert into oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) values (?, ?, ?, ?, ?, ?, ?)
create table oauth_access_token (
  token_id varchar ,
  token bytea ,
  authentication_id varchar ,
  user_name varchar ,
  client_id varchar ,
  authentication varchar ,
  refresh_token varchar  ,
  CONSTRAINT pk PRIMARY KEY (token_id )
) ;

-- sample oauth access tokens
INSERT INTO oauth_access_token(token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) VALUES ('d91394cea02fdccc8d46aff67f8cd304', X'aced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e000578707372001e6a6176612e7574696c2e436f6c6c656374696f6e7324456d7074794d6170593614855adce7d002000078707372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001408a4980147870737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000027400047265616474000577726974657874000662656172657274002434646332663530342d613065382d346537312d396466312d326539623534656630376666', '51489b049d29826c6dd5bcd92a680e40', 'joshlong', 'android-crm', 'aced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c0014636c69656e7441757468656e7469636174696f6e7400434c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f417574686f72697a6174696f6e526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000003770400000003737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000001400200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b7870740009524f4c455f555345527371007e000d740004726561647371007e000d74000577726974657871007e000c70737200486f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e44656661756c74417574686f72697a6174696f6e52657175657374dd2f6c1608186d180200075a0008617070726f7665644c0012617070726f76616c506172616d657465727374000f4c6a6176612f7574696c2f4d61703b4c000b617574686f72697469657371007e00044c0017617574686f72697a6174696f6e506172616d657465727371007e00164c00137265736f6c766564526564697265637455726971007e000e4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000573636f706571007e0017787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c77080000001000000002740009617574686f72697a65740000740013757365725f6f617574685f617070726f76616c7400047472756578737200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000078737200266a6176612e7574696c2e636f6e63757272656e742e436f6e63757272656e74486173684d61706499de129d87293d03000349000b7365676d656e744d61736b49000c7365676d656e7453686966745b00087365676d656e74737400315b4c6a6176612f7574696c2f636f6e63757272656e742f436f6e63757272656e74486173684d6170245365676d656e743b78700000000f0000001c757200315b4c6a6176612e7574696c2e636f6e63757272656e742e436f6e63757272656e74486173684d6170245365676d656e743b52773f41329b39740200007870000000107372002e6a6176612e7574696c2e636f6e63757272656e742e436f6e63757272656e74486173684d6170245365676d656e741f364c905893293d02000146000a6c6f6164466163746f72787200286a6176612e7574696c2e636f6e63757272656e742e6c6f636b732e5265656e7472616e744c6f636b6655a82c2cc86aeb0200014c000473796e6374002f4c6a6176612f7574696c2f636f6e63757272656e742f6c6f636b732f5265656e7472616e744c6f636b2453796e633b7870737200346a6176612e7574696c2e636f6e63757272656e742e6c6f636b732e5265656e7472616e744c6f636b244e6f6e6661697253796e63658832e7537bbf0b0200007872002d6a6176612e7574696c2e636f6e63757272656e742e6c6f636b732e5265656e7472616e744c6f636b2453796e63b81ea294aa445a7c020000787200356a6176612e7574696c2e636f6e63757272656e742e6c6f636b732e416273747261637451756575656453796e6368726f6e697a65726655a843753f52e30200014900057374617465787200366a6176612e7574696c2e636f6e63757272656e742e6c6f636b732e41627374726163744f776e61626c6553796e6368726f6e697a657233dfafb9ad6d6fa90200007870000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f4000007371007e00267371007e002a000000003f40000074000c72656469726563745f757269740026687474703a2f2f6c6f63616c686f73743a383038302f63726d2f77656c636f6d652e68746d6c74000e6f726967696e616c5f73636f706574000a726561642c777269746574000d726573706f6e73655f74797065740005746f6b656e740009636c69656e745f696474000b616e64726f69642d63726d74000573636f706574000a7265616420777269746570707871007e004e7371007e001f770c000000103f4000000000000078737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e0200007871007e001f770c000000103f40000000000002740004726561647400057772697465787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001400200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000377040000000371007e000f71007e001171007e00137871007e005f737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c7300000000000001400200024c000d72656d6f74654164647265737371007e000e4c000973657373696f6e496471007e000e78707400093132372e302e302e3174002034434136354145354237323044353438463435344136343831303731433735327073720041636f6d2e6a6c2e63726d2e73657276696365732e73656375726974792e43726d5573657244657461696c73536572766963652443726d5573657244657461696c7371a52ad054b29abc0200024c00126772616e746564417574686f72697469657371007e00044c00047573657274001a4c636f6d2f6a6c2f63726d2f73657276696365732f557365723b78707371007e000b0000000377040000000a71007e000f71007e001171007e00137873720018636f6d2e6a6c2e63726d2e73657276696365732e55736572000000000000000102000a5a0007656e61626c65645a001470726f66696c6550686f746f496d706f727465644c0009637573746f6d65727371007e00174c000966697273744e616d6571007e000e4c000269647400104c6a6176612f6c616e672f4c6f6e673b4c00086c6173744e616d6571007e000e4c000870617373776f726471007e000e4c001570726f66696c6550686f746f4d656469615479706571007e000e4c000a7369676e7570446174657400104c6a6176612f7574696c2f446174653b4c0008757365726e616d6571007e000e787001017372002f6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e50657273697374656e7453657486e4fda1f2eee0af0200014c000373657471007e00177872003e6f72672e68696265726e6174652e636f6c6c656374696f6e2e696e7465726e616c2e416273747261637450657273697374656e74436f6c6c656374696f6e87cca6e4d54cc52d02000949000a63616368656453697a655a000564697274795a000b696e697469616c697a65645a000d737065636a4c617a794c6f61644c00036b65797400164c6a6176612f696f2f53657269616c697a61626c653b4c00056f776e657271007e00054c0004726f6c6571007e000e4c001273657373696f6e466163746f72795575696471007e000e4c000e73746f726564536e617073686f7471007e006e7870ffffffff0000007372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000571007e006b740022636f6d2e6a6c2e63726d2e73657276696365732e557365722e637573746f6d6572737070707400044a6f736871007e00727400044c6f6e67740007636f7762656c6c740009696d6167652f706e67737200126a6176612e73716c2e54696d657374616d702618d5c80153bf650200014900056e616e6f737872000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000013f0698979878000000007400086a6f73686c6f6e67', NULL);