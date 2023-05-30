-- -----------------------------------
-- 修改 代码生成表字段类型
-- -----------------------------------
ALTER TABLE "BLADEX"."BLADE_CODE" ALTER COLUMN "DATASOURCE_ID" RENAME TO "MODEL_ID";

COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."MODEL_ID" IS '数据模型主键';

-- -----------------------------------
-- 新增 代码生成表字段类型
-- -----------------------------------
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "TEMPLATE_TYPE" VARCHAR(32);
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "AUTHOR" VARCHAR(32);
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "SUB_MODEL_ID" VARCHAR(32);
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "SUB_FK_ID" VARCHAR(32);
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "TREE_ID" VARCHAR(32);
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "TREE_PID" VARCHAR(32);
ALTER TABLE "BLADEX"."BLADE_CODE" ADD "TREE_NAME" VARCHAR(64);

COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."TEMPLATE_TYPE" IS '模版类型';
COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."AUTHOR" IS '作者信息';
COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."SUB_MODEL_ID" IS '子表模型主键';
COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."SUB_FK_ID" IS '子表绑定外键';
COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."TREE_ID" IS '树主键字段';
COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."TREE_PID" IS '树父主键字段';
COMMENT ON COLUMN "BLADEX"."BLADE_CODE"."TREE_NAME" IS '树名称字段';


-- -----------------------------------
-- 新增模型设计菜单
-- -----------------------------------
INSERT INTO "BLADEX"."BLADE_MENU"("ID", "PARENT_ID", "CODE", "NAME", "ALIAS", "PATH", "SOURCE", "SORT", "CATEGORY", "ACTION", "IS_OPEN", "COMPONENT", "REMARK", "IS_DELETED")
VALUES ('1161272593873321996', '1123598815738675217', 'model', '数据模型设计', 'menu', '/tool/model', 'iconfont icon-biaodan', 3, 1, 0, 1, '', '', 0);


-- -----------------------------------
-- 新增 数据模型表
-- -----------------------------------
CREATE TABLE "BLADEX"."BLADE_MODEL"
(
    "ID" BIGINT IDENTITY(1, 1) NOT NULL,
    "DATASOURCE_ID" BIGINT,
    "MODEL_NAME" VARCHAR(50),
    "MODEL_CODE" VARCHAR(50),
    "MODEL_TABLE" VARCHAR(100),
    "MODEL_CLASS" VARCHAR(100),
    "MODEL_REMARK" VARCHAR(500),
    "CREATE_USER" BIGINT,
    "CREATE_DEPT" BIGINT,
    "CREATE_TIME" TIMESTAMP(0),
    "UPDATE_USER" BIGINT,
    "UPDATE_TIME" TIMESTAMP(0),
    "STATUS" INT,
    "IS_DELETED" INT,
    NOT CLUSTER PRIMARY KEY("ID")) STORAGE(ON "MAIN", CLUSTERBTR) ;

COMMENT ON TABLE "BLADEX"."BLADE_MODEL" IS '数据模型表';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."DATASOURCE_ID" IS '数据源主键';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."ID" IS '主键';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."MODEL_CLASS" IS '模型类名';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."MODEL_CODE" IS '模型编号';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."MODEL_NAME" IS '模型名称';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."MODEL_REMARK" IS '模型备注';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."MODEL_TABLE" IS '物理表名';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL"."UPDATE_USER" IS '修改人';

-- -----------------------------------
-- 新增 数据原型表
-- -----------------------------------
CREATE TABLE "BLADEX"."BLADE_MODEL_PROTOTYPE"
(
    "ID" BIGINT IDENTITY(1, 1) NOT NULL,
    "MODEL_ID" BIGINT,
    "JDBC_NAME" VARCHAR(50),
    "JDBC_TYPE" VARCHAR(20),
    "COMMENT" VARCHAR(500),
    "PROPERTY_TYPE" VARCHAR(20),
    "PROPERTY_ENTITY" VARCHAR(500),
    "PROPERTY_NAME" VARCHAR(50),
    "IS_LIST" INT,
    "IS_FORM" INT,
    "IS_ROW" INT,
    "COMPONENT_TYPE" VARCHAR(50),
    "DICT_CODE" VARCHAR(50),
    "IS_REQUIRED" INT,
    "IS_QUERY" INT,
    "QUERY_TYPE" VARCHAR(50),
    "CREATE_USER" BIGINT,
    "CREATE_DEPT" BIGINT,
    "CREATE_TIME" TIMESTAMP(0),
    "UPDATE_USER" BIGINT,
    "UPDATE_TIME" TIMESTAMP(0),
    "STATUS" INT,
    "IS_DELETED" INT,
    NOT CLUSTER PRIMARY KEY("ID")) STORAGE(ON "MAIN", CLUSTERBTR) ;

COMMENT ON TABLE "BLADEX"."BLADE_MODEL_PROTOTYPE" IS '数据原型表';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."COMMENT" IS '注释说明';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."COMPONENT_TYPE" IS '组件类型';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."DICT_CODE" IS '字典编码';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."ID" IS '主键';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."IS_FORM" IS '表单显示';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."IS_LIST" IS '列表显示';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."IS_QUERY" IS '查询配置';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."IS_REQUIRED" IS '是否必填';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."IS_ROW" IS '独占一行';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."JDBC_NAME" IS '物理列名';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."JDBC_TYPE" IS '物理类型';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."MODEL_ID" IS '模型主键';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."PROPERTY_ENTITY" IS '实体类型引用';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."PROPERTY_NAME" IS '实体列名';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."PROPERTY_TYPE" IS '实体类型';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."QUERY_TYPE" IS '查询类型';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADEX"."BLADE_MODEL_PROTOTYPE"."UPDATE_USER" IS '修改人';

