--删除无效的资源
delete T_PUB_RES where yyid not in (
SELECT yyid from T_PUB_APP );


--删除无效的角色
delete from T_PUB_ROLE where yyid not in  (
select yyid from T_PUB_APP );

--删除无效的授权
delete from T_PUB_AUTH where yyid not in  (
select yyid from T_PUB_APP );

delete from T_PUB_AUTH where jsid not in (
select jsid from T_PUB_ROLE
)

delete from T_PUB_AUTH where yhbh not in (
select yhbh from T_PUB_USER
)
