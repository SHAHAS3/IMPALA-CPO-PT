create or replace function join
(
    p_cursor sys_refcursor,
    p_del varchar2 := ':'
) return varchar2
is
    l_value   varchar2(32767);
    l_result  varchar2(32767);
begin
    loop
        fetch p_cursor into l_value;
        exit when p_cursor%notfound;
        if l_result is not null then
            l_result := l_result || p_del;
        end if;
        l_result := l_result || l_value;
    end loop;
    -- Added the close cursor statement C. Geyer 07-jul-10 to remedy the max open cursor exceeded issue
	-- I.MAN Ticket IM81553 
    close p_cursor;
    return l_result;
end join;
/

