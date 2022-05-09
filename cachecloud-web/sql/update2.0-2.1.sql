create table app_import(
    id bigint auto_increment
    primary key,
    app_id bigint null comment '目标应用id',
    instance_info text null comment '源redis实例信息',
    redis_password varchar (200) null comment '源redis密码',
    status int null comment '迁移状态：PREPARE(0, "准备", "应用导入-未开始"),
    START(1, "进行中...", "应用导入-开始"),
    ERROR(2, "error", "应用导入-出错"),
    VERSION_BUILD_START(11, "进行中...", "新建redis版本-进行中"),
    VERSION_BUILD_ERROR(12, "error", "新建redis版本-出错"),
    VERSION_BUILD_END(20, "成功", "新建redis版本-完成"),
    APP_BUILD_INIT(21, "准备就绪", "新建redis应用-准备就绪"),
    APP_BUILD_START(22, "进行中...", "新建redis应用-进行中"),
    APP_BUILD_ERROR(23, "error", "新建redis应用-出错"),
    APP_BUILD_END(30, "成功", "新建redis应用-完成"),
    MIGRATE_INIT(31, "准备就绪", "数据迁移-准备就绪"),
    MIGRATE_START(32, "进行中...", "数据迁移-进行中"),
    MIGRATE_ERROR(33, "error", "数据迁移-出错"),
    MIGRATE_END(3, "成功", "应用导入-成功")',
    step int null comment '导入阶段',
    create_time timestamp default CURRENT_TIMESTAMP not null,
    update_time timestamp default CURRENT_TIMESTAMP null,
    migrate_id bigint null comment '数据迁移id',
    mem_size int null comment '目标应用内存大小，单位G',
    redis_version_name varchar (20) null comment '目标应用redis版本，格式：redis-x.x.x',
    app_build_task_id bigint null comment '目标应用部署任务id',
    source_type int null comment '源redis类型：7:cluster, 6:sentinel, 5:standalone'
);