<script LANGUAGE="JavaScript">
<!--
// Nannette Thacker http://www.shiningstar.net
function confirmSubmit()
{
var agree=confirm("Are you sure you wish to Delete?");
if (agree)
        return true ;
else
        return false ;
}
// -->
</script>

<if @flag@   eq 0>
<a href="@url@configure"><font color="#FF0000"><b>#beehive.Edit_configuration_info#  </B> </a></font>
</if>
<else>
<b> #beehive.Manage_existing_activity_sessions#   </b>
<ul>
<multiple name="sess">
<li>

<%
 

# to fix the date format
set dates $sess(datew)
set dates  [subst {[string range $dates 0 3]/[string range $dates 5 6]/[string range $dates 8 9] - [string range $dates 11 12]:[string range $dates 14 15]}]

 
%>
 @sess.titlew@   (@sess.stype@)    @dates@   |<a href="@url@create-edit-session?number=@sess.number@&edit_flage=0">#beehive.session_edit#  </a> |<a href="@url@delete?numberw=@sess.number@&titlew=@sess.titlew@" onClick="return confirmSubmit()">#beehive.session_delete#  </a> |<a href="@url@duplicate1?numberw=@sess.number@&titlew=@sess.titlew@">#beehive.session_duplicate#  </a> |<a href="@url@viewIneractions?se=@sess.number@&titlew=@sess.titlew@">#beehive.session_view_transcript#   </a> 


</multiple>

<br>
</ul>
<br>
    <b>#beehive.Create_new_activities# </b>


<br>
<br>#beehive.Create_new_activities_message#
<br> 
 
<br> 
 
 <br> <a href="@url@import?group=@comm_name@&url=@url@"><b> #beehive.Create_new_design#  </b></a> 

<br>
<br> 
    <a href="@url@new_technique?group=@comm_name@&newtechnique_flage=0"><b> #beehive.Create_new_activity_session#   </b></a> 
<br>

<br>
<a href="@url@configure"><b>#beehive.Edit_configuration_info#  </B> </a>



</else>


             
                        