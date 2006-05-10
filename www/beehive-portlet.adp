<SCRIPT LANGUAGE="JavaScript">
<!-- Begin



function createCookie(name,value,days)
{
        if (days)
        {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                var expires = "; expires="+date.toGMTString();
        }
        else var expires = "";
        document.cookie = name+"="+value+expires+"; path=/";

}




// End -->
</script>


<if @shaded_p@ false>
 	 <if @one_instance_p@ true>

             
                         <if @comm_name@ eq "">
                        you can use this portlet only within a class
                         </if>
<else>

<if @fflag@ eq 1>                         
                                                
<u1>
<multiple name="session">
<li>
<%
# to fix the date format
set dates $session(datew)
set dates  [subst {[string range $dates 0 3]/[string range $dates 5 6]/[string range $dates 8 9] - [string range $dates 11 12]:[string range $dates 14 15]}]

 
%>

<if @session.dtype1@ not eq "checked">
<a href="@url@/beehive/flash/collaboration.html?user_id1=@user_id@&hurl=@url@/beehive/communication.tcl&se1=@session.number@&flashservera=@flashservera@/" onClick="createCookie('ppkcookie1',@user_id@,1);"> @session.titlew@  (@session.stype@)    @dates@ </a>
</if>
<else>
<a href="@url@/beehive/groupset?user_id1=@user_id@&hurl=@url@/beehive/communication.tcl&url=@url@&se1=@session.number@&mx=@session.mx@&roles=@session.roles@&flashservera=@flashservera@/" onClick="createCookie('ppkcookie1',@user_id@,1);"> @session.titlew@  (@session.stype@)    @dates@ </a>
</else>


</multiple>
</u1>
</if>
<else>
No created sessions
</else>


<br>



</else>
		  

                    
                        
  		  
  	 </if>
	<else>

		<list name="list_of_package_ids">
. 
		</list>

	</else>

</if>
<else>
  &nbsp;
</else>
